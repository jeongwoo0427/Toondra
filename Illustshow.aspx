<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Illustshow.aspx.cs" MaintainScrollPositionOnPostback="true"  Inherits="Illustshow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style4 {
            width: 100px;
        }
        .auto-style11 {
            width: 380px;
        }
        .auto-style15 {
            height: 49px;
        }
        .auto-style16 {
            width: 940px;
        }
        .auto-style19 {
            width: 268px;
        }
        .auto-style20 {
            height: 173px;
        }
        .auto-style21 {
            width: 61px;
            height: 44px;
        }
        .auto-style22 {
            width: 285px;
            height: 44px;
        }
        .auto-style23 {
            height: 168px;
            width: 61px;
        }
        .auto-style24 {
            height: 168px;
            width: 285px;
        }
        .auto-style25 {
            margin-bottom: 49px;
        }
        .auto-style26 {
        width: 61px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    



      <table style="border-collapse:collapse;" border ="0" class="auto-style16">

          
              <tr>
                  <td colspan="4" style="text-align:left">




                       
                     <asp:Button ID="Button3" runat="server" Text="목록으로" 
                   Width="120px" Height="33px" OnClick="Button3_Click" />

                      &nbsp;

                     <asp:Button ID="btnModify" runat="server" Text="수정" 
                     Width="120px" Height="33px" Visible="False" OnClick="btnModify_Click" />

                      &nbsp;

                     <asp:Button ID="btnDelete" runat="server" Text="삭제" 
                    Width="120px" Height="33px" Visible="False" />


                  &nbsp;

                        
                  </td>


              </tr>


        <tr>

            <td style="text-align:center; vertical-align:top;" class="auto-style11">
                <asp:Image ID="imgIllust" runat="server" ImageUrl="'ToonLogo\defaultimage.png" 
                    Width="518px"  />

                     <br />
                <br />

                <br />

                <br />

                <br />

                <br />
     


                            

            </td>

      <td style="text-align:center;vertical-align:top;" class="auto-style4">
          



                    




          <table border="1" >



                    <tr>
                        <td colspan="4" class="auto-style15">

                            <asp:Label ID="lblTitle" runat="server" Text="제목 표시 영역" Font-Size="Large" 
                                BackColor="#FFCC99" Width="446px"></asp:Label>

                        </td>

                    </tr>

              <tr>
                  <td style="text-align:right; " class="auto-style26">
                      <asp:Label ID="Label1" runat="server" Text="작가:" Font-Size="Small"></asp:Label>
                  </td>

                   <td style="text-align:left; " class="auto-style19" colspan="2">

                      <asp:Label ID="lblAuthor" runat="server" Font-Size="Medium"></asp:Label>

                     
                  </td>
                  <td>
                        <asp:Button ID="Button4" runat="server" Text="작가정보" OnClick="Button4_Click" Width="108px" />

                  </td>

              


              </tr>

             
               <tr>
                  <td class="auto-style23"style="text-align:right">
                       <asp:Label ID="Label3" runat="server" Text="설명:" Font-Size="Small" ></asp:Label>
                  </td>

                  <td colspan="3" style="text-align:left; " class="auto-style24">


                      <asp:Label ID="lblSummary" runat="server" Font-Size="Medium"></asp:Label>


                  </td>

              </tr>

              <tr>

                  <td class="auto-style21" style="text-align:right">

                       <asp:Label ID="Label4" runat="server" Text="좋아요:" Font-Size="Small"></asp:Label>

                  </td>

                  <td style="text-align:left; " class="auto-style22">
                         <asp:Label ID="lblLikeCount" runat="server" Font-Size="Medium"></asp:Label>




                       
                        &nbsp;<asp:Label ID="lblMessage" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label>


                         <br />

                  </td>

                  <td colspan="2">




                       
                     <asp:Button ID="Button5" runat="server" Text="좋아요" 
                    Width="84px" Height="34px" OnClick="Button5_Click1" />

                        <br />
                      <br />
                      <asp:Button ID="btnRecommand" runat="server" OnClick="Button6_Click" Text="찜" Width="82px" />

                  </td>


              </tr>

              <tr>


                  <td colspan="4" class="auto-style20">




                       
                   
                            

                      <asp:GridView ID="grvIllustReply" runat="server" AllowPaging="True" 
                            AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                            GridLines="None" Width="455px" PageSize="5" OnPageIndexChanging="grvIllustReply_PageIndexChanging" CssClass="auto-style25" Height="16px" 
                            >
                   
                   <Columns>

                       <asp:TemplateField HeaderText="사용자">
                           <ItemTemplate><b><%#Eval("nickname") %></b></ItemTemplate>
                           <ItemStyle Width="100px" HorizontalAlign="Center" />
                       </asp:TemplateField>


                       <asp:TemplateField HeaderText="내용">
                           <ItemTemplate>
                               <%#Eval("contents") %>
                        
                               [<%#Eval("uploaddate","{0:yyyy/MM/dd}") %>]
                           </ItemTemplate>

                       </asp:TemplateField>


                   </Columns> 
                    
                    
                    
                    
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>




                       
                   
                            

                      </td>
              </tr>

              <tr>
                  <td colspan="4">

                        <asp:TextBox ID="txtReply" runat="server" Width="282px"></asp:TextBox>


                        <asp:Button ID="Button1" runat="server" OnClick="Button5_Click" Text="댓글달기" />
 
                  </td>
              </tr>

                </table>


            </td>

           

        </tr>


          <tr>

              <td colspan="4">

                        <asp:Label ID="lblMessage2" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label>

                    </td>
          </tr>
        
           

                <tr>
                    <td colspan="3">

                        &nbsp;</td>

                
                </tr>

                <tr>
                    <td colspan="3">

                        &nbsp;</td>
                </tr>


        </table>








</asp:Content>

