using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Activities.Expressions;

public partial class Toonwrite : System.Web.UI.Page
{

    static int no = 0;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            if (Session["userid"] == null) Response.Redirect("Toonlist.aspx");

            if (Request["md"] == null) return;

            ibtnWrite.Visible = true;

            switch (int.Parse(Request["md"]))
            {

                //새로쓰기
                case 1:
                    txtName.Text = Session["userId"].ToString();
                    break;

                //수정모드
                case 2:

                    ToonDo tDo = (new ToonDao()).GetDetails(int.Parse(Request["no"]));

                    if (Session["userid"].ToString() != tDo.Author) return;

                    txtName.Text = tDo.Author;
                    txtTitle.Text = tDo.Title;
                    txtContent.Text = tDo.Summary;
                    RadioButtonList1.SelectedIndex = int.Parse(tDo.Week.ToString().Trim());

                    no = int.Parse(Request["no"]);

                    break;
            }

        }

    }

    protected void ibtnWrite_Click(object sender, ImageClickEventArgs e)
    {

        
        string fname = "";
        int fsize = 0;

        if (FileUpload1.HasFile)
        {
            fname = this.GetFilename(FileUpload1.FileName);
            fsize = (int)FileUpload1.FileContent.Length;

        }

   
        ToonDo tDo = new ToonDo(txtTitle.Text, txtName.Text, txtContent.Text, fname, fsize, RadioButtonList1.SelectedIndex.ToString());


        switch (int.Parse(Request["md"]))
        {
            case 1:
                no = (new ToonDao()).NewToonArticle(tDo);

                break;

        

            case 2:

                (new ToonDao()).UpdateArticle(tDo, no);
                break;
        }


        if(fname != "")
        {
            string uFname = no.ToString() + fname.Substring(fname.IndexOf("."));
            FileUpload1.SaveAs(Server.MapPath(@"ToonLogo\" + uFname));
        }


        Response.Redirect("Toonlist.aspx");

    }

    private string GetFilename(string path)
    {
        return path.Substring(path.LastIndexOf(@"\") + 1);
    }

    protected void ibtnList_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Toonlist.aspx");
    }
}