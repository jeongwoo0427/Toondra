<%@ Page Title="" Language="C#" MasterPageFile="~/sBbs.master" AutoEventWireup="true" CodeFile="Bbslist.aspx.cs" Inherits="Bbslist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    

    
    <table style ="width: 720px">

        <tr>
            <td style="text-align:left; vertical-align:top" colspan="5">
  
                <asp:Label ID="lblBbsTitle" runat="server" BackColor="#FFCC99" Text="게시판" 
                    Width="700px" style="font-family:'맑은 고딕'; font-weight:700" Font-Size="Medium"></asp:Label>
  
                </td>
       </tr>
         <tr>


          <td style="text-align:left; vertical-align:top" colspan="5">
    <asp:GridView ID="grvBbs" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CaptionAlign="Bottom" style="font-family:'맑은 고딕'; font-size:small;" Width="700px" OnPageIndexChanging="grvBbs_PageIndexChanging" >
        <Columns>
            <asp:BoundField DataField="no" HeaderText="번호" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
            <asp:TemplateField ItemStyle-Width="15px"><ItemTemplate><img src="images/bbsNote.png" style="width:15px" alt="1" /></ItemTemplate></asp:TemplateField>
        
        
            <%--<asp:HyperLinkField HeaderText="제목" DataNavigateUrlFields="no" DataNavigateUrlFormatString="boardshow.aspx?no={0}" DataTextField="title" ItemStyle-Width="250px" /> --%>

            <asp:TemplateField HeaderText="제목" ItemStyle-Width="380px" ItemStyle-HorizontalAlign="Left">
                <ItemTemplate>

                    <%#GetReplyIcon(Eval("grpDepth")) %>
                    <asp:HyperLink runat="server" NavigateUrl='<%# GetShowUrl(Eval("no")) %>' Text='<%# Eval("title") %>' ></asp:HyperLink>

                </ItemTemplate>

            </asp:TemplateField>


            <asp:BoundField DataField="nickname" HeaderText="이름" ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center" ></asp:BoundField>

            <asp:TemplateField HeaderText ="글쓴 날짜" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center"><ItemTemplate><%# Eval("uploadTime","{0:yyyy/MM/dd}") %></ItemTemplate></asp:TemplateField>

            <asp:BoundField DataField="hits" HeaderText="조회" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center" ></asp:BoundField >

        </Columns>
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <FooterStyle BackColor="#5B7B9D" Font-Bold="true" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="true" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="true" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
          </td>
       </tr>


        <tr>
            <td style=" text-align:left; vertical-align:middle; width: 171px;">
    <asp:ImageButton ID="ibtnWrite" runat="server" Height="36px" 
                    ImageUrl="~/Images/btn_write.png" Visible="False" onclick="ibtnWrite_Click"  />

        </td>


               <td style=" text-align:left; vertical-align:middle">


                   <asp:DropDownList ID="ddlType" runat="server" Width="100px">

                       <asp:ListItem Selected="True">제목</asp:ListItem>
                       <asp:ListItem>내용</asp:ListItem>
                       <asp:ListItem>작성자</asp:ListItem>

                   </asp:DropDownList>


            </td>
              <td style="text-align:left; vertical-align:middle">


                  <asp:TextBox ID="txtKeyword" runat="server" Width="152px" Font-Size="Small"></asp:TextBox>


            </td>
              <td style=" text-align:left; vertical-align:middle">


                  <asp:Button ID="ibtnSearch" runat="server" Text="검색!" OnClick="ibtnSearch_Click" />


            </td>
       
            <td style="width:530px; text-align:left; vertical-align:middle">
    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                </td>


         
             </tr>

    </table>


</asp:Content>

