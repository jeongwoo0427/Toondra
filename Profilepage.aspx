<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Profilepage.aspx.cs" Inherits="Profilepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style4 {
            margin-bottom: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <table style="width:900px" border="1">
        <tr>

            <td class="auto-style3" colspan="2">


                <asp:Label ID="Label1" runat="server" BackColor="#FFCC99" Font-Bold="True" Font-Size="Medium" Text="프로필" Width="900px"></asp:Label>


            </td>

        </tr>


        <tr>
            <td>

                <asp:Image ID="imgProfile" runat="server"  Width="179px" CssClass="auto-style4" Height="179px" ImageUrl="~/ToonLogo/defaultimage.png"/>


            </td>
            <td style="text-align:left; vertical-align:top" aria-multiline="False">


                
                 <asp:Label ID="lblNickname" runat="server" Font-Bold="True" Font-Size="Medium"></asp:Label>

                &nbsp;
                 <asp:Button ID="btnFollow" runat="server" Height="34px" Text="팔로우" Width="124px" OnClick="btnFollow_Click" />
&nbsp;
                 <asp:Button ID="btnPModify" runat="server" Height="34px" OnClick="btnPModify_Click" Text="정보수정" Width="124px" />
&nbsp;<br />
                <br />
                


                 <br />
                 <asp:Label ID="Label2" runat="server" Font-Size="Small" Text="팔로워:"></asp:Label>
&nbsp;<asp:Label ID="lblFollower" runat="server" Font-Size="Small">0</asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:Label ID="Label3" runat="server" Font-Size="Small" Text="팔로잉:"></asp:Label>
                 <asp:Label ID="lblFollowing" runat="server" Font-Size="Small">0</asp:Label>
                 &nbsp;
                 <asp:Button ID="btnMyFollow" runat="server" Height="34px" Text="내가 팔로우한 사람" Width="238px" OnClick="btnMyFollow_Click" />
                 <br />
                 <br />
                 <asp:Label ID="Label4" runat="server" Font-Size="Small" Text="트위터:"></asp:Label>
                 <asp:HyperLink ID="hlTwitter" runat="server" Font-Size="Small" Font-Underline="True" ForeColor="Blue" >[hlTwitter]</asp:HyperLink>
                 <br />
                 <asp:Label ID="Label5" runat="server" Font-Size="Small" Text="페이스북:"></asp:Label>
                 <asp:HyperLink ID="hlFacebook" runat="server" Font-Size="Small" Font-Underline="True" ForeColor="Blue">[hlFacebook]</asp:HyperLink>
                 <br />
                


            </td>

        </tr>


        <tr>

            <td colspan="2">


                <asp:Label ID="Label6" runat="server" BackColor="#FFCC99" Font-Bold="True" Font-Size="Medium" Text="업로드한 웹툰" Width="895px"></asp:Label>


            </td>

        </tr>

         <tr>

            <td colspan="2">

                <asp:GridView ID="grvChapters" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" Height="65px" Width="895px" OnPageIndexChanging="grvChapters_PageIndexChanging">
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


           <tr>

            <td colspan="2">


                <asp:Label ID="Label7" runat="server" BackColor="#FFCC99" Font-Bold="True" Font-Size="Medium" Text="업로드한 일러스트" Width="901px"></asp:Label>


            </td>

        </tr>

         <tr>

            <td colspan="2">


                <asp:DataList ID="dlIllust" runat="server" RepeatColumns="5" 
                    RepeatDirection="Horizontal" Width="889px" Height="204px" OnSelectedIndexChanged="dlIllust_SelectedIndexChanged">

                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#GetShowUrl(Eval("illustno")) %>'  Width="130px" Height ="130px">

                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#GetImageUrl(Eval("illustno"),Eval("illustfilename")) %>' Width="130px" Height ="130px"> </asp:Image>


                        </asp:HyperLink>


                        <br>


                        </br>
           



                    </ItemTemplate>


                </asp:DataList>


            </td>

        </tr>

    </table>

</asp:Content>

