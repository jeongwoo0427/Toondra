<%@ Page Title="" Language="C#" MasterPageFile="~/sBbs.master" AutoEventWireup="true" CodeFile="BbsWrite.aspx.cs" Inherits="BbsWrite" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table style="width:725px">


        <tr>
            <td colspan="3" style="text-align:center; vertical-align:middle;">

                <asp:Label ID="Label1" runat="server" Font-Size="Large" Text="게시판 글쓰기" BackColor="#FFCC99" Width="725px"></asp:Label>

            </td>
            
        </tr>



         <tr>
            <td  style="text-align:right; vertical-align:middle;font-family:'맑은 고딕'; height:27px; width:100px">
                <asp:Label ID="label2" runat="server" Text="작성자" Width="95px" style="font-family:'맑은 고딕';" Font-Size="7pt"></asp:Label>
         </td>
             <td  style="text-align:center; vertical-align:middle;font-family:'맑은 고딕'; height:27px; width:502px">

                 <asp:TextBox ID="txtId" runat="server" Width="495px" ReadOnly="True"></asp:TextBox>

            </td>

             <td>

                 &nbsp;</td>
        </tr>


        
         <tr>
           <td  style="text-align:right; vertical-align:middle;font-family:'맑은 고딕'; height:27px; width:100px">

                <asp:Label ID="label4" runat="server" Text="제목" Width="95px" style="font-family:'맑은 고딕';" Font-Size="7pt"></asp:Label>

            </td>
             <td style="width: 502px">

                 <asp:TextBox ID="txtTitle" runat="server" Width="495px"></asp:TextBox>

            </td>
             <td>

                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtTitle" ErrorMessage="제목을 입력하세요" ForeColor="Red" Width="125px">*</asp:RequiredFieldValidator>

            </td>
        </tr>


        <tr>
            <td  style="text-align:right; vertical-align:middle;font-family:'맑은 고딕'; height:27px; width:100px">

                <asp:Label ID="Label5" runat="server" Text="내용" Font-Size="7pt"></asp:Label>

            </td>
              <td  style="text-align:center; vertical-align:middle;font-family:'맑은 고딕'; height:27px; width:502px">

                 <asp:TextBox ID="txtContents" runat="server" Width="495px" MaxLength="500" Height="140px" TextMode="MultiLine"></asp:TextBox>

            </td>
            <td>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtContents" ErrorMessage="내용을 입력하세요" ForeColor="Red" Width="125px">*</asp:RequiredFieldValidator>

            </td>


        </tr>

        
        <tr>
            <td  style="text-align:right; vertical-align:middle;font-family:'맑은 고딕'; height:27px; width:100px">

                <asp:Label ID="Label6" runat="server" Text="파일첨부" Font-Size="7pt"></asp:Label>

            </td>
              <td  style="text-align:center; vertical-align:middle;font-family:'맑은 고딕'; height:27px; width:502px">


                  <asp:FileUpload ID="FileUpload1" runat="server" Width="495px"  />


            </td>
            <td>

                &nbsp;</td>


        </tr>



         <tr>
            <td  style="text-align:right; vertical-align:middle;font-family:'맑은 고딕'; height:27px; width:100px">

                <asp:Label ID="lblHyperlink" runat="server" Text="하이퍼링크" Font-Size="7pt"></asp:Label>

            </td>
              <td  style="text-align:center; vertical-align:middle;font-family:'맑은 고딕'; height:27px; width:502px">


                


                  <asp:TextBox ID="txtHyperlink" runat="server" style="width:495px"></asp:TextBox>


                


            </td>
            <td>

                &nbsp;</td>


        </tr>


        
        <tr>
            <td  style="text-align:right; vertical-align:middle;font-family:'맑은 고딕'; height:27px; width:100px">

                &nbsp;</td>
              <td  style="text-align:center; vertical-align:middle;font-family:'맑은 고딕'; height:27px; width:502px">


                  <asp:ImageButton ID="ibtnWrite" runat="server" Height="35px" ImageUrl="~/Images/btn_write.png" Width="100px" OnClick="ibtnWrite_Click" />
&nbsp;
                  <asp:ImageButton ID="ibtnList" runat="server" Height="35px" ImageUrl="~/Images/btn_list.png" Width="100px" OnClick="ibtnList_Click" CausesValidation="False" />
            </td>
            <td>

            </td>


        </tr>
        
        <tr>
            <td  style="text-align:right; vertical-align:middle;font-family:'맑은 고딕'; height:27px; width:100px">

                &nbsp;</td>
              <td  style="text-align:center; vertical-align:middle;font-family:'맑은 고딕'; height:27px; width:502px">


                  <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" Width="495px" style="text-align:left;" />
            </td>
            <td>

            </td>


        </tr>

  






    </table>




</asp:Content>

