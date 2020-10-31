using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        DisplayRanklist(0);



        if (Session["userid"] != null)
        {

            DisplayChapterListbyTarget();

            DisplayRandomIllust();
        }
    }



    private void DisplayRanklist(int searchmode)
    {


        DataSet ds = (new IllustDao()).GetRankedIllust(searchmode,4);

        dlIllust.DataSource = ds;

        DbMan.Close();

        dlIllust.DataBind();



    }

    public string GetShowUrl(object ino)
    {
        if ((new MemberDao()).CheckAuth(Session["userid"], 1))
        {
            return "Illustshow.aspx?ino=" + ino;
        }
        else
        {
            lblMessage1.Text = "상세보기 권한이 없습니다.";
            return null;
        }
    }

    public string GetImageUrl(object ino, object fname)
    {
        if (fname.ToString().Trim() == "")
        {
            return @"~\ToonLogo\defaultimage.png";
        }
        else
        {
            //return @"~\ToonLogos\" + tno.ToString() + "_" + fname.ToString().Substring(fname.ToString().IndexOf("."));
            return @"~\IllustImages\" + ino.ToString() + fname.ToString().Substring(fname.ToString().IndexOf(".")) + "?" + DateTime.Now.Ticks.ToString();
            //return @"~\ToonLogos\3.png";
        }
    }















    private void DisplayRandomIllust()
    {

        DataSet ds = (new IllustDao()).GetIllustByFollowedUserId(Session["userid"].ToString());

        dlFollowedIllust.DataSource = ds;

        DbMan.Close();

        dlFollowedIllust.DataBind();



    }




    public string GetIllustImageUrl(object ino, object fname)
    {
        if (fname.ToString().Trim() == "")
        {
            return @"~\ToonLogo\defaultimage.png";
        }
        else
        {
            //return @"~\ToonLogos\" + tno.ToString() + "_" + fname.ToString().Substring(fname.ToString().IndexOf("."));
            return @"~\IllustImages\" + ino.ToString() + fname.ToString().Substring(fname.ToString().IndexOf("."));
            //return @"~\ToonLogos\3.png";
        }
    }



    public string GetIllustShowUrl(object ino)
    {
        if ((new MemberDao()).CheckAuth(Session["userid"], 1))
        {
            return "Illustshow.aspx?ino=" + ino;
        }
        else
        {
      
            return null;
        }
    }



















    public string GetShowToonUrl(object tno)
    {

        if ((new MemberDao()).CheckAuth(Session["userid"], 1))
        {

            DbMan.Close();
            return "Chapterlist.aspx?tno=" + tno;



        }
        else
        {

            return null;
        }

    }

    public string GetShowChapterUrl(object tno, object tcno)
    {
        if ((new MemberDao()).CheckAuth(Session["userid"], 1))
        {
            return "Chapterview.aspx?tno=" + tno + "&tcno=" + tcno;
        }
        else
        {

            return null;
        }
    }



    private void DisplayChapterListbyTarget()
    {

        grvChapters.DataSource = (new ToonChapterDao()).GetChapterListByFollowTargetId(Session["userid"].ToString());

        DbMan.Close();

        grvChapters.DataBind();

    }


}