using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Bbslist : System.Web.UI.Page
{

    static BbsInfo bInfo; 



    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request["id"] == null) Response.Redirect("profile.aspx");


        if (!IsPostBack)
        {
            int bbsid = int.Parse(Request["id"]);

            bInfo = (new BbsDao()).GetBbsInfo(bbsid);


            if ((new MemberDao()).CheckAuth(Session["userid"], bInfo.WriteAuth))
            {
                ibtnWrite.Visible = true;
            }

            lblBbsTitle.Text += ">" + bInfo.BbsName;

            this.DisplayBbsList();
        }



    }




    private void DisplayBbsList()
    {
        this.DisplayBbsList(null, null, 0);
    }


    private void DisplayBbsList(string ktype, string kword, int iPage)
    {
        grvBbs.DataSource = (new BbsDao()).GetBbsList(bInfo.TableName, bInfo.BbsId, ktype, kword);

        grvBbs.PageIndex = iPage;
        grvBbs.DataBind();

    }


    public string GetReplyIcon(object obj)
    {
        int depth = (int)obj;
        if (depth == 0) return "";

        string shtml = "";

        for (int i = 0; i < depth; i++)
            shtml += "&nbsp;&nbsp;&nbsp;&nbsp;";

        shtml += "<img src='Images\\bbsReply.jpg' height='13px' width='13px'>";

        return shtml;

    }


    public string GetShowUrl(object no)
    {
        if ((new MemberDao()).CheckAuth(Session["userid"], bInfo.ReadAuth))
        {
            return "bbsShow.aspx?id=" + bInfo.BbsId + "&no=" + no.ToString();
        }
        else
        {
            lblMessage.Text = "상세보기 권한이 없습니다.";
            return null;
        }
    }

    protected void ibtnWrite_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("bbsWrite.aspx?id=" + bInfo.BbsId + "&md=0");
    }

    protected void ibtnSearch_Click(object sender, EventArgs e)
    {
        this.Search(0);
    }


    private void Search(int iPage)
    {
        string ktype;

        if (txtKeyword.Text.Length == 0)
        {
            ktype = null;
        }

        else
        {
            if (ddlType.Text == "제목") ktype = "title";
            else if (ddlType.Text == "내용") ktype = "contents";
            else ktype = "nickname";

        }

        this.DisplayBbsList(ktype, txtKeyword.Text, iPage);

    }

    protected void grvBbs_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        this.Search(e.NewPageIndex);
    }
}