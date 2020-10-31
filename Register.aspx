<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style4 {
            height: 39px;
            width: 404px;
        }
        .auto-style9 {
            width: 400px;
            height: 19px;
        }
        .auto-style10 {
            height: 18px;
        }
        .auto-style11 {
            width: 122px;
            height: 33px;
        }
        .auto-style13 {
            width: 400px;
            height: 33px;
        }
        .auto-style14 {
            height: 39px;
            width: 122px;
        }
        .auto-style15 {
            height: 18px;
            width: 122px;
        }
        .auto-style16 {
            height: 19px;
            width: 122px;
        }
        .auto-style17 {
            width: 122px;
        }
        .auto-style18 {
            height: 39px;
            width: 378px;
        }
        .auto-style19 {
            height: 18px;
            width: 378px;
        }
        .auto-style21 {
            width: 378px;
        }
        .auto-style22 {
            width: 378px;
            height: 19px;
        }
        .auto-style23 {
            width: 378px;
            height: 33px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    <table width="900px">
        <tr>
            <td colspan="3" align="left" valign="middle" class="auto-style10">
                <asp:Label ID="Label1" runat="server" BackColor="#FFCC99" Text=" 회원가입" 
                    Width="900px" Font-Bold="True" Font-Size="Large"></asp:Label>
            </td>
        </tr>
          <tr>
            <td colspan="3" align="left" valign="middle" style="font-size:small;">회원가입을 위해 모두 입력하시오.</td>
        </tr>


        <tr>
            <td align="right" valign="middle" class="auto-style14">사용자ID</td>
              <td align="left" valign="middle" class="auto-style18">
                  <asp:TextBox ID="txtId" runat="server" Width="350px"></asp:TextBox>
            </td>
              <td style="width:400px; height: 39px;" align="left" valign="middle">
                  <asp:Button ID="btnIdDupl" runat="server" CausesValidation="False" Text="ID중복검사" Width="73px" Font-Size="5pt" Height="15px" OnClick="btnIdDupl_Click1" />
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtId" ErrorMessage="사용자ID를 입력해 주세요" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
             <tr>
            <td align="right" valign="middle" class="auto-style15">비밀번호</td>
              <td align="left" valign="middle" class="auto-style19">
                  <asp:TextBox ID="txtPasswd1" runat="server" TextMode="Password" Width="350px"></asp:TextBox>
                 </td>
              <td style="width:400px; height: 18px;" align="left" valign="middle">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPasswd1" ErrorMessage="암호를 입력하시오" ForeColor="Red"></asp:RequiredFieldValidator>
                 </td>
        </tr>


        <tr>
              <td align="right" valign="middle" class="auto-style16">비밀번호 확인</td>
              <td align="left" valign="middle" class="auto-style22">
                  <asp:TextBox ID="txtPasswd2" runat="server" TextMode="Password" Width="350px"></asp:TextBox>
              </td>
              <td style="width:400px; height: 19px;" align="left" valign="middle">
                  <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPasswd1" ControlToValidate="txtPasswd2" ErrorMessage="암호가 일치하지 않습니다" ForeColor="Red"></asp:CompareValidator>
              </td>
        </tr>

              <tr>
              <td align="right" valign="middle" class="auto-style16">벌명</td>
              <td align="left" valign="middle" class="auto-style22">
                  <asp:TextBox ID="txtNickname" runat="server" Width="350px"></asp:TextBox>
                  </td>
              <td style="width:400px; height: 19px;" align="left" valign="middle">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                      ControlToValidate="txtNickname" ErrorMessage="닉네임을 입력하시오." ForeColor="Red"></asp:RequiredFieldValidator>
                  </td>
        </tr>

        
              <tr>
              <td align="right" valign="middle" class="auto-style16">이메일</td>
              <td align="left" valign="middle" class="auto-style22">
                  <asp:TextBox ID="txtEmail" runat="server" Width="350px"></asp:TextBox>
                  </td>
              <td align="left" valign="middle" class="auto-style9">
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                      ControlToValidate="txtEmail" ErrorMessage="이메일 형식이 올바르지 않습니다." ForeColor="Red" 
                      ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                  </td>
            </tr>

        
              <tr>
              <td align="right" valign="middle" class="auto-style16">프로필사진</td>
              <td align="left" valign="middle" class="auto-style22">
                  <asp:FileUpload ID="FileUpload1" runat="server" Width="350px" />
                  </td>
              <td align="left" valign="middle" class="auto-style9">
                  &nbsp;</td>
            </tr>



              <tr>
              <td align="right" valign="middle" class="auto-style16">트위터주소(선택)</td>
              <td align="left" valign="middle" class="auto-style22">
                  <asp:TextBox ID="txtTwitter" runat="server" Width="350px"></asp:TextBox>
                  </td>
              <td align="left" valign="middle" class="auto-style9"></td>
        </tr>

              <tr>
              <td align="right" valign="middle" class="auto-style11">페이스북 주소(선택)</td>
              <td align="left" valign="middle" class="auto-style23">
                  <asp:TextBox ID="txtFacebook" runat="server" Width="350px"></asp:TextBox>
                  </td>
              <td align="left" valign="middle" class="auto-style13">
                  </td>
        </tr>

           

              <tr>
              <td align="right" valign="middle" class="auto-style17">&nbsp;</td>
              <td align="left" valign="middle" class="auto-style21">
                  <asp:Button ID="btnRegister" runat="server" Text="회원가입" Width="97px" OnClick="btnRegister_Click" />
&nbsp;&nbsp;&nbsp; <asp:Button ID="btnToLogin" runat="server" Text="로그인 화면으로" Width="196px" 
                      CausesValidation="False" OnClick="Button2_Click1" />
                  </td>
              <td style="width:400px" align="left" valign="middle">
                  <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                  </td>
        </tr>



              <tr>
              <td align="right" valign="middle" class="auto-style17">&nbsp;</td>
                     <td align="left" valign="middle" class="auto-style21">
                         <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                  </td>
                 
        </tr>

    </table>

</asp:Content>

