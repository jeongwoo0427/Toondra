using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Toonlist : System.Web.UI.Page
{

    string selectedWeek = "all";

    protected void Page_Load(object sender, EventArgs e)
    {


        selectedWeek = Request["wk"];


        switch (selectedWeek)
        {
            case "all":
                lblToonTitle.Text = "웹툰 (전체)";
                break;
            case "0":
                lblToonTitle.Text = "웹툰 (월요일)";
                break;
            case "1":
                lblToonTitle.Text = "웹툰 (화요일)";
                break;
            case "2":
                lblToonTitle.Text = "웹툰 (수요일)";
                break;
            case "3":
                lblToonTitle.Text = "웹툰 (목요일)";
                break;
            case "4":
                lblToonTitle.Text = "웹툰 (금요일)";
                break;
            case "5":
                lblToonTitle.Text = "웹툰 (토요일)";
                break;
            case "6":
                lblToonTitle.Text = "웹툰 (일요일)";
                break;
        }

                DisplayToonlist();

    }



    private void DisplayToonlist()
    {
        DataSet ds = (new ToonDao()).GetToonList(selectedWeek);

        dlToons.DataSource = ds;

        DbMan.Close();

        dlToons.DataBind();
    }


    public string GetShowUrl(object tno)
    {
        return "Chapterlist.aspx?&tno=" + tno.ToString();

    }

    public string GetImageUrl(object tno, object fname)
    {
        if (fname.ToString().Trim() == "")
        {
            return @"~\ToonLogo\defaultimage.png";
        }
        else
        {
            //return @"~\ToonLogos\" + tno.ToString() + "_" + fname.ToString().Substring(fname.ToString().IndexOf("."));
            return @"~\ToonLogo\" + tno.ToString() + fname.ToString().Substring(fname.ToString().IndexOf(".")) + "?" + DateTime.Now.Ticks.ToString();
            //return @"~\ToonLogos\3.png";
        }
    }


    public string GetTitle(object title)
    {
        return title.ToString().Substring(0, 10);
    }

}