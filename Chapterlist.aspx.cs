using System;
using System.Activities.Expressions;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Chapterlist : System.Web.UI.Page
{

    static ToonDo tdo;
    static int tno;


    protected void Page_Load(object sender, EventArgs e)
    {





        PageLoadDisplay();


    }


    public string GetImageUrl()
    {

        if (tdo.Logofilename.ToString().Trim() == "")
        {
            return @"~\ToonLogo\defaultimage.png";
        }
        else
        {
            //return @"~\ToonLogos\" + tno.ToString() + "_" + fname.ToString().Substring(fname.ToString().IndexOf("."));
            return @"~\ToonLogo\" + tno.ToString() + tdo.Logofilename.ToString().Substring(tdo.Logofilename.ToString().IndexOf(".")) + "?" + DateTime.Now.Ticks.ToString();
            //return @"~\ToonLogos\3.png";
        }

    }

    public string GetShowUrl(object tcno)
    {
        if ((new MemberDao()).CheckAuth(Session["userid"], 1))
        {
            DbMan.Close();
            return "Chapterview.aspx?tno=" + tno + "&tcno=" + tcno;
        }
        else
        {
            DbMan.Close();
            lblMessage.Text = "상세보기 권한이 없습니다.";
            return null;
        }

       

    }


    public void PageLoadDisplay()
    {


        tno = int.Parse(Request["tno"]);


        tdo = (new ToonDao()).GetDetails(tno);

        imgToon.ImageUrl = GetImageUrl();


        if (Session["userid"] != null)
        {

            if (tdo.Author == Session["userid"].ToString())
            {
                btnToonModify.Visible = true;
                btnChapterUpload.Visible = true;
            }

        }


        if (Request["tno"] == null) Response.Redirect("Toonlist.aspx");






        tdo = (new ToonDao()).GetDetails(tno);


        lblTitle.Text = tdo.Title;
        lblAuthor.Text = tdo.Author;
        lblContent.Text = tdo.Summary;
        lblLikeCount.Text = tdo.Likecount.ToString();
        lblWeek.Text = CheckWeeks(tdo.Week);

  



        DisplayChapterList();
    }



    private void DisplayChapterList()
    {

      
      
        DataSet dataset = (new ToonChapterDao()).GetChapterList(tno);


        grvChapters.DataSource = dataset;

        DbMan.Close();

        grvChapters.DataBind();

    }

    private string CheckWeeks(string week)
    {

        switch (week)
        {
            case "0":
                week = "월";
                break;
            case "1":
                week = "화";
                break;
            case "2":
                week = "수";
                break;
            case "3":
                week = "목";
                break;
            case "4":
                week = "금";
                break;
            case "5":
                week = "토";
                break;
            case "6":
                week = "일";
                break;
        }

        return week;

    }


    protected void Button2_Click(object sender, EventArgs e)
    {

        if (Session["userid"] == null)
        {
            lblMessage.Text = "로그인 후 이용해주세요";

            return;
        }

        if((new ToonDao()).CheckLikeable(tno, Session["userid"].ToString())){

            (new ToonDao()).InsertToonLike(tno, Session["userid"].ToString());



            PageLoadDisplay();

        }
        else
        {
            lblMessage.Text = "이미 좋아요를 하였습니다.";
            return;
        }



    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Toonwrite.aspx?no="+tno+"&md=2");
    }

    protected void btnChapterUpload_Click(object sender, EventArgs e)
    {

        Response.Redirect("Chapterwrite.aspx?tno=" + tno+"&md=1");

    }

    protected void Button4_Click(object sender, EventArgs e)
    {


        Response.Redirect("Profilepage.aspx?uid=" + tdo.Author);
    }

    protected void Button3_Click(object sender, EventArgs e)
    {

        Response.Redirect("Toonlist.aspx");
    }
}