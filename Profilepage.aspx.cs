using System;
using System.Activities.Expressions;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Profilepage : System.Web.UI.Page
{

    static MemberDo mdo;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request["uid"] == null) Response.Redirect("Login.aspx");



        if (Session["userid"] == null) Response.Redirect("Login.aspx");


     
            if (Session["userid"] != null)
            {
                if (Request["uid"] == Session["userid"].ToString())
                {
                    btnFollow.Visible = false;
                    btnPModify.Visible = true;
                    btnMyFollow.Visible = true;
                }
                else
                {
                    btnFollow.Visible = true;
                    btnPModify.Visible = false;
                    btnMyFollow.Visible = false ;
                }
            }
            else
            {
                btnFollow.Visible = false;
                btnPModify.Visible = false;
                btnMyFollow.Visible = false;
            }
            mdo = (new MemberDao()).GetDetails(Request["uid"]);

            lblNickname.Text = mdo.Nickname;

            hlTwitter.Text = mdo.Twitterlink.TrimEnd();
            hlTwitter.NavigateUrl = mdo.Twitterlink.TrimEnd();
            hlFacebook.Text = mdo.Facebooklink.TrimEnd();
            hlFacebook.NavigateUrl = mdo.Facebooklink.TrimEnd();

            RefreshFollow();





        if (mdo.Profilefname != "")
            {
                imgProfile.ImageUrl = "/ProfileImage/" + Request["uid"] + mdo.Profilefname.ToString().Substring(mdo.Profilefname.ToString().IndexOf("."))+"?" + DateTime.Now.Ticks.ToString();


            }


            DisplayChapterList();

        DisplayDateIllust();
       
    }

    protected void btnPModify_Click(object sender, EventArgs e)
    {

       // MemberDao.mode = 2;
        Response.Redirect("Register.aspx?md=2");


        
        


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

    public string GetShowChapterUrl(object tno ,object tcno)
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

    

    private void DisplayChapterList()
    {

        grvChapters.DataSource = (new ToonChapterDao()).GetChapterListbyUid(Request["uid"]);

        DbMan.Close();

        grvChapters.DataBind();

    }


    private void DisplayDateIllust()
    {

        DataSet ds = (new IllustDao()).GetDateIllustList(Request["uid"]);

        dlIllust.DataSource = ds;

        DbMan.Close();

        dlIllust.DataBind();

    

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
            return @"~\IllustImages\" + ino.ToString() + fname.ToString().Substring(fname.ToString().IndexOf("."));
            //return @"~\ToonLogos\3.png";
        }
    }



    public string GetShowUrl(object ino)
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



    protected void btnFollow_Click(object sender, EventArgs e)
    {
        (new MemberDao()).FollowUser(Session["userid"].ToString(), Request["uid"]);

        

        RefreshFollow();

    }
    private void RefreshFollow()
    {
        lblFollower.Text = (new MemberDao()).CountFollower(Request["uid"]).ToString();
        lblFollowing.Text = (new MemberDao()).CountFollow(Request["uid"]).ToString();

        if (Session["userid"] != null)
        {
         

            if ((new MemberDao()).CheckFollow(Session["userid"].ToString(), Request["uid"]))
                btnFollow.Text = "팔로우";
            else btnFollow.Text = "언팔로우";


        }
        else
        {
            btnFollow.Visible = false;
        }
        DbMan.Close();

    }



    protected void dlIllust_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void btnMyFollow_Click(object sender, EventArgs e)
    {
        Response.Redirect("Followlist.aspx");
    }

    protected void grvChapters_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvChapters.PageIndex = e.NewPageIndex;
    }
}