<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Followlist.aspx.cs" Inherits="Followlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table>

        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" Height="42px" Text="뒤로" Width="104px" OnClick="Button1_Click" />
                <asp:Label ID="Label1" runat="server" Text="내가 팔로우한 사람" BackColor="#FFCC99" Font-Size="Large" Height="47px" Width="772px"></asp:Label>

            </td>
        </tr>

        <tr>
            <td>


    <asp:GridView ID="grvFollowing" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="879px" OnPageIndexChanging="grvFollowing_PageIndexChanging">
        <Columns>
            <asp:TemplateField HeaderText="프로필 사진" ItemStyle-Width="100px"  ItemStyle-Height="100px">
                <ItemTemplate>
                    
                    <asp:HyperLink ID="hyperlink1" runat="server" ImageUrl='<%#GetImageUrl(Eval("targetid"),Eval("profilefname")) %>' ImageWidth="100px"  ItemStyle-Height="100px" NavigateUrl='<%#GetShowUrl(Eval("targetid")) %>' ></asp:HyperLink>
                
                </ItemTemplate>
            </asp:TemplateField>





            <asp:TemplateField HeaderText="닉네임" ItemStyle-VerticalAlign="Top" ItemStyle-Width="480px">
                <ItemTemplate>
                    <table border="0" style="width:550px">
                        <tr>
                            <td style="width:550px; text-align:left; vertical-align:middle;"><span style="font-size:medium"><b> <%#Eval("nickname") %></b>
                                </span></td>
                        </tr>
                       
                    </table>
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

    </table>

</asp:Content>

