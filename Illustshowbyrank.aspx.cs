using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Illustshowbyrank : System.Web.UI.Page
{

    //0: 주간

    //1: 월간

    //2: 연간

    //3: 최신순


    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            DisplayRanklist(0);

        }
    }



   
    private void DisplayRanklist(int searchmode)
    {


        DataSet ds = (new IllustDao()).GetRankedIllust(searchmode, 20);

        grvIllust.DataSource = ds;

        DbMan.Close();

        grvIllust.DataBind();
        


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

    protected void Button1_Click(object sender, EventArgs e)
    {
        DisplayRanklist(0);
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        DisplayRanklist(1);

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        DisplayRanklist(2);
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        DisplayRanklist(3);
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Illustlist.aspx");
    }

 
}