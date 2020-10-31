<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style4 {
            margin-top: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <table border="1">

        <tr>

            <td>

                <asp:Label ID="Label1" runat="server" Text="주간 베스트 일러스트" BackColor="#FFCC99" CssClass="auto-style4" Font-Bold="True" Font-Size="Medium" Width="908px"></asp:Label>


                <br />
                <asp:Label ID="lblMessage1" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label>


            </td>




        </tr>

        <tr>
            <td>


                <asp:DataList ID="dlIllust" runat="server" RepeatColumns="4" 
                    RepeatDirection="Horizontal" Width="906px" Height="272px">

                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#GetShowUrl(Eval("illustno")) %>'  Width="200px" >

                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#GetImageUrl(Eval("illustno"),Eval("illustfilename")) %>' Width="200px"> </asp:Image>


                        </asp:HyperLink>


                        <br>


                        </br>
           



                    </ItemTemplate>


                </asp:DataList>


            </td>

        </tr>

            <tr>

            <td>

                <asp:Label ID="Label2" runat="server" Text="팔로우한 작가의 최신 웹툰" BackColor="#FFCC99" CssClass="auto-style4" Font-Bold="True" Font-Size="Medium" Width="908px"></asp:Label>


            </td>




        </tr>





        <tr>

            <td>


                <asp:GridView ID="grvChapters" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" Height="65px" Width="905px">
                    <Columns>
                        <asp:TemplateField HeaderText="웹툰명" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="100px">
                            <ItemTemplate>
                                <asp:HyperLink runat="server" NavigateUrl='<%# GetShowToonUrl(Eval("toonno")) %>' Target="_blank" Text='<%# Eval("title") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="횟수/제목" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="380px">
                            <ItemTemplate>
                                <asp:HyperLink runat="server" NavigateUrl='<%# GetShowChapterUrl(Eval("toonno"),Eval("no")) %>' Target="_blank" Text='<%# Eval("chaptertitle") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="조회수">
                            <ItemTemplate>
                                <%#Eval("hits") %> 
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="등록일">
                            <ItemTemplate>
                                <%#Eval("uploaddate","{0:yyyy/MM/dd}") %> 
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
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

        </tr>

            <tr>

            <td>

                <asp:Label ID="Label3" runat="server" Text="팔로우한 작가의 최신 일러스트" BackColor="#FFCC99" CssClass="auto-style4" Font-Bold="True" Font-Size="Medium" Width="908px"></asp:Label>


            </td>




        </tr>


        <tr>
            <td>


                <asp:DataList ID="dlFollowedIllust" runat="server" RepeatColumns="4" 
                    RepeatDirection="Horizontal" Width="906px" Height="272px">

                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#GetIllustShowUrl(Eval("illustno")) %>'  Width="200px" >

                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#GetIllustImageUrl(Eval("illustno"),Eval("illustfilename")) %>' Width="200px"> </asp:Image>


                        </asp:HyperLink>


                        <br>


                        </br>
           



                    </ItemTemplate>


                </asp:DataList>


            </td>

        </tr>


    </table>

</asp:Content>

