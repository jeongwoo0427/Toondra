using System;
using System.Activities.Expressions;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Chapterwrite : System.Web.UI.Page
{
    static int no;
    static int tno;
    static ToonDo tdo;
    static ToonChapterDo tcdo;

    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {

            if (Session["userid"] == null) Response.Redirect("Toonlist.aspx");

            if (Request["md"] == null) return;



            ibtnWrite.Visible = true;

            tno = int.Parse(Request["tno"]);


            tdo = (new ToonDao()).GetDetails(tno);




            if (tdo.Author != Session["userid"].ToString()) Response.Redirect("Toonlist.aspx");

            switch (int.Parse(Request["md"]))
            {

                //새로쓰기
                case 1:
                    txtName.Text = Session["userId"].ToString();
                    break;

                //수정모드
                case 2:

                    tcdo = (new ToonChapterDao()).GetChapterDetails(int.Parse(Request["tcno"]), false);

                    txtName.Text = tcdo.Author;
                    txtTitle.Text = tcdo.Chaptertitle;

                    //수정중


                    break;
            }

        }

    }

    protected void ibtnWrite_Click(object sender, ImageClickEventArgs e)
    {



        string fname = "";

        if (FileUpload1.HasFile)
        {
            fname = this.GetFilename(FileUpload1.FileName);
        
        }


        ToonChapterDo tcdo2 = new ToonChapterDo(tno,txtTitle.Text, fname);

        switch (int.Parse(Request["md"]))
        {
            case 1:
                no = (new ToonChapterDao()).InsertNewChapter(tcdo2);
                if (fname != "")
                {
                    string uFname = tcdo2.Tno.ToString() + "_" + no.ToString() + fname.Substring(fname.IndexOf("."));
                    FileUpload1.SaveAs(Server.MapPath(@"ChapterImage\" + uFname));
                }
                break;



            case 2:

               (new ToonChapterDao()).UpdateChapter(tcdo2, int.Parse(Request["tcno"]));
                if (fname != "")
                {
                    string uFname = tcdo2.Tno.ToString() + "_" + Request["tcno"].ToString() + fname.Substring(fname.IndexOf("."));
                    FileUpload1.SaveAs(Server.MapPath(@"ChapterImage\" + uFname));
                }
                break;
        }


       


        Response.Redirect("Chapterlist.aspx?tno="+tno);

    }

    private string GetFilename(string path)
    {
        return path.Substring(path.LastIndexOf(@"\") + 1);
    }

    protected void ibtnList_Click(object sender, ImageClickEventArgs e)
    {

    }
}