using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class Chapterview : System.Web.UI.Page
{
    ToonChapterDo tcdo;
    int tno;
    int tcno;
    protected void Page_Load(object sender, EventArgs e)
    {


        tno = int.Parse((Request["tno"].ToString()));
        tcno = int.Parse((Request["tcno"].ToString()));

        tcdo = (new ToonChapterDao()).GetChapterDetails(tcno, true);

        if (!IsPostBack)
        {

            if (Request["tno"] == null || Request["tcno"] == null) Response.Redirect("Toonlist.aspx");

            




            lblTitle.Text = tcdo.Chaptertitle;
            imgMain.ImageUrl = "~/ChapterImage/" + tno.ToString() + "_" + tcno.ToString() + tcdo.Chapterimagefilename.Substring(tcdo.Chapterimagefilename.IndexOf("."));


            if ((Session["userid"].ToString() == tcdo.Author) || ((new MemberDao()).GetUgradeOfUserid(Session["userid"].ToString()) >= (new MemberDao()).GetUgradeOfGradename("관리자")))
            {
                ibtnDelete.Visible = true;
            }

            DisplayReply(0);
        }

    }

    private void DisplayReply(int page)
    {

        DataSet ds = new ReplyDao().GetReplyList(tcno, "chapterTbl");
        grvChapterReply.DataSource = ds;
        grvChapterReply.PageIndex = page;
        grvChapterReply.DataBind();
    }



    protected void Button5_Click(object sender, EventArgs e)
    {

        (new ReplyDao()).InsertReply(tcno, "chapterTbl", Session["userid"].ToString(), txtReply.Text);
        DisplayReply(0);
        txtReply.Text = "";
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        //삭제를 위한 메소드
        /*
        string path = Request.PhysicalApplicationPath + "ChapterImage/" + tno.ToString() + "_" + tcno.ToString() + tcdo.Chapterimagefilename.Substring(tcdo.Chapterimagefilename.IndexOf("."));

        if (File.Exists(path))
        {
            File.Delete(path);
        }

        (new ToonChapterDao()).RemoveChapter(tcno);


        ClientScriptManager sm = Page.ClientScript;

        string script
             = "<script>window.opener='nothing';window.open('','_parent','');window.close();</script>";

        sm.RegisterStartupScript(this.GetType(), "sm", script);*/


        Response.Redirect("Chapterwrite.aspx?tno="+tno+"&tcno=" + tcno+"&md=2");


    }




    protected void grvChapterReply_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        DisplayReply(e.NewPageIndex);


    }

    protected void Button3_Click(object sender, EventArgs e)
    {

        if (Session["userid"] == null)
        {
            lblMessage.Text = "로그인 후 이용해주세요";

            return;
        }

        if ((new ToonDao()).CheckLikeable(tno, Session["userid"].ToString()))
        {

            (new ToonDao()).InsertToonLike(tno, Session["userid"].ToString());



            

        }
        else
        {
            lblMessage2.Text = "이미 이 웹툰에 좋아요를 하였습니다.";
            return;
        }


    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        string Nextno = (new ToonChapterDao()).ChageToonPage(tno, tcno, "NEXT_NO");
        if(Nextno == "")
        {
            ClientScript.RegisterStartupScript(typeof(Page), "alert", "<script language=JavaScript>alert('가장 최근 챕터입니다...');</script>");

            return;
        }

        Response.Redirect("Chapterview.aspx?tno=" + tno + "&tcno=" + Nextno);

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string Nextno = (new ToonChapterDao()).ChageToonPage(tno, tcno, "PREV_NO");
        if (Nextno == "")
        {
            ClientScript.RegisterStartupScript(typeof(Page), "alert", "<script language=JavaScript>alert('마지막 페이지입니다.');</script>");
            return;
        }

        Response.Redirect("Chapterview.aspx?tno="+tno+"&tcno=" + Nextno);
    }
}