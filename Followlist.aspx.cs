using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Followlist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["userid"] == null) Response.Redirect("Home.aspx");

        if (!IsPostBack)
        {




            DisplayList(0);
        }




    }




    public void DisplayList(int page)
    {

        DataSet ds = (new MemberDao()).GetFollowingList(Session["userid"].ToString());

        grvFollowing.DataSource = ds;

        DbMan.Close();

        grvFollowing.PageIndex = page;

        grvFollowing.DataBind();



     
    }


    public string GetShowUrl(object uid)
    {
        if ((new MemberDao()).CheckAuth(Session["userid"], 1))
        {
            return "Profilepage.aspx?uid=" + uid;
        }
        else
        {
          
            return null;
        }
    }

    public string GetImageUrl(object uid, object fname)
    {
        if (fname.ToString().Trim() == "")
        {
            return @"~\ToonLogo\defaultimage.png";
        }
        else
        {

            //Label1.Text = uid.ToString();
            //return @"~\ToonLogos\" + tno.ToString() + "_" + fname.ToString().Substring(fname.ToString().IndexOf("."));
            return @"~\ProfileImage\" + uid.ToString().TrimEnd() + fname.ToString().Substring(fname.ToString().IndexOf(".")) + "?" + DateTime.Now.Ticks.ToString();
            //return @"~\ToonLogos\3.png";
        }
    }



    protected void grvFollowing_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        DisplayList(e.NewPageIndex);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Profilepage.aspx?uid=" + Session["userid"].ToString().TrimEnd());
    }
}