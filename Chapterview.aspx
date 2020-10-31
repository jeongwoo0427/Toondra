<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Chapterview.aspx.cs" Inherits="Chapterview" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>


            <table>

                <tr>
                    <td class="auto-style1" colspan="2">
            <asp:Label ID="lblTitle" runat="server" Font-Size="Medium" BackColor="#FFCC99"></asp:Label>
                                   <asp:Label ID="lblMessage" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label>
                    </td>
                    <td >
 
                        <asp:ImageButton ID="ibtnDelete" runat="server"  Height="32px" 
                            ImageUrl="~/Images/btn_modify.png" OnClick="ImageButton1_Click" Visible="False" 
                            Width="97px" 
                            
                            
                            OnClientClick="javascript:if(confirm('정말 삭제하시겠습니까?\n\n삭제시 복구가 불가능 합니다.')){return true;} else{return:false;}"  />
 
                        </td>
                    </tr>

                <tr>
                    <td colspan ="3">


                        <asp:Image ID="imgMain" runat="server" Width="900px" />


                    </td>

                </tr>


                <tr>

                    <td class="auto-style3">

                        &nbsp;</td>



                    <td class="auto-style3">

                        &nbsp;</td>




                    <td class="auto-style3" style="text-align:right">

                        &nbsp;</td>

                </tr>

                <tr>

                    <td colspan="3" style="text-align:center">



                        <asp:Label ID="lblMessage2" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label>



                    </td>

                </tr>

               
                <tr>
                    <td colspan="3">
                
                <asp:GridView ID="grvChapterReply" runat="server" AllowPaging="True" 
                            AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                            GridLines="None" Width="894px" PageSize="5" OnPageIndexChanging="grvChapterReply_PageIndexChanging" 
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
                    <td colspan="2">

                        <asp:TextBox ID="txtReply" runat="server" Width="757px"></asp:TextBox>

                    </td>

                    <td>


                        <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="댓글달기" />
 
                    </td>

                </tr>

                <tr>
                    <td colspan="3">

                        <asp:Label ID="Label1" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label>

                    </td>
                </tr>

            </table>


        </div>
    </form>
</body>
</html>
