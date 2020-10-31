using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class stoons : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

       
        if ((new MemberDao()).CheckAuth(Session["userid"], 1)) btnToonupload.Visible = true;


        else btnToonupload.Visible = false;
        
      
    }

    protected void btnToonupload_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Toonwrite.aspx?md=1");
    }

    protected void ibtnAllweek_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Toonlist.aspx?wk=all");
    }

    protected void ibtnMonday_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Toonlist.aspx?wk=0");
    }

    protected void ibtnTuesday_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Toonlist.aspx?wk=1");
    }

    protected void IbtnWednesday_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Toonlist.aspx?wk=2");
    }

    protected void IbtnThursday_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Toonlist.aspx?wk=3");
    }

    protected void IbtnFriday_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Toonlist.aspx?wk=4");
    }

    protected void IbtnSaturday_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Toonlist.aspx?wk=5");
    }

    protected void IbtnSunday_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Toonlist.aspx?wk=6");
    }
}
