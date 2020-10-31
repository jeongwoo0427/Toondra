<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="IllustMyRecommand.aspx.cs" Inherits="IllustMyRecommand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table border="1">

        <tr>

            <td>
                    <asp:Label ID="Label1" runat="server" BackColor="#FFCC99"  style="font-size:large;" Font-Bold="True" Text="내가 찜한 작품"
        Width="1216px"></asp:Label>


            </td>
        </tr>

        <tr>
            <td style="text-align:left;">
                &nbsp;<asp:Button ID="Button2" runat="server" Text="일러스트 목록" Width="191px" OnClick="Button2_Click" />

            &nbsp;<asp:Label ID="lblMessage" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label>

            </td>


        </tr>

         <tr>
            <td style="text-align:left;">
     

                <asp:DataList ID="dlIllust" runat="server" RepeatColumns="5" 
                    RepeatDirection="Horizontal" Width="1213px" Height="223px" OnSelectedIndexChanged="dlIllust_SelectedIndexChanged">

                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#GetShowUrl(Eval("illustno")) %>'  Width="130px" Height ="130px">

                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#GetImageUrl(Eval("illustno"),Eval("illustfilename")) %>' Width="130px" Height ="130px"> </asp:Image>


                        </asp:HyperLink>

                         <br /> 

                        <asp:Label ID="label4" runat="server" Text= '<%#GetTitle(Eval("illusttitle")) %>' Font-Bold="false" Font-Size="12pt"></asp:Label>
                       

                        <br>
                       

                        </br>
                        [<%#GetNickname(Eval("nickname")) %>]
           



                    </ItemTemplate>


                </asp:DataList>


            </td>


        </tr>

        </table>
</asp:Content>

