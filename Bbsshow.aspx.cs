using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Activities.Expressions;

public partial class Bbsshow : System.Web.UI.Page
{



    static int no;
    static BbsInfo bInfo;
    static BbsDo bDo;

    int page=0;

    DataSet ds;



 

    protected void Page_Load(object sender, EventArgs e)
    {

      

        if (!IsPostBack)
        {


            if (Request.UrlReferrer != null) Session["returnUrl"] = Request.UrlReferrer.ToString();
            else
                Session["returnUrl"] = "profile.aspx";

            if (Request["id"] == null) Response.Redirect("profile.aspx");

            int bbsId = int.Parse(Request["id"].ToString());
            bInfo = (new BbsDao()).GetBbsInfo(bbsId);





            if (!(new MemberDao()).CheckAuth(Session["userid"], bInfo.ReadAuth)) Response.Redirect("profile.aspx");

            if (Request["no"] == null) Response.Redirect("profile.aspx");

            no = int.Parse(Request["no"].ToString());
            bDo = (new BbsDao()).GetDetails(bInfo.TableName, no, true);


            //글작성자만 글을 수정 대문자 주의
            if (Session["userId"].ToString() == bDo.Author)
                ibtnModify.Visible = true;


            if ((Session["userid"].ToString() == bDo.Author) || ((new MemberDao()).GetUgradeOfUserid(Session["userid"].ToString()) >= (new MemberDao()).GetUgradeOfGradename("관리자")))
                ibtnDelete.Visible = true;



            if (bInfo.HyperlinkAbility)
            {
                lblHyperlink.Visible = true;
                hlUrl.Visible = true;
            }
            else
            {
                lblHyperlink.Visible = false;
                hlUrl.Visible = false;
            }


            if (bInfo.ReplyAbility) ibtnReply.Visible = true;
            else ibtnReply.Visible = false;


            lblAuthor.Text = bDo.Nickname + "(" + bDo.Author + ")";
            lblContents.Text = bDo.Contents;
            lblHits.Text = bDo.Hits.ToString();
            lbltitle.Text = bDo.Title;
            lblUploadDate.Text = bDo.Uploadtime;



            if (bDo.Filename.Length > 0)
            {
                lblFname.Text = bDo.Filename;

                if (bDo.Filesize >= 1000000)
                    lblFsize.Text = "(" + (bDo.Filesize / 1000000).ToString() + "MB)";
                else if (bDo.Filesize > 1000)
                    lblFsize.Text = "(" + (bDo.Filesize / 1000).ToString() + "KB)";
                else
                    lblFsize.Text = "(" + bDo.Filesize.ToString() + "B)";



                Session["path"] = "Bbs\\" + bInfo.TableName + "_" + no.ToString() + bDo.Filename.Substring(bDo.Filename.IndexOf("."));

                Session["fname"] = bDo.Filename;

                hlDownload.Visible = true;
            }



            if (bDo.LinkUrl.Length < 4)
            {
                hlUrl.Visible = false;
                return;
            }
            if (bDo.LinkUrl.ToString().Substring(0, 4) == "http")
            {
                hlUrl.NavigateUrl = bDo.LinkUrl;
                hlUrl.Text = bDo.LinkUrl;
            }
            else
            {
                hlUrl.NavigateUrl = null;
                hlUrl.Text = "URL 형식이 잘못되었습니다.";
            }


            page = 0;

        }

        

        Page.LoadComplete += new EventHandler(Page_LoadComplete);

    }

    void Page_LoadComplete(object sender, EventArgs e)
    {
        DisplayReply();

    }



    //댓글 띄우기
   

    private void DisplayReply()
    {

        ds = new ReplyDao().GetReplyList(no, "bbsTbl");
        grvDiaryReply.DataSource = ds;
        grvDiaryReply.PageIndex = page;
        grvDiaryReply.DataBind();
    }




    protected void ibtnReply_Click(object sender, ImageClickEventArgs e)
    {
        string surl = string.Format("bbsWrite.aspx?id={0}&md=2&gno={1}&gdp={2}&gps={3}", bInfo.BbsId, bDo.GrpNo, bDo.GrpDepth, bDo.GrpPosition);

        Response.Redirect(surl);
    }

    protected void ibtnDelete_Click(object sender, ImageClickEventArgs e)
    {
        (new ReplyDao()).DeleteArticleReplies(no, "bbsTbl");

        (new BbsDao()).RemoveArticle(bInfo.TableName, no);



        if (bDo.Filesize > 0)
        {
            string path = Request.PhysicalApplicationPath + "Bbs\\" + bInfo.TableName + "_" + no.ToString() + bDo.Filename.Substring(bDo.Filename.IndexOf("."));


            if (File.Exists(path))
            {
                File.Delete(path);
            }


            
        }
        Response.Redirect(Session["returnUrl"].ToString());
    }






    protected void ibtnList_Click(object sender, ImageClickEventArgs e)
    {

        
        Response.Redirect("Bbslist.aspx?id="+Request["id"].ToString());

    }

    protected void ibtnModify_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("bbsWrite.aspx?id=" + bInfo.BbsId + "&md=1&no=" + no);
    }

    protected void grvDiaryReply_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        page = e.NewPageIndex;


    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        (new ReplyDao()).InsertReply(no, "bbsTbl", Session["userid"].ToString(), txtReply.Text);
        page = 0;
        DisplayReply();
    }
}