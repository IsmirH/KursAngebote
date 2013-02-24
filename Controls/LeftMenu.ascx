<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeftMenu.ascx.cs" Inherits="SVBL.AspNet.Controls.LeftMenu" %>
    <ul id="menu" class="nav">
        <asp:Repeater ID="rptKursKategorie" runat="server">
            <ItemTemplate>
                <li>
                    <asp:LinkButton ID="lnkKategorie" runat="server" CssClass="active" CommandArgument='<%#Eval("KursKategorieID")%>'>
                    <span>
                    <%#Eval("KursKategorieTitel") %>
                    </span>
                    </asp:LinkButton>
                    <ul class="sub">
                        <asp:Repeater ID="rptKursUnterKategorie" runat="server">
                            <ItemTemplate>
                                <li><span>            
                                            <a href="../Default.aspx?kursNr=<%#Eval("KursUnterkategorieNr")%>"><%#Eval("KursUnterkategorieNr")%>
                                            &nbsp;<%#Eval("KursUneterkategorieTitel")%></a>
                                    </span>  
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>