using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Illustlist : System.Web.UI.Page
{

    public static DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {

        
        if (!IsPostBack)
        {



    

            DisplayRandomIllust();

        }
       


    }

    
    private void ShuffleIllustList()
    {
        ds = (new IllustDao()).GetRandomIllustList();
        DbMan.Close();

    }


    private void DisplayRandomIllust()
    {
      
        dlIllust.DataSource = ds;

        dlIllust.DataBind();



    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        ShuffleIllustList();

        DisplayRandomIllust();

        DbMan.Close();
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
            return "Illustshow.aspx?ino="+ino;
        }
        else
        {
            lblMessage.Text = "상세보기 권한이 없습니다.";
            return null;
        }
    }


    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Illustwrite.aspx?md=1");
    }



    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("IllustMyRecommand.aspx");
    }



    protected void Button4_Click1(object sender, EventArgs e)
    {
        Response.Redirect("Illustshowbyrank.aspx");
    }
}