using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        TextBox1.Attributes.Add("onkeypress", "if(event.keyCode == 13){" + this.Page.ClientScript.GetPostBackEventReference(Button1, null) + ";return false;}");


        if (!IsPostBack)
        {
            if (Session["userid"] == null)
            {
                ibtnToggle.ImageUrl = "~/Images/btn_login.png";
                ibtnMyPage.Visible = false;
                lblLogin.Text = "";

            }
            else
            {
                ibtnToggle.ImageUrl = "~/Images/btn_logout.png";
                MemberDao mDao = new MemberDao();
                ibtnMyPage.Visible = true;

                lblLogin.Text = mDao.GetNickname(Session["userid"].ToString()) + "님의";

                
            }

        }



    }

    protected void ibtnToggle_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            Session["userid"] = null;

            ibtnToggle.ImageUrl = "~/Images/btn_login.png";
            lblLogin.Text = "";
        }


    }

    protected void ibtnDiary_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Bbslist.aspx?id=11");
    }

    protected void ibtnStudyRoom_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Toonlist.aspx");
    }

    protected void ibtnMyPage_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Profilepage.aspx?uid=" + Session["userid"].ToString());
    }

    protected void ibtnBbs_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Illustlist.aspx");
    }

    protected void ibtnProfile_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Home.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["kwd"] = TextBox1.Text;

        Response.Redirect("SearchResult.aspx?smd=" + DropDownList1.SelectedIndex.ToString());
    }
}
