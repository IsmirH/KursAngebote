<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Bestellungen.aspx.cs" Inherits="SVB_Kursangebote.AspNet.Bestellungen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="wrapper">
        <div class="widget" style="width: 50%">
            <h1>
                Online buchen</h1>
            <asp:PlaceHolder ID="phSubmitted" runat="server" Visible="false">
                <div style="color: #293A68; font-size: 13px; font-weight: bold; padding:20px;">
                    Besten Dank für Ihre Buchung. Die Reservation wird im Rahmen der verfügbaren Plätze<br />
                    vorgenommen und durch unser Sekretariat bestätigt.
                </div>
            </asp:PlaceHolder>
            <div class="form">
                <asp:PlaceHolder ID="phUnsubmitted" runat="server">
                    <div style="margin-left: 300px">
                        * Eingabe erforderlich
                    </div>
                    <div class="formRight">
                        <div class="formRow">
                            <div style="margin-top: 20px">
                                Kursdaten</div>
                            <div style="margin-left: 190px">
                                <asp:Label ID="lblKursDatenValue" runat="server" />
                            </div>
                        </div>
                        <h1 style="font-size: larger">
                            Besteller</h1>
                        <div class="formRow">
                            <label>
                                *Firma</label>
                            <asp:TextBox ID="txtFirma" runat="server" />
                            <asp:RequiredFieldValidator ID="rfvFirma" ControlToValidate="txtFirma" runat="server"
                                ValidationGroup="bestell" Display="Dynamic" Font-Size="Smaller" ForeColor="Red"
                                Text="Diese Angabe ist erforderlich" />
                        </div>
                        <div class="formRow">
                            <label>
                                Zusatzbezeichnung</label>
                            <asp:TextBox ID="txtZusatzbezeichnung" runat="server" />
                        </div>
                        <div class="formRow">
                            <label>
                                Strasse / HausNr. *</label>
                            <asp:TextBox ID="txtStrasse" runat="server" />
                            <asp:TextBox ID="txtHausNr" runat="server" Width="50px" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtHausNr"
                                runat="server" ValidationGroup="bestell" Font-Size="Smaller" Display="Dynamic"
                                ForeColor="Red" Text="Diese Angabe ist erforderlich" />
                        </div>
                        <div class="formRow">
                            <label>
                                Adresszusatz</label>
                            <asp:TextBox ID="txtAdresszusatz" runat="server" />
                        </div>
                        <div class="formRow">
                            <label>
                                PLZ / Ort *</label>
                            <asp:TextBox ID="txtPLZ" runat="server" Width="50px" />
                            <asp:TextBox ID="txOrt" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txOrt"
                                runat="server" ValidationGroup="bestell" Font-Size="Smaller" Display="Dynamic"
                                ForeColor="Red" Text="Diese Angabe ist erforderlich" />
                        </div>
                        <div class="formRow">
                            <label style="width: 154px">
                                Land</label>
                            <asp:DropDownList ID="ddlLand" runat="server">
                                <asp:ListItem>CH</asp:ListItem>
                                <asp:ListItem>FL</asp:ListItem>
                                <asp:ListItem>DE</asp:ListItem>
                                <asp:ListItem>AT</asp:ListItem>
                                <asp:ListItem>FR</asp:ListItem>
                                <asp:ListItem>IT</asp:ListItem>
                                <asp:ListItem>LU</asp:ListItem>
                                <asp:ListItem>andree</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="formRow">
                            <h1 style="font-size: larger">
                                Kontaktperson</h1>
                            <label>
                                Anrede *</label>
                            <asp:RadioButtonList ID="rbGenderList" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Text="Herr" Value="Herr"></asp:ListItem>
                                <asp:ListItem Text="Frau" Value="Frau"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="rbGenderList"
                                runat="server" Font-Size="Smaller" ValidationGroup="bestell" Display="Dynamic"
                                ForeColor="Red" Text="Diese Angabe ist erforderlich" />
                        </div>
                        <div class="formRow">
                            <label>
                                Name *</label>
                            <asp:TextBox ID="txtName" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtName"
                                runat="server" ValidationGroup="bestell" Font-Size="Smaller" Display="Dynamic"
                                ForeColor="Red" Text="Diese Angabe ist erforderlich" />
                        </div>
                        <div class="formRow">
                            <label>
                                Vorname *</label>
                            <asp:TextBox ID="txtVorname" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtVorname"
                                runat="server" ValidationGroup="bestell" Font-Size="Smaller" Display="Dynamic"
                                ForeColor="Red" Text="Diese Angabe ist erforderlich" />
                        </div>
                        <div class="formRow">
                            <label>
                                Telefon direkt</label>
                            <asp:TextBox ID="txtTelefonDirekt" runat="server" />
                        </div>
                        <div class="formRow">
                            <label>
                                Telefon Zentrale</label>
                            <asp:TextBox ID="txtTelefonZentrale" runat="server" />
                        </div>
                        <div class="formRow">
                            <label>
                                Email *</label>
                            <asp:TextBox ID="txtEmail" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txtEmail"
                                runat="server" ValidationGroup="bestell" Font-Size="Smaller" Display="Dynamic"
                                ForeColor="Red" Text="Diese Angabe ist erforderlich" />
                        </div>
                        <div class="formRow">
                            <label>
                                Form der Bestätigung *</label>
                            <asp:RadioButtonList ID="rbFormderBestetingung" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Text="Per E-Mail " Value="Email"></asp:ListItem>
                                <asp:ListItem Text="Per Post" Value="Post"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="rbFormderBestetingung"
                                runat="server" ValidationGroup="bestell" Font-Size="Smaller" Display="Dynamic"
                                ForeColor="Red" Text="Diese Angabe ist erforderlich" />
                        </div>
                        <div class="formRow">
                            <label>
                                <b>Rechnungsadresse</b>
                                <br />
                                <span style="font-size: 10px">(Falls von obenstehenden<br />
                                    Angaben abweichend)</span></label>
                            <asp:TextBox ID="txtRechnungsadresse" runat="server" TextMode="MultiLine" Height="50px"
                                Width="300px" />
                        </div>
                        <div class="formRow">
                            <b>Kursteilnehmende</b> &nbsp;&nbsp;&nbsp;&nbsp;Bitte nur Teilnehmende für den gleichen
                            Kurs aufführen<br />
                            <br />
                            <label style="width: 50px">
                                Teilnehmer
                            </label>
                            <br />
                            <asp:UpdatePanel ID="UpdateTeilNehmer" runat="server" UpdateMode="Always">
                                <ContentTemplate>
                                    <asp:Button ID="btnAddTheilNehmer" Width="5px" runat="server" Text="+" CssClass="blueB" />
                                    <span>Name</span>
                                    <asp:TextBox ID="txtTNName" runat="server" Width="41px" CssClass="nomargin" />
                                    <span>Vorname</span>
                                    <asp:TextBox ID="txtTNVorname" runat="server" Width="41px" CssClass="nomargin" />
                                    <span>Geburtstag</span>
                                    <asp:TextBox ID="txtGeburtsTag" runat="server" Width="41px" CssClass="nomargin" />
                                    <span>FAK Nummer **</span>
                                    <asp:TextBox ID="txtTNFAKNummer" runat="server" Width="41px" CssClass="nomargin" />
                                    <div style="margin-left: 115px;">
                                        <span>Name</span>
                                        <asp:TextBox ID="txtTNName2" runat="server" Width="41px" CssClass="nomargin" />
                                        <span>Vorname</span>
                                        <asp:TextBox ID="txtTNVorname2" runat="server" Width="41px" CssClass="nomargin" />
                                        <span>Geburtstag</span>
                                        <asp:TextBox ID="txtGeburtsTag2" runat="server" Width="41px" CssClass="nomargin" />
                                        <span>FAK Nummer **</span>
                                        <asp:TextBox ID="txtTeilNehmerNFAKNummer2" runat="server" Width="41px" CssClass="nomargin" />
                                        <span>Name</span>
                                        <asp:TextBox ID="txtTNName3" runat="server" Width="41px" CssClass="nomargin" />
                                        <span>Vorname</span>
                                        <asp:TextBox ID="txtTNVorname3" runat="server" Width="41px" CssClass="nomargin" />
                                        <span>Geburtstag</span>
                                        <asp:TextBox ID="txtGeburtsTag3" runat="server" Width="41px" CssClass="nomargin" />
                                        <span>FAK Nummer **</span>
                                        <asp:TextBox ID="txtTeilNehmerNFAKNummer3" runat="server" Width="41px" CssClass="nomargin" />
                                        <span>Name</span>
                                        <asp:TextBox ID="txtTNName4" runat="server" Width="41px" CssClass="nomargin" />
                                        <span>Vorname</span>
                                        <asp:TextBox ID="txtTNVorname4" runat="server" Width="41px" CssClass="nomargin" />
                                        <span>Geburtstag</span>
                                        <asp:TextBox ID="txtGeburtsTag4" runat="server" Width="41px" CssClass="nomargin" />
                                        <span>FAK Nummer **</span>
                                        <asp:TextBox ID="txtTeilNehmerNFAKNummer4" runat="server" Width="41px" CssClass="nomargin" />
                                    </div>
                                    <div style="margin-left: 152px;">
                                        <asp:PlaceHolder ID="phTeilNehmer" runat="server"></asp:PlaceHolder>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <div style="margin-left: 120px; padding: 20px">
                                <b>** Eintrag für LKW-Fahrer CZV (Kurse 1.06, 1.07, 1.09, 2.01, 2.03, 2.04, 2.05, 3.01,
                                    3.15 oder 3.16).</b><br />
                                Pos. 5 im Führerausweis Kreditkartenformat / zwölfstellige Nummer
                            </div>
                            <div>
                            </div>
                        </div>
                        <div class="formRow" style="margin-left: 140px">
                            <asp:CheckBox ID="cbUnderestandRisks" runat="server" />
                            &nbsp;Ich bin mit den Allgemeinen Geschäftsbedingungen einverstanden *
                        </div>
                    </div>
                    <div style="margin-left: 230px; padding: 20px">
                        <asp:Button ID="btnSubmit" runat="server" Text="Abschicken" ValidationGroup="bestell"
                            CssClass="blueB" /></div>
                </asp:PlaceHolder>
            </div>
        </div>
    </div>
</asp:Content>
