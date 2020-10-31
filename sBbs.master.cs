using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sBbs : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ibtnFree_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Bbslist.aspx?id=11");
    }

    protected void ibtnQna_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Bbslist.aspx?id=12");
    }

    protected void IbtnNotice_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Bbslist.aspx?id=13");
    }
}
