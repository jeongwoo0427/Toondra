using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Illustshow : System.Web.UI.Page
{

    static IllustDo ido;
    static int ino;


    protected void Page_Load(object sender, EventArgs e)
    {

        RefreshPage();


        if (!IsPostBack)
        {
            DisplayReply(0);
            
        }


    }


    public void RefreshPage()
    {

        if (Session["userid"] == null) Response.Redirect("Illustlist.aspx");

        if (Request["ino"] == null) Response.Redirect("Illustlist.aspx");

        ino = int.Parse(Request["ino"]);

        ido = (new IllustDao()).GetIllustDetails(ino, true);

        lblAuthor.Text = ido.Author;
        imgIllust.ImageUrl = "~/IllustImages/" + ino.ToString() + ido.Illustfname.Substring(ido.Illustfname.IndexOf(".")) + "?" + DateTime.Now.Ticks.ToString();

        lblTitle.Text = ido.Illusttitle;
        lblSummary.Text = ido.Illustsummary;
        lblLikeCount.Text = ido.Illustlikecount.ToString();

        RefreshRecommand();

        if ((Session["userid"].ToString() == ido.Author) || ((new MemberDao()).GetUgradeOfUserid(Session["userid"].ToString()) >= (new MemberDao()).GetUgradeOfGradename("관리자")))
        {
            btnDelete.Visible = true;
            btnModify.Visible = true;
        }
    }


    private void DisplayReply(int page)
    {
        DataSet ds = new ReplyDao().GetReplyList(ino, "illustTbl");
        grvIllustReply.DataSource = ds;
        grvIllustReply.PageIndex = page;
        grvIllustReply.DataBind();
    }










    protected void Button5_Click(object sender, EventArgs e)
    {
        (new ReplyDao()).InsertReply(ino, "illustTbl", Session["userid"].ToString(), txtReply.Text);
        DisplayReply(0);
        txtReply.Text = "";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Profilepage.aspx?uid="+ido.Author);
    }

    protected void grvIllustReply_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        DisplayReply(e.NewPageIndex);
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Illustlist.aspx");
    }

    protected void btnModify_Click(object sender, EventArgs e)
    {
        Response.Redirect("Illustwrite.aspx?ino=" + ino+"&md=2");
    }

    protected void Button5_Click1(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            lblMessage.Text = "로그인 후 이용해주세요";

            return;
        }

        if ((new IllustDao()).CheckLikeable(ino, Session["userid"].ToString()))
        {

            (new IllustDao()).InsertIllustLike(ino, Session["userid"].ToString());


            RefreshPage();


        }
        else
        {
            lblMessage.Text = "이미 이 작품에 좋아요를 하였습니다.";
            return;
        }

       

    }

    protected void btnFollow_Click(object sender, EventArgs e)
    {
     

    }
    private void RefreshRecommand()
    {

        if(Session["userid"] != null){

            if ((new IllustDao()).CheckRecommand(Session["userid"].ToString(), Request["ino"]))
                btnRecommand.Text = "찜";
            else btnRecommand.Text = "찜취소";


        }
        DbMan.Close();

    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        (new IllustDao()).AddRecommand(Session["userid"].ToString(), Request["ino"]);



        RefreshRecommand();
    }
}