<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Illustshowbyrank.aspx.cs" Inherits="Illustshowbyrank" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    


    <table border="1">

        <tr>
            <td colspan="2">
    <asp:Button ID="Button5" runat="server" Height="33px" Text="셔플 목록으로" Width="173px" OnClick="Button5_Click" />



                <asp:Label ID="Label2" runat="server" Text="일러스트 (순위별)" BackColor="#FFCC99" Font-Size="Large" Width="711px"></asp:Label>


                <br />
                <asp:Label ID="lblMessage" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label>


            </td>

        </tr>

        <tr>

<td style="vertical-align:top">



    <br />
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" Height="48px" Text="주간 인기순" Width="175px" OnClick="Button1_Click" />



    <br />
    <br />
    <asp:Button ID="Button2" runat="server" Height="48px" Text="월간 인기순" Width="175px" OnClick="Button2_Click" />



    <br />
    <br />
    <asp:Button ID="Button3" runat="server" Height="48px" Text="년간 인기순" Width="175px" OnClick="Button3_Click" />



    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:Button ID="Button4" runat="server" Height="48px" Text="최신순" Width="175px" OnClick="Button4_Click" />



</td>

        <td>


    <asp:GridView ID="grvIllust" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="20" Width="698px">
        <Columns>
            <asp:TemplateField HeaderText="일러스트" ItemStyle-Width="150px">
                <ItemTemplate>
                    <asp:HyperLink ID="hyperlink1" runat="server" ImageUrl='<%#GetImageUrl(Eval("illustno"),Eval("illustfilename")) %>' ImageWidth="150px" NavigateUrl='<%#GetShowUrl(Eval("illustno")) %>' Target="_blank"></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>





            <asp:TemplateField HeaderText="제목+설명" ItemStyle-VerticalAlign="Top" ItemStyle-Width="480px">
                <ItemTemplate>
                    <table border="0" style="width:550px">
                        <tr>
                            <td style="width:550px; text-align:left; vertical-align:middle;"><span style="font-size:medium"><b> <%#Eval("illusttitle") %></b>
                                </span></td>
                        </tr>
                        <tr>
                            <td style="text-align:left; vertical-align:middle;"><span style="font-size:small">
                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("illustsummary") %>' Width="540px"></asp:Label>
                                </span></td>
                        </tr>
                        <tr>
                            <td style="text-align:left; vertical-align:middle"><span style="font-size:small"><b>작성자 : <%#Eval("nickname") %>(<%#Eval("author") %>&nbsp;&nbsp;&nbsp; 작성일 : <%#Eval("illustuploaddate","{0:yyyy/MM/dd}")%>&nbsp;&nbsp;&nbsp; 조회수 : <%#Eval("illusthits") %>
                                    </b></span></td>
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

