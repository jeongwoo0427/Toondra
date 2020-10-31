using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sChapter : System.Web.UI.MasterPage
{

    int tno;
    ToonDo tdo;

    protected void Page_Load(object sender, EventArgs e)
    {

        tno = int.Parse(Request["tno"]);


        tdo = (new ToonDao()).GetDetails(tno);

        imgToon.ImageUrl = GetImageUrl();

        if (tdo.Author == Session["userid"].ToString()) btnChapterUpload.Visible = true;
        

       

    }



   
    public string GetImageUrl()
    {
       
            if (tdo.Logofilename.ToString().Trim() == "")
            {
                return @"~\ToonLogo\defaultimage.png";
            }
            else
            {
                //return @"~\ToonLogos\" + tno.ToString() + "_" + fname.ToString().Substring(fname.ToString().IndexOf("."));
                return @"~\ToonLogo\" + tno.ToString() + tdo.Logofilename.ToString().Substring(tdo.Logofilename.ToString().IndexOf("."));
                //return @"~\ToonLogos\3.png";
            }
        
    }



    protected void Button1_Click(object sender, EventArgs e)
    {

        Response.Redirect("Toonlist.aspx");

    }
}
