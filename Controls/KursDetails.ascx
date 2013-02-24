<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="KursDetails.ascx.cs"
    Inherits="SVB_Kursangebote.AspNet.Controls.KursDetails" %>
<div class="widget">
    <div class="title">
        <h3 style="padding: 7px">
            <asp:Literal ID="ltlKursKategorie" runat="server" /></h3>
    </div>
    <table cellpadding="0" cellspacing="0" style="font-size: 11px" width="100%" class="sTable"
        id="res">
        <thead>
            <tr>
                <td width="30%" style="border: none">
                </td>
                <td width="70%" style="border: none">
                </td>
            </tr>
        </thead>
        <tbody>
            <tr style="padding: 50px">
                <td style="background-color: White">
                    <asp:Button CssClass=" invButtons bFirst" Text="Freie KursDaten >>" runat="server"
                        ID="btnFreieDatum" />
                </td>
                <td style="background-color: White">
                    <asp:Image ID="img_logo" Style="float: right;" runat="server" />
                </td>
            </tr>
            <tr style="padding: 50px">
                <td>
                    <b>Zielgruppe</b>
                </td>
                <td>
                    <asp:Label ID="lbl_zielgruppe" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <b>Voraussetzungen</b>
                </td>
                <td>
                    <asp:Label ID="lbl_voraussetzungen" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <b>Teilnehmende</b>
                </td>
                <td>
                    <asp:Label ID="lbl_teilnehmende" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <b>Kursinhalt</b>
                </td>
                <td>
                    <asp:Label ID="lbl_kursinhalt" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <b>Dauer</b>
                </td>
                <td>
                    <asp:Label ID="lbl_dauer" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <b>Ausbildungsnachweis</b>
                </td>
                <td>
                    <asp:Label ID="lbl_ausbildungsnachweis" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <b>Kosten Mitglieder</b>
                </td>
                <td>
                    <asp:Label ID="lbl_kostenMitglieder" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <b>Kosten Nichtmitglieder</b>
                </td>
                <td>
                    <asp:Label ID="lbl_KostenNichtmitglieder" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <b>Kursdaten</b>
                </td>
                <td>
                    <asp:Label ID="lbl_Kursdaten" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <b>Kursort</b>
                </td>
                <td>
                    <asp:Label ID="lbl_Kursort" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <b>Ausbilder</b>
                </td>
                <td>
                    <asp:Label ID="lbl_Ausbilder" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <b>Kursbeschreibung</b>
                </td>
                <td>
                    <asp:Label ID="lbl_Kursbeschreibung" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="background-color: White">
                    <b>Weitere Informationen</b>
                </td>
                <td style="background-color: White">
                    <a id="pdf_link" target="_blank" runat="server">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/icon_pdf_gross.jpg" /></a>
                </td>
            </tr>
            <tr>
                <td style="background-color: White">
                    <asp:Button CssClass=" invButtons bFirst" Text="Freie KursDaten >>" runat="server"
                        ID="Button1" />
                </td>
                <td style="background-color: White">
                </td>
            </tr>
        </tbody>
    </table>
   

 
    <div class="clear">
    <div style="margin-left:600px">
    <span><b>Im Kurspreis inbegriffen</b></span> 
    <div>  <table width="240" cellpadding="0" cellspacing="3" border="0">
    <tbody>
        <tr>
            <td width="38">
                <asp:Image ID="imgPausenverpflegung" runat="server" Height="36" Width="36" />
            </td>
            <td width="38">
             <asp:Image ID="imgMittagessen"  runat="server" Height="36" Width="36" />
            </td>
            <td width="38">
                <asp:Image ID="imgGetrenkeAlkFrei"  runat="server" Height="36" Width="36" />
            </td>
            <td width="38">
              <asp:Image ID="imgAlleGetrenk" runat="server" Height="36" Width="36" />
            </td>
            <td width="38">
                 <asp:Image ID="imgUnterlagen" runat="server" Height="36" Width="36" />
            </td>
            <td width="38">
                 <asp:Image ID="imgFuhrerausweis" runat="server" Height="36" Width="36" />
            </td>
        </tr>
    </tbody>
    </table>
    </div> 
</div>
