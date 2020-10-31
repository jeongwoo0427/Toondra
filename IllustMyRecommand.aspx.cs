using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class IllustMyRecommand : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null) Response.Redirect("Illustshow.aspx");

        DisplayIllust();


    }



    public void DisplayIllust()
    {
        DataSet ds = (new IllustDao()).GetRecommandedIllust(Session["userid"].ToString());

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
            lblMessage.Text = "상세보기 권한이 없습니다.";
            return null;
        }
    }

    public string GetTitle(object title)
    {
        return title.ToString().Substring(0, 8);
    }

    public string GetNickname(object nickname)
    {
        return nickname.ToString().Substring(0, 10);
    }



    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Illustlist.aspx");
    }

    protected void dlIllust_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}