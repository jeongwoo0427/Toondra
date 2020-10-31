<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Toonwrite.aspx.cs" Inherits="Toonwrite" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table style="width:900px">


        <tr>
            <td colspan="3" style="text-align:center; vertical-align:middle;">

                <asp:Label ID="Label1" runat="server" Font-Size="Large" Text="웹툰 만들기" 
                    BackColor="#CCCCFF" Width="900px"></asp:Label>

            </td>
            
        </tr>



         <tr>
            <td  style="text-align:right; vertical-align:middle;font-family:'맑은 고딕'; " 
                 class="auto-style6">
                <asp:Label ID="label2" runat="server" Text="작가" Width="95px" style="font-family:'맑은 고딕';" Font-Size="7pt"></asp:Label>
         </td>
             <td  style="text-align:center; vertical-align:middle;font-family:'맑은 고딕'; " 
                 class="auto-style4">

                 <asp:TextBox ID="txtName" runat="server" Width="600px" ReadOnly="True"></asp:TextBox>

            </td>

             <td>

                 &nbsp;</td>
        </tr>


        
         <tr>
           <td  style="text-align:right; vertical-align:middle;font-family:'맑은 고딕'; " 
                 class="auto-style6">

                <asp:Label ID="label4" runat="server" Text="툰 제목" Width="95px" style="font-family:'맑은 고딕';" Font-Size="7pt"></asp:Label>

            </td>
             <td class="auto-style5">

                 <asp:TextBox ID="txtTitle" runat="server" Width="600px" MaxLength="20" ></asp:TextBox>

            </td>
             <td>

                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle" ErrorMessage="제목을 입력하세요" ForeColor="Red" Width="125px">*</asp:RequiredFieldValidator>

            </td>
        </tr>


        <tr>
            <td  style="text-align:right; vertical-align:middle;font-family:'맑은 고딕'; " 
                class="auto-style6">

                <asp:Label ID="Label5" runat="server" Text="설명" Font-Size="7pt"></asp:Label>

            </td>
              <td  style="text-align:center; vertical-align:middle;font-family:'맑은 고딕'; " 
                class="auto-style4">

                 <asp:TextBox ID="txtContent" runat="server" Width="600px" MaxLength="500" 
                      Height="140px" TextMode="MultiLine"></asp:TextBox>

            </td>
            <td>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtContent" ErrorMessage="내용을 입력하세요" ForeColor="Red" Width="125px">*</asp:RequiredFieldValidator>

            </td>


        </tr>

        
        <tr>
            <td  style="text-align:right; vertical-align:middle;font-family:'맑은 고딕'; " 
                class="auto-style6">

                <asp:Label ID="Label6" runat="server" Text="대표사진" Font-Size="7pt"></asp:Label>

            </td>
              <td  style="text-align:center; vertical-align:middle;font-family:'맑은 고딕'; " 
                class="auto-style4">


                  <asp:FileUpload ID="FileUpload1" runat="server" Width="600px"  />


                  <br />
                  10M를 초과하면 업로드가 불가능 합니다</td>
            <td>

                &nbsp;</td>


        </tr>


   <tr>
            <td  style="text-align:right; vertical-align:middle;font-family:'맑은 고딕'; " 
                class="auto-style6">

                <asp:Label ID="Label7" runat="server" Font-Size="7pt" Text="연재요일"></asp:Label>

            </td>
              <td  style="text-align:center; vertical-align:middle;font-family:'맑은 고딕'; " 
                class="auto-style4">


                  <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" Font-Size="Small">
                      <asp:ListItem>월</asp:ListItem>
                      <asp:ListItem>화</asp:ListItem>
                      <asp:ListItem>수</asp:ListItem>
                      <asp:ListItem>목</asp:ListItem>
                      <asp:ListItem>금</asp:ListItem>
                      <asp:ListItem>토</asp:ListItem>
                      <asp:ListItem>일</asp:ListItem>
                  </asp:RadioButtonList>


                  <br />
                
            </td>
            <td>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="RadioButtonList1" ErrorMessage="요일을 선택해주세요.." ForeColor="Red"></asp:RequiredFieldValidator>
            </td>


        </tr>
        
        <tr>
            <td  style="text-align:right; vertical-align:middle;font-family:'맑은 고딕'; " 
                class="auto-style6">

                &nbsp;</td>
              <td  style="text-align:center; vertical-align:middle;font-family:'맑은 고딕'; " 
                class="auto-style4">


                  <asp:ImageButton ID="ibtnWrite" runat="server" Height="35px" ImageUrl="~/Images/btn_write.png" Width="100px" OnClick="ibtnWrite_Click" />
&nbsp;
                  <asp:ImageButton ID="ibtnList" runat="server" Height="35px" ImageUrl="~/Images/btn_list.png" Width="100px" OnClick="ibtnList_Click" CausesValidation="False" />
                  <asp:Label ID="lblMessage" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label>
            </td>
            <td>

            </td>


        </tr>
        
        <tr>
            <td  style="text-align:right; vertical-align:middle;font-family:'맑은 고딕'; " 
                class="auto-style6">

                &nbsp;</td>
              <td  style="text-align:center; vertical-align:middle;font-family:'맑은 고딕'; " 
                class="auto-style4">


                  <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" Width="495px" style="text-align:left;" Font-Size="Small" />
            </td>
            <td>

            </td>


        </tr>

  


    </table>



</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style4 {
            height: 27px;
            width: 630px;
        }
        .auto-style5 {
            width: 630px;
        }
        .auto-style6 {
            height: 27px;
            width: 122px;
        }
    </style>
</asp:Content>


