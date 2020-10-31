using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{

    static bool isIdDuChecked = false;



    MemberDao mDao;



    protected void Page_Load(object sender, EventArgs e)
    {

        mDao = new MemberDao();


        if (!IsPostBack)
        {




            
            



            switch (int.Parse(Request["md"]))
            {

                //새로쓰기
                case 1:

                    btnRegister.Text = "회원가입";

                    txtId.ReadOnly = false;

                    break;

                //수정모드
                case 2:

                    btnIdDupl.Visible = false;

                    txtId.ReadOnly = true;

                    btnRegister.Text = "수정완료";

                    MemberDo mDo = (new MemberDao()).GetDetails(Session["userid"].ToString());

                    txtId.Text = mDo.Userid;

                    txtNickname.Text = mDo.Nickname;

                    txtEmail.Text = mDo.Email;

                    txtTwitter.Text = mDo.Twitterlink;

                    txtFacebook.Text = mDo.Facebooklink;


                    break;

                default: return;
            }

           

        }


    }







    protected void btnIdDupl_Click1(object sender, EventArgs e)
    {
   

        if(txtId.Text.Length <= 0)
        {
            lblMessage.Text = "사용자 ID를 입력하세요..";
            lblMessage.ForeColor = Color.Red;
            this.txtId.Focus();
            return;
        }

        if(isIdDuChecked = mDao.VerifyUserID(txtId.Text))
        {
            lblMessage.Text = "사용 가능한 ID입니다.";
            lblMessage.ForeColor = Color.Blue;
            this.txtPasswd1.Focus();
        }
        else
        {
            lblMessage.Text = "이 사용자 ID는 사용할 수 없습니다..";
            this.txtId.Text = "";
            lblMessage.ForeColor = Color.Red;
            this.txtId.Focus();


        }


    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        string fname = "";
     

        if (FileUpload1.HasFile)
        {


            fname = this.GetFilename(FileUpload1.FileName);
       

        }

        string tlink = txtTwitter.Text.Trim();
        string flink = txtFacebook.Text.Trim();
        if (tlink == "")
        {
            tlink = null;
        }
        if (flink == "")
        {
            flink = null;
        }


        MemberDo mDo = new MemberDo(
                  txtId.Text,
                  txtPasswd1.Text,
                  txtNickname.Text,
                  txtEmail.Text,
                  "",
                  true,
                  1,
                  fname,
                  tlink,
                  flink
                  );



        if (fname != "")
        {
            string uFname = mDo.Userid + fname.Substring(fname.IndexOf("."));
            FileUpload1.SaveAs(Server.MapPath(@"ProfileImage\" + uFname));
        }



        MemberDao.mode = 1;



        switch (int.Parse(Request["md"]))
        {
            case 1:

                if (!isIdDuChecked)
                {
                    lblMessage.Text = "ID 중복검사를 실행해 주세요..";
                    return;
                }
              
                mDao.RegisterUserUsingQuery(mDo);
                Response.Redirect("Login.aspx");
                break;


            case 2:


                (new MemberDao()).UpdateUser(mDo, Session["userid"].ToString());

                Response.Redirect("Profilepage.aspx?uid=" + mDo.Userid);

                break;


        }




       



    }

    protected void Button2_Click1(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }


    private string GetFilename(string path)
    {
        return path.Substring(path.LastIndexOf(@"\") + 1);
    }

}