<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Illustlist.aspx.cs" Inherits="Illustlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table border="1">

        <tr>

            <td colspan="4">
                    <asp:Label ID="Label1" runat="server" BackColor="#FFCC99"  style="font-size:large;" Font-Bold="True" Text="일러스트"
        Width="951px"></asp:Label>


            </td>
        </tr>

        <tr>
            <td style="text-align:left;" colspan="2">
                <asp:Button ID="Button1" runat="server" Text="셔플" OnClick="Button1_Click" Width="135px" />&nbsp;&nbsp;&nbsp;<asp:Button 
                    ID="Button3" runat="server" Text="작품투고" OnClick="Button3_Click" />&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="내가 찜한 작품" OnClick="Button2_Click" Width="191px" />

            &nbsp;<asp:Label ID="lblMessage" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label>

            </td>

            <td colspan="2">
                <asp:Button ID="Button4" runat="server" Text="순위별 작품" OnClick="Button4_Click1" />
            &nbsp;
            </td>


        </tr>

         <tr>
            <td style="text-align:left;" colspan="4">
     

                <asp:DataList ID="dlIllust" runat="server" RepeatColumns="4" 
                    RepeatDirection="Horizontal" Width="953px" Height="473px">

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

        </table>
</asp:Content>

