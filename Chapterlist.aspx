<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Chapterlist.aspx.cs" Inherits="Chapterlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">












      <table style="width:900px; border-collapse:collapse;" border ="0">


        <tr>

            <td style="text-align:center; vertical-align:top;" class="auto-style5">
                <asp:Image ID="imgToon" runat="server" ImageUrl="'ToonLogo\defaultimage.png" 
                    Width="170px" Height="153px" />

                     <br />
                <br />

                     <asp:Button ID="Button3" runat="server" Text="목록으로" 
                    OnClick="Button3_Click" Width="200px" Height="40px" />

                <br />

                <br />

                     <asp:Button ID="btnToonModify" runat="server" Text="웹툰 수정" 
                    OnClick="Button1_Click" Width="200px" Height="40px" Visible="False" />

                <br />

                <br />
                <asp:Button ID="btnChapterUpload" runat="server" Text="챕터 업로드" Height="40px" 
                    Visible="False" Width="200px" OnClick="btnChapterUpload_Click" />
     


                            

            </td>

      <td style="text-align:center;vertical-align:top;" class="auto-style4">
          



                    




          <table style="width:700px" border="1">
                    <tr>
                        <td colspan="4">

                            <asp:Label ID="lblTitle" runat="server" Text="제목 표시 영역" Font-Size="Large" 
                                BackColor="#FFCC99" Width="702px"></asp:Label>

                        </td>

                    </tr>

              <tr>
                  <td style="text-align:right; width: 79px;">
                      <asp:Label ID="Label1" runat="server" Text="작가:" Font-Size="Medium"></asp:Label>
                  </td>

                   <td style="text-align:left; width: 301px;" class="auto-style5">

                      <asp:Label ID="lblAuthor" runat="server" Font-Size="Medium"></asp:Label>

                       <asp:Button ID="Button4" runat="server" Text="작가정보" OnClick="Button4_Click" />

                  </td>

                     <td style="text-align:right; width: 76px;">

                      <asp:Label ID="Label3" runat="server" Text="연재요일:" Font-Size="Medium"></asp:Label>

                  </td>

                   <td style="text-align:left; width: 195px;">

                      <asp:Label ID="lblWeek" runat="server" Font-Size="Medium"></asp:Label>

                  </td>

              </tr>

              <tr>
                  <td style="height: 42px; width: 79px;">
                       <asp:Label ID="Label2" runat="server" Text="줄거리:" Font-Size="Medium"></asp:Label>
                  </td>

                  <td colspan="3" style="text-align:left; height: 42px;">


                      <asp:Label ID="lblContent" runat="server" Font-Size="Medium"></asp:Label>


                  </td>

              </tr>

              <tr>

                  <td style="width: 79px">

                       <asp:Label ID="Label4" runat="server" Text="좋아요수:" Font-Size="Medium"></asp:Label>

                  </td>

                  <td style="text-align:left; width: 301px;">
                         <asp:Label ID="lblLikeCount" runat="server" Font-Size="Medium"></asp:Label>
                  </td>

                  <td colspan="2" style="text-align:left">




                   


                      &nbsp;&nbsp;

                       <asp:Button ID="Button2" runat="server" Text="좋아요" Width="111px" 
                          OnClick="Button2_Click" />


                  &nbsp;&nbsp;




                      <asp:Button ID="Button1" runat="server" Text="첫회보기" Width="111px" />


                      <br />
                      <asp:Label ID="lblMessage" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label>


                  </td>


              </tr>

              <tr>


                  <td colspan="4">




                       
                <asp:GridView ID="grvChapters" runat="server" AllowPaging="True" 
                          AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" 
                          BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" 
                          Width="700px" >
                    
                    <Columns>

    <asp:TemplateField HeaderText="횟수/제목" ItemStyle-Width="380px" ItemStyle-HorizontalAlign="Left">
                <ItemTemplate>

                  
                    <asp:HyperLink runat="server" NavigateUrl='<%# GetShowUrl(Eval("no")) %>' Text='<%# Eval("chaptertitle") %>'  Target="_blank"></asp:HyperLink>

                </ItemTemplate>

            </asp:TemplateField>


                        <asp:TemplateField HeaderText="조회수">

                            <ItemTemplate><%#Eval("hits") %> </ItemTemplate>
                            <ItemStyle Width="120px"  HorizontalAlign="Center" VerticalAlign="Middle" />

                        </asp:TemplateField>




                        
                        <asp:TemplateField HeaderText="등록일">

                            <ItemTemplate><%#Eval("uploaddate","{0:yyyy/MM/dd}") %> </ItemTemplate>
                            <ItemStyle Width="100px"  HorizontalAlign="Center" VerticalAlign="Middle" />

                        </asp:TemplateField>





                    </Columns>


                    
                    
                    
                    
                    
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>




                  </td>
              </tr>

                </table>


            </td>

           

        </tr>



        
           

        </table>







</asp:Content>

