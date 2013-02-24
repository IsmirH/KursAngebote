<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SVB_Kursangebote.AspNet.Default" %>
<%@ Register Src="~/Controls/KursDetails.ascx" TagName="KursDetails" TagPrefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript">
    function Bestell() {
        document.location.href = "Bestellungen.aspx?id=" + $('#bestellID').val();
    }
</script>
        <div class="wrapper">
        <img src="images/signet.jpg" alt="kurs angebote" />
            <div class="pageTitle">
          </div>
       <asp:PlaceHolder ID="PHListedCourses" runat="server">         
       <div class="widget">
            <div class="title"><img src="images/icons/dark/frames.png" alt="" class="titleIcon" />
            <h6><asp:Literal ID="ltlKursKategorie" runat="server" /></h6></div>
            <table cellpadding="0" cellspacing="0" style="font-size:11px" width="100%" class="sTable" id="res">
                <thead>
                    <tr>
                        <td width="5%"><div>Kurs Nr.<span></span></div></td>
                        <td width="33%"><div>Kurs Titel<span></span></div></td>
                        <td width="4%"><div>Sprache<span></span></div></td>
                        <td width="6%"><div>Kurs Ort<span></span></div></td>
                        <td width="10%"><div>Kurs Beginn<span></span></div></td>
                        <td width="10%"><div>Kurs Ende<span></span></div></td>
                        <td width="6%"><div>Dauer<span></span></div></td>
                        <td width="6%"><div>Max Teilnehmer<span></span></div></td>
                        <td width="4%"><div>Gebucht<span></span></div></td>
                        <td width="2%"><div>Frei<span></span></div></td>
                        <td width="12%"><div>Status<span></span></div></td>
                    </tr>
                </thead>
                <tbody>
                <asp:Repeater ID="rptKurs" runat="server" >
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("KursNr")%></td>
                         <td>
                        <asp:LinkButton ID="lnkKursDetails" runat="server" Text='<%#Eval("KursTitel")%>' CommandArgument='<%#Eval("KursUnterKategorieID")%>' CssClass="active" />
                        </td>
                        <td><%#Eval("SpracheID").ToString() == "1" ? "D" : "FR" %></td>
                        <td><%#Eval("KursOrt")%></td>
                        <td><%#Eval("KursBeginn")%></td>
                        <td><%#Eval("KursEnde")%></td>
                        <td><%#Eval("Dauer")%></td>
                        <td><%#Eval("MaxTn")%></td>
                        <td><%#Eval("Gebucht").ToString() %></td>
                        <td><%#Eval("Frei")%></td>
                        <input type="hidden" id="bestellID" value='<%#Eval("KursID")%>' />
                        <td><%#Eval("Status").ToString() == "buchen" ?  "<a  class=\" button\" onclick=\"Bestell()\">buchen</a>" : "ausgebucht"%></td>
                    </tr>
                    </ItemTemplate>
               </asp:Repeater>
                </tbody>
            </table>
                <div class="clear"></div>
            </div>
       </asp:PlaceHolder>

       <asp:PlaceHolder ID="PHKursDetails" Visible="false" runat="server">
       <uc:KursDetails ID="ucKursDetails" runat="server"  />
       </asp:PlaceHolder>

            <div class="clear"></div>
        </div>
</asp:Content>
