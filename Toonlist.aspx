<%@ Page Title="" Language="C#" MasterPageFile="~/stoons.master" AutoEventWireup="true" CodeFile="Toonlist.aspx.cs" Inherits="Toonlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    <table>

        <tr>
            <td style="width: 10px">
                <asp:Label ID="lblToonTitle" runat="server" BackColor="#FFCC99" Font-Size="Large" Text="웹툰/만화" Width="800px"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>


        <tr>
            <td colspan="2" style="text-align:left; font-size:small">

                요일별 웹툰입니다.&nbsp;
                <asp:Label ID="lblMessage" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label>

            </td>

        </tr>


        <tr>
            <td colspan ="2">


                <asp:DataList ID="dlToons" runat="server" RepeatColumns="4" 
                    RepeatDirection="Horizontal" Width="798px">

                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#GetShowUrl(Eval("no")) %>'  Width="150px" Height ="150px">

                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#GetImageUrl(Eval("no"),Eval("logofilename")) %>' Width="150px" Height ="150px"> </asp:Image>


                        </asp:HyperLink>


                        <br>


                        </br>
                        
                        웹툰명: <%#GetTitle(Eval("title")) %>
                        <br />
                        작가: <%#Eval("author") %>




                    </ItemTemplate>


                </asp:DataList>


            </td>


        </tr>

    </table>


</asp:Content>

