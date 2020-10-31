<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style5 {
            margin-left: 0px;
        }
        .auto-style11 {
            width: 900px;
        }
        .auto-style12 {
            width: 703px;
        }
        .auto-style13 {
            width: 271px;
        }
        .auto-style14 {
            width: 271px;
            height: 23px;
        }
        .auto-style15 {
            width: 703px;
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="auto-style11">

        <tr>
            <td colspan="3" align="left" valign="middle">

                <asp:Label ID="Label2" runat="server" BackColor="#FFCC99" Text="&nbsp로그인"  Font-Bold="true"
                    Width="900px" Font-Size="Medium"></asp:Label>

            </td>


        </tr>

        <tr>
            <td  align="right" valign="middle" class="auto-style13">
                <asp:Label ID="Label1" runat="server" Text="사용자ID" Font-Size="Small"></asp:Label>
            </td>
            <td  align="left" valign="middle" class="auto-style12">

                <asp:TextBox ID="txtid" runat="server" CssClass="auto-style5" Width="265px"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="RequiredFieldValidator" ForeColor="Red" Font-Size="Small" 
                    ControlToValidate="txtid">사용자 ID를 입력하세요..</asp:RequiredFieldValidator>

            </td>
          


        </tr>

         <tr>
            <td  align="right" valign="middle" class="auto-style13">
                <asp:Label ID="Label3" runat="server" Text="비밀번호" Font-Size="Small"></asp:Label>
            </td>
            <td  align="left" valign="middle" class="auto-style12">

                <asp:TextBox ID="txtPasswd" runat="server" CssClass="auto-style5" Width="265px" 
                    TextMode="Password"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="RequiredFieldValidator" ForeColor="Red" Font-Size="Small" 
                    ControlToValidate="txtPasswd">비밀번호를 입력하세요..</asp:RequiredFieldValidator>

            </td>
          


        </tr>

           <tr>
            <td  align="right" valign="middle" class="auto-style14">
            </td>
            <td  align="left" valign="middle" class="auto-style15">

                <asp:ImageButton ID="ibtnLogin" runat="server" 
                    ImageUrl="~/Images/btn_login.png" Width="100px" 
                    OnClick="ibtnLogin_Click" />
&nbsp;<asp:ImageButton ID="ibtnRegister" runat="server" ImageUrl="~/Images/btn_register.png" 
                    Width="100px" CausesValidation="False" OnClick="ibtnRegister_Click" />

            &nbsp;&nbsp;
                <asp:Label ID="lblMessage" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label>

            </td>
          


        </tr>


    </table>

</asp:Content>

