<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SearchResult.aspx.cs" Inherits="SearchResult"  MaintainScrollPositionOnPostback="true"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style4 {
            width: 697px;
        }
        .auto-style5 {
            width: 697px;
            height: 19px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table>
        <tr>
            <td class="auto-style4" style="text-align:center">


                <asp:Label ID="Label1" runat="server" Text="웹툰 검색결과" BackColor="#FFCC99" Font-Bold="True" Font-Size="Large" Width="900px"></asp:Label>
                <br />
&nbsp;<asp:Label ID="lblMessage1" runat="server" Font-Bold="False" Font-Size="Small" ForeColor="Red"></asp:Label>
            </td>


        </tr>


             <tr>
            <td class="auto-style4">


                <asp:GridView ID="grvChapters" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" Height="65px" Width="899px" OnPageIndexChanging="grvChapters_PageIndexChanging">
                    <Columns>
                        <asp:TemplateField HeaderText="작가명" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="100px">
                            <ItemTemplate>
                                <asp:HyperLink runat="server" NavigateUrl='<%# GetAuthorShowUrl(Eval("author")) %>'  Text='<%# Eval("author") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="횟수/제목" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="380px">
                            <ItemTemplate>
                                <asp:HyperLink runat="server" NavigateUrl='<%# GetChapterShowUrl(Eval("toonno"),Eval("no")) %>'  Text='<%# Eval("chaptertitle") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>


                          <asp:TemplateField HeaderText="줄거리/작품설명" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="380px">
                            <ItemTemplate>
                                <asp:HyperLink runat="server" NavigateUrl='<%# GetChapterShowUrl(Eval("toonno"),Eval("no")) %>'  Text='<%# Eval("summary") %>'></asp:HyperLink>
                            </ItemTemplate>
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

            <tr>
            <td class="auto-style4">


                <asp:Label ID="Label2" runat="server" Text="일러스트 검색결과" BackColor="#FFCC99" Font-Bold="True" Font-Size="Large" Width="900px"></asp:Label>
                <br />
                <asp:Label ID="lblMessage2" runat="server" Font-Bold="False" Font-Size="Small" ForeColor="Red"></asp:Label>
            </td>


        </tr>


             <tr>
            <td class="auto-style4">


    <asp:GridView ID="grvIllust" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="898px" OnPageIndexChanging="grvIllust_PageIndexChanging">
        <Columns>
            <asp:TemplateField HeaderText="일러스트" ItemStyle-Width="150px">
                <ItemTemplate>
                    <asp:HyperLink ID="hyperlink1" runat="server" ImageUrl='<%#GetIllustImageUrl(Eval("illustno"),Eval("illustfilename")) %>' ImageWidth="150px" NavigateUrl='<%#GetIllustShowUrl(Eval("illustno")) %>' Target="_blank"></asp:HyperLink>
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
                                <asp:Label ID="Label5" runat="server" Text='<%#Eval("illustsummary") %>' Width="540px"></asp:Label>
                                </span></td>
                        </tr>
                        <tr>
                            <td style="text-align:left; vertical-align:middle"><span style="font-size:small"><b>작성자 : <%#Eval("nickname") %>
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


            <tr>
            <td class="auto-style4">


                <asp:Label ID="Label4" runat="server" Text="사용자 검색결과" BackColor="#FFCC99" Font-Bold="True" Font-Size="Large" Width="900px"></asp:Label>
                <br />
                <asp:Label ID="lblMessage3" runat="server" Font-Bold="False" Font-Size="Small" ForeColor="Red"></asp:Label>
            </td>


        </tr>


             <tr>
            <td class="auto-style5">


    <asp:GridView ID="grvUsers" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="902px" OnPageIndexChanging="grvUsers_PageIndexChanging" >
        <Columns>
            <asp:TemplateField HeaderText="프로필 사진" ItemStyle-Width="100px"  ItemStyle-Height="100px">
                <ItemTemplate>
                    
                    <asp:HyperLink ID="hyperlink2" runat="server" ImageUrl='<%#GetUserImageUrl(Eval("userid"),Eval("profilefname")) %>' ImageWidth="100px"  ItemStyle-Height="100px" NavigateUrl='<%#GetUserShowUrl(Eval("userid")) %>' ></asp:HyperLink>
                
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


            <tr>
            <td class="auto-style4">


                &nbsp;</td>


        </tr>


             <tr>
            <td class="auto-style4">


            </td>


        </tr>



    </table>

</asp:Content>

