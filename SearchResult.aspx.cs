using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Runtime.CompilerServices;
using System.Activities.Expressions;

public partial class SearchResult : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["kwd"] == null) Response.Redirect("Home.aspx");


        if (Session["kwd"].ToString().TrimEnd() == "") Response.Redirect("Home.aspx");

        if (!IsPostBack)
        {

            Displaytoonlist(0);
            Displayillustlist(0);
            Displayuserlist(0);
        }

    }




    public void Displaytoonlist(int page)
    {
        DataSet ds = (new SearchEngine()).SearchChapters(int.Parse(Request["smd"]), Session["kwd"].ToString());

        grvChapters.DataSource = ds;

        DbMan.Close();

        grvChapters.PageIndex = page;

        grvChapters.DataBind();


    }

    public void Displayillustlist(int page)
    {
        DataSet ds = (new SearchEngine()).SearchIllusts(int.Parse(Request["smd"]), Session["kwd"].ToString());

        grvIllust.DataSource = ds;

        DbMan.Close();

        grvIllust.PageIndex = page;

        grvIllust.DataBind();
    }

    public void Displayuserlist(int page)
    {
        DataSet ds = (new SearchEngine()).SearchMembers(Session["kwd"].ToString());

        grvUsers.DataSource = ds;

        DbMan.Close();

        grvUsers.PageIndex = page;

        grvUsers.DataBind();
    }





    public string GetAuthorShowUrl(Object userid)
    {

        if ((new MemberDao()).CheckAuth(Session["userid"],1))
        {
            string spage = "Profilepage.aspx?uid=" + userid.ToString().TrimEnd();

            return spage;

        }

        else
        {
            lblMessage1.Text = "상세보기 권한이 없습니다.";
            return null;
        }
    }

    public string GetChapterShowUrl(Object toonno, object tcno)
    {
        if ((new MemberDao()).CheckAuth(Session["userid"], 1))
        {
            string spage = "Chapterlist.aspx?tno=" + toonno.ToString().TrimEnd();

            return spage;

        }

        else
        {
            lblMessage1.Text = "상세보기 권한이 없습니다.";
            return null;
        }
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
            return @"~\IllustImages\" + ino.ToString() + fname.ToString().Substring(fname.ToString().IndexOf(".")) + "?" + DateTime.Now.Ticks.ToString();
            //return @"~\ToonLogos\3.png";
        }

    }


    public string GetIllustShowUrl(object ino)
    {
        if ((new MemberDao()).CheckAuth(Session["userid"], 1))
        {
            string spage = "Illustshow.aspx?ino=" + ino.ToString().TrimEnd();
            return spage;

        }

        else
        {
            lblMessage2.Text = "상세보기 권한이 없습니다.";
            return null;
        }
    }











    public string GetUserImageUrl(object userid, object fname)
    {
        if (fname.ToString().Trim() == "")
        {
            return @"~\ToonLogo\defaultimage.png";
        }
        else
        {
            //return @"~\ToonLogos\" + tno.ToString() + "_" + fname.ToString().Substring(fname.ToString().IndexOf("."));
            return @"~\ProfileImage\" + userid.ToString().TrimEnd() + fname.ToString().Substring(fname.ToString().IndexOf(".")) + "?" + DateTime.Now.Ticks.ToString();
            //return @"~\ToonLogos\3.png";
        }

    }

    public string GetUserShowUrl(object userid)
    {
        if ((new MemberDao()).CheckAuth(Session["userid"], 1))
        {
            string spage = "Profilepage.aspx?uid=" + userid.ToString().TrimEnd();
            return spage;

        }

        else
        {
            lblMessage3.Text = "상세보기 권한이 없습니다.";
            return null;
        }
    }




    protected void grvIllust_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void grvChapters_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Displaytoonlist(e.NewPageIndex);
    }

    protected void grvIllust_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Displayillustlist(e.NewPageIndex);
    }

    protected void grvUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Displayuserlist(e.NewPageIndex);
    }
}