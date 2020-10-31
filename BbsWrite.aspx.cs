using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class BbsWrite : System.Web.UI.Page
{


    static int no;
    static BbsInfo bInfo;
    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {

            if (Request.UrlReferrer != null)
            {

                //이전에 경유한 주소를 가져오고 그 주소에 bbsShow.aspx 문자가 1개 이상 포함되면 1 아니면 -1 반환

                if (Request.UrlReferrer.ToString().IndexOf("Bbsshow.aspx") <= 0)
                    Session["returnUrl"] = Request.UrlReferrer.ToString(); //포함 안됐을경우니깐 그냥 이전 경유했던 Url 자체를 세션[돌아갈주소]에 넣는다


                //포함됐을 경우 아무것도 안하고 세션[돌아갈주소] 를 냅둔다.
            }
            else
                Session["returnUrl"] = "profile.aspx";

            if (Request["id"] == null) Response.Redirect("profile.aspx");

            int bbsId = int.Parse(Request["id"]);
            bInfo = (new BbsDao()).GetBbsInfo(bbsId);

            if (!(new MemberDao()).CheckAuth(Session["userid"], bInfo.WriteAuth)) Response.Redirect("profile.aspx");

            if (bInfo.HyperlinkAbility)
            {
                txtHyperlink.Visible = true;
                lblHyperlink.Visible = true;
            }
            else
            {
                txtHyperlink.Visible = false;
                lblHyperlink.Visible = false;
            }


            if (Request["md"] == null) return;

            ibtnWrite.Visible = true;

            switch (int.Parse(Request["md"]))
            {
                case 0:
                case 2:
                    txtId.Text = Session["userId"].ToString();
                    break;

                case 1:
                    BbsDo bDo = (new BbsDao()).GetDetails(bInfo.TableName, int.Parse(Request["no"]), false);

                    if (Session["userid"].ToString() != bDo.Author) return;

                    txtId.Text = bDo.Author;
                    txtTitle.Text = bDo.Title;
                    txtContents.Text = bDo.Contents;
                    if (bInfo.HyperlinkAbility) txtHyperlink.Text = bDo.LinkUrl;
                    break;
            }


        }
    }

    protected void ibtnWrite_Click(object sender, ImageClickEventArgs e)
    {

        string fname = "";
        int fsize = 0;

        if (FileUpload1.HasFile)
        {
      

            fname = this.GetFilename(FileUpload1.FileName);
            fsize = (int)FileUpload1.FileContent.Length;

        }

        BbsDo bDo = new BbsDo(txtTitle.Text, txtContents.Text, txtId.Text, fname, fsize, txtHyperlink.Text, 0, 0, 0, bInfo.BbsId);

        switch (int.Parse(Request["md"]))
        {
            case 0:
                no = (new BbsDao()).InsertNewArticle(bInfo.TableName, bDo);
                break;

            case 1:
                no = int.Parse(Request["no"]);
                (new BbsDao()).UpdateArticle(bInfo.TableName, bDo, no);
                break;

            case 2:
                bDo.GrpNo = int.Parse(Request["gno"].ToString());
                bDo.GrpDepth = int.Parse(Request["gdp"].ToString());
                bDo.GrpPosition = int.Parse(Request["gps"].ToString());
                no = (new BbsDao()).InsertReply(bInfo.TableName, bDo);
                break;
        }


        if (fname != "")
        {
            string uFname = bInfo.TableName + "_" + no.ToString() + fname.Substring(fname.IndexOf("."));
            FileUpload1.SaveAs(Server.MapPath(@"Bbs\" + uFname));
        }


        Response.Redirect("Bbslist.aspx?id=" + Request["id"].ToString());
    }

    private string GetFilename(string path)
    {
        return path.Substring(path.LastIndexOf(@"\") + 1);
    }

    protected void ibtnList_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Bbslist.aspx?id=" + Request["id"].ToString());
    }
}