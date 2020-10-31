using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Activities.Expressions;

public partial class Illustwrite : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            if (Session["userid"] == null) Response.Redirect("Illustlist.aspx");

         
            switch (int.Parse(Request["md"]))
            {

                //새로쓰기
                case 1:
                    txtName.Text = Session["userId"].ToString();
                    break;

                //수정모드
                case 2:

                  
                    IllustDo ido = (new IllustDao()).GetIllustDetails(int.Parse(Request["ino"]), false);

                    txtName.Text = ido.Author;
                    txtTitle.Text = ido.Illusttitle;
                    txtSummary.Text = ido.Illustsummary;

                    break;
            }

        }

    }



    private string GetFilename(string path)
    {
        return path.Substring(path.LastIndexOf(@"\") + 1);
    }


    protected void ibtnList_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Illustlist.aspx");
    }

    protected void ibtnWrite1_Click(object sender, ImageClickEventArgs e)
    {


        string fname = "";

        if (FileUpload1.HasFile)
        {
            fname = this.GetFilename(FileUpload1.FileName);

        }
      



        IllustDo ido2 = new IllustDo(txtName.Text, txtTitle.Text, txtSummary.Text, fname);


        switch (int.Parse(Request["md"]))
        {
            case 1:


                int no = (new IllustDao()).InsertNewIllust(ido2);

                if (fname != "")
                {
                    string uFname = no.ToString() + fname.Substring(fname.IndexOf("."));
                    FileUpload1.SaveAs(Server.MapPath(@"IllustImages\" + uFname));
                }
                break;



            case 2:


                (new IllustDao()).UpdateIllust(ido2, int.Parse(Request["ino"]));




                if (fname != "")
                {
                    string uFname = Request["ino"].ToString() + fname.Substring(fname.IndexOf("."));
                    FileUpload1.SaveAs(Server.MapPath(@"IllustImages\" + uFname));
                }


                break;


        }





        Response.Redirect("Illustlist.aspx");
    }
}