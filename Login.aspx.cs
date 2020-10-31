using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtid.Attributes.Add("onkeypress", "if(event.keyCode == 13){" + this.Page.ClientScript.GetPostBackEventReference(ibtnLogin, null) + ";return false;}");

        txtPasswd.Attributes.Add("onkeypress", "if(event.keyCode == 13){" + this.Page.ClientScript.GetPostBackEventReference(ibtnLogin, null) + ";return false;}");


        if (!IsPostBack)
        {
           // this.txtPasswd.Attributes["onKeyPress"] = "if(event.keyCode==13) {" + Page.GetPostBackEventReference(this.ibtnLogin) + "; return false;";
           //dk

            if(Request.Url != null)
            {

                //이 코드를 사용하면 회원가입 - 로그인 할때 회원가입페이지 가지는 멍청한 경우가 생깁니다..ㅜ
                // Session["returnUrl"] = Request.UrlReferrer.ToString();


                // 회원가입,아이디찾기 등등 페이지 를 처리한 후 에 그 보다 더 이전 페이지로 이동해야 함!
                string caller = Request.UrlReferrer.ToString();
                bool isMemberRelatedPage =
                    caller.IndexOf("Register.aspx") >= 0 ||
                    caller.IndexOf("FindUserId.aspx") >= 0 ||
                    caller.IndexOf("SetNewPasswd.aspx") >= 0 ||
                    caller.IndexOf("ModifyUserInfo.aspx") >= 0;
                if (!isMemberRelatedPage) Session["returnUrl"] = caller;
            }
        }


    }

    protected void ibtnLogin_Click(object sender, ImageClickEventArgs e)
    {
        MemberDao mDao = new MemberDao();
        if(mDao.Authenticate(txtid.Text, txtPasswd.Text))
        {
            Session["userid"] = txtid.Text;
            Response.Redirect(Session["returnUrl"].ToString());

        }
        else
        {
            lblMessage.Text = "사용자의 ID와 비밀번호를 확인해 주세요..";
        }


    }

    protected void ibtnRegister_Click(object sender, ImageClickEventArgs e)
    {
       // MemberDao.mode = 1;
        Response.Redirect("Register.aspx?md=1");
    }
}