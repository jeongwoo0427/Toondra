<%@ Page Title="" Language="C#" MasterPageFile="~/sBbs.master" AutoEventWireup="true" CodeFile="Bbsshow.aspx.cs" Inherits="Bbsshow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table style="width:730px" border="1">
        <tr>
        <td colspan ="5">
            <asp:Label ID="Label1" runat="server" BackColor="#FFCC99" Text ="게시판 글 상세보기" Width="725px" style="font-family:맑은고딕; font-size:large"></asp:Label>
        </td>
        </tr>

        <tr>
        <td style="height:25px; text-align:center;vertical-align:middle; font-family:'맑은 고딕'; font-size:small; width: 502px;">
            제&nbsp&nbsp;목
        </td>
            <td colspan="4" style="text-align:center; vertical-align:middle">

                <asp:Label ID="lbltitle" runat="server" Text="Label"></asp:Label>

            </td>
        </tr>



        <tr>
            <td style="height:25px; text-align:center;vertical-align:middle; font-family:'맑은 고딕'; font-size:small; width: 502px;">
                작성자
            </td>

            <td style="text-align:center; vertical-align:middle; width: 397px;">

                <asp:Label ID="lblAuthor" runat="server" Text="Label" style="font-size:small;font-family:'맑은 고딕';"></asp:Label>

                </td>

             <td style=" text-align:center;vertical-align:middle; font-family:'맑은 고딕'; font-size:small; width: 180px;" class="auto-style4">조회수</td>

             <td colspan="2" style=" text-align:center;vertical-align:middle; font-family:'맑은 고딕'; font-size:small">
                 
                <asp:Label ID="lblHits" runat="server" Text="Label" style="font-size:small;font-family:'맑은 고딕';"></asp:Label>

                 </td>
        </tr>


        <tr>
              <td style="width:502px; text-align:center;vertical-align:middle; font-family:'맑은 고딕'; font-size:small" class="auto-style4">
                  작성일
            </td>

              <td style="width:397px; text-align:center;vertical-align:middle; font-family:'맑은 고딕'; font-size:small">
                    
                <asp:Label ID="lblUploadDate" runat="server" Text="Label" style="font-size:small;font-family:'맑은 고딕';"></asp:Label>

            </td>

               <td style="width:180px; text-align:center;vertical-align:middle; font-family:'맑은 고딕'; font-size:small" class="auto-style4">
                  첨부파일
            </td>

            <td style="width:144px; text-align:center;vertical-align:middle;">
                <asp:Label ID="lblFname" runat="server" Text="" style="font-size:small;font-family:'맑은 고딕';"></asp:Label>
                &nbsp;   <asp:Label ID="lblFsize" runat="server" Text="" style="font-size:small;font-family:'맑은 고딕';"></asp:Label>
            </td>

            <td style="width:65px; text-align:center;vertical-align:middle;">
                <asp:HyperLink ID="hlDownload" NavigateUrl="~/download.aspx" Target ="_blank" runat="server" Visible="false" style="font-family:'맑은 고딕'; font-size:small;" Text="Download" ></asp:HyperLink>
            </td>


        </tr>

        <tr>

             <td style="height:350px; text-align:center;vertical-align:middle; font-family:'맑은 고딕'; font-size:small; width: 502px;">
                  내&nbsp&nbsp;용
            </td>


              <td colspan="4" style="text-align:left; vertical-align:top; height: 350px;">
                    <asp:Label ID="lblContents" runat="server" Text="Label" style="font-size:small;font-family:'맑은 고딕';"></asp:Label>
                  </td>
        </tr>

            
        <tr>

             <td style="height:39px; text-align:center;vertical-align:middle; font-family:'맑은 고딕'; font-size:small; width: 502px;">
              <asp:Label ID="lblHyperlink" runat="server" Font-Size="8pt" >하이퍼링크</asp:Label>
            </td>


              <td colspan="4" style="text-align:left; vertical-align:middle; height: 39px;">
                    <asp:HyperLink ID="hlUrl" runat="server" Text="Label" style="font-size:small;font-family:'맑은 고딕';">[hlUrl]</asp:HyperLink>
                  </td>
        </tr>

        <tr>
                 <td colspan="2" style="text-align:center; vertical-align:middle; height: 6px;" class="auto-style3">



                     <asp:ImageButton ID="ibtnList" width="78px" runat="server" Height="23px" ImageUrl="~/Images/btn_list.png" OnClick="ibtnList_Click"/>
                     &nbsp;<asp:ImageButton ID="ibtnModify" width="75px" runat="server" Height="23px" ImageUrl="~/Images/btn_modify.png" OnClick="ibtnModify_Click" Visible="False"/>
                     &nbsp;<asp:ImageButton ID="ibtnReply" width="75px" runat="server" Height="23px" ImageUrl="~/Images/btn_replyboard.png" OnClick="ibtnReply_Click"/>
                     &nbsp;<asp:ImageButton ID="ibtnDelete" width="75px" runat="server" Height="23px" ImageUrl="~/Images/btn_delete.png" OnClick="ibtnDelete_Click" Visible="False"/>

                     </td>

            <td colspan="3" style="text-align:left; vertical-align:middle; height: 6px;" class="auto-style3">



                
                     <asp:Label ID="lblMessage" runat="server" ForeColor="#FF3300"></asp:Label>



                
                     </td>

        </tr>


        <tr>

            <td colspan="5">
                
                <asp:GridView ID="grvDiaryReply" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="720px" PageSize="5" OnPageIndexChanging="grvDiaryReply_PageIndexChanging">
                   
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

            <td class="auto-style4" style="width: 502px">

                <asp:Label ID="Label2" runat="server" Text="댓글" Font-Bold="False" Font-Size="Small"></asp:Label>
            </td>


            <td colspan="3">
                
                <asp:TextBox ID="txtReply" runat="server" Width="333px"></asp:TextBox>
            
            </td>
            <td colspan="2" >

                <asp:Button ID="Button1" runat="server" Text="댓글달기" Width="150px" OnClick="Button1_Click" />
            </td>

        </tr>

    </table>

</asp:Content>

