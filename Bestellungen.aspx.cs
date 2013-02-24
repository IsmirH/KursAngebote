using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SVBL_Kursangebote.Business;

namespace SVB_Kursangebote.AspNet
{
    public partial class Bestellungen : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            btnAddTheilNehmer.Click += new EventHandler(btnAddTheilNehmer_Click);
            btnSubmit.Click += new EventHandler(btnSubmit_Click);
        }

        void btnSubmit_Click(object sender, EventArgs e)
        {
             int  bestellerID =0;
             Besteller.InsertBesteller(txtFirma.Text, 
                 txtZusatzbezeichnung.Text,
                 txtStrasse.Text + txtHausNr.Text,
                 txtAdresszusatz.Text,
                 txtPLZ.Text + txOrt.Text, 
                 ddlLand.SelectedItem.Text,
                 rbGenderList.SelectedValue,
                 txtName.Text, txtVorname.Text, 
                 txtTelefonDirekt.Text,
                 txtTelefonZentrale.Text, 
                 txtEmail.Text, 
                 rbFormderBestetingung.SelectedValue,
                 txtRechnungsadresse.Text,
                 cbUnderestandRisks.Checked,
                 int.Parse(Request.QueryString["id"]), "Pending approval",ref bestellerID);

             if (!string.IsNullOrEmpty(txtTNName.Text) && !string.IsNullOrEmpty(txtTNFAKNummer.Text) && !string.IsNullOrEmpty(txtTNVorname.Text) && !string.IsNullOrEmpty(txtGeburtsTag.Text))
             {
                 Teilnehmer teilNehmer1 = new Teilnehmer();
                 teilNehmer1.BestellerID = bestellerID;
                 teilNehmer1.FAKNummer = txtTNFAKNummer.Text;
                 teilNehmer1.Name = txtTNName.Text;
                 teilNehmer1.Vorname = txtTNVorname.Text;
                 teilNehmer1.Geburtstag = txtGeburtsTag.Text;
                 Teilnehmer.Insert(teilNehmer1);
             }

             if (!string.IsNullOrEmpty(txtTNName2.Text) && !string.IsNullOrEmpty(txtTeilNehmerNFAKNummer2.Text) && !string.IsNullOrEmpty(txtTNVorname2.Text) && !string.IsNullOrEmpty(txtGeburtsTag2.Text))
             {
                 Teilnehmer teilNehmer2 = new Teilnehmer();
                 teilNehmer2.BestellerID = bestellerID;
                 teilNehmer2.FAKNummer = txtTeilNehmerNFAKNummer2.Text;
                 teilNehmer2.Name = txtTNName2.Text;
                 teilNehmer2.Vorname = txtTNVorname2.Text;
                 teilNehmer2.Geburtstag = txtGeburtsTag2.Text;
                 Teilnehmer.Insert(teilNehmer2);
             }

             if (!string.IsNullOrEmpty(txtTNName3.Text) && !string.IsNullOrEmpty(txtTeilNehmerNFAKNummer3.Text) && !string.IsNullOrEmpty(txtTNVorname3.Text) && !string.IsNullOrEmpty(txtGeburtsTag3.Text))
             {
                 Teilnehmer teilNehmer3 = new Teilnehmer();
                 teilNehmer3.BestellerID = bestellerID;
                 teilNehmer3.FAKNummer = txtTeilNehmerNFAKNummer3.Text;
                 teilNehmer3.Name = txtTNName3.Text;
                 teilNehmer3.Vorname = txtTNVorname3.Text;
                 teilNehmer3.Geburtstag = txtGeburtsTag3.Text;
                 Teilnehmer.Insert(teilNehmer3);
             }

             if (!string.IsNullOrEmpty(txtTNName4.Text) && !string.IsNullOrEmpty(txtTeilNehmerNFAKNummer4.Text) && !string.IsNullOrEmpty(txtTNVorname4.Text) && !string.IsNullOrEmpty(txtGeburtsTag3.Text))
             {
                 Teilnehmer teilNehmer4 = new Teilnehmer();
                 teilNehmer4.BestellerID = bestellerID;
                 teilNehmer4.FAKNummer = txtTeilNehmerNFAKNummer4.Text;
                 teilNehmer4.Name = txtTNName4.Text;
                 teilNehmer4.Vorname = txtTNVorname4.Text;
                 teilNehmer4.Geburtstag = txtGeburtsTag4.Text;
                 Teilnehmer.Insert(teilNehmer4);
             }


             foreach (Control c in phTeilNehmer.Controls)
             {
                 Teilnehmer teilNehmer = new Teilnehmer();
                 teilNehmer.BestellerID = bestellerID;
                 TextBox textBox = c as TextBox;

                 if (textBox != null)
                 {
                     if (textBox.ID.Contains("Name"))
                     {
                         teilNehmer.Name = textBox.Text;
                     }

                     if (c.ID.Contains("Vorname"))
                     {
                         teilNehmer.Vorname = textBox.Text;
                     }

                     if (c.ID.Contains("Geburtstag"))
                     {
                         teilNehmer.Geburtstag = textBox.Text;
                     }

                     if (c.ID.Contains("FAKNummer"))
                     {
                         teilNehmer.FAKNummer = textBox.Text;
                     }

                     if(!string.IsNullOrEmpty(teilNehmer.Name) && !string.IsNullOrEmpty(teilNehmer.Vorname) &&  !string.IsNullOrEmpty(teilNehmer.Geburtstag) &&  !string.IsNullOrEmpty(teilNehmer.FAKNummer)){
                     Teilnehmer.Insert(teilNehmer);
                     }
                     else
                         continue;
                 }
             }
             phUnsubmitted.Visible = false;
             phSubmitted.Visible = true;
        }

        void btnAddTheilNehmer_Click(object sender, EventArgs e)
        {
            HelperMethod();
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            int kursUnterKategorieID;
            if (Request.QueryString["kursUnterKategorieid"] != null)
            {
                if (int.TryParse(Request.QueryString["id"].ToString(), out kursUnterKategorieID))
                {
                    Kurs kurs = Kurs.GetKursByKursUnterKategorieID(kursUnterKategorieID).SingleOrDefault();
                    lblKursDatenValue.Text = "<b>" + kurs.KursNr + "-" + kurs.KursTitel + "</b>" + "<br/>" + kurs.KursOrt + "," + kurs.KursBeginn + " " + kurs.Dauer + " " + "Tag(e)";
                }
            }
        }

        public void HelperMethod()
        {
            #region guid1
            Guid guid = Guid.NewGuid();
            Guid guid2 = Guid.NewGuid();
            Guid guid3 = Guid.NewGuid();
            Guid guid4 = Guid.NewGuid();
            #endregion

            #region guid2
            Guid guid5 = Guid.NewGuid();
            Guid guid6 = Guid.NewGuid();
            Guid guid7 = Guid.NewGuid();
            Guid guid8 = Guid.NewGuid();
            #endregion

            #region guid3
            Guid guid9 = Guid.NewGuid();
            Guid guid10 = Guid.NewGuid();
            Guid guid11 = Guid.NewGuid();
            Guid guid12 = Guid.NewGuid();
            #endregion

            #region controls1
            TextBox txtName2 = new TextBox();
            txtName2.ID = "Name" + guid;
            txtName2.Width = 41;
            txtName2.CssClass = "nomargin";
            txtName2.Text = "";

            TextBox txtVorname2 = new TextBox();
            txtVorname2.ID = "Vorname" + guid2;
            txtVorname2.Width = 41;
            txtVorname2.CssClass = "ml";
            txtVorname.Text = "";

            TextBox txtGeburtsTag2 = new TextBox();
            txtGeburtsTag2.ID = "Geburtstag" + guid3;
            txtGeburtsTag2.Width = 41;
            txtGeburtsTag2.CssClass = "ml1";
            txtGeburtsTag2.Text = "";

            TextBox txtTNFAKNumme99 = new TextBox();
            txtTNFAKNumme99.ID = "FAKNummer" + guid4;
            txtTNFAKNumme99.Width = 41;
            txtTNFAKNumme99.CssClass = "ml2";
            txtTNFAKNumme99.Text = "";
            #endregion


            #region controls2
            TextBox txtName3 = new TextBox();
            txtName3.ID = "Name" + guid5;
            txtName3.Width = 41;
            txtName3.CssClass = "nomargin";

            TextBox txtVorname3 = new TextBox();
            txtVorname3.ID = "Vorname" + guid6;
            txtVorname3.Width = 41;
            txtVorname3.CssClass = "ml";

            TextBox txtGeburtsTag3 = new TextBox();
            txtGeburtsTag3.ID = "Geburtstag" + guid7;
            txtGeburtsTag3.Width = 41;
            txtGeburtsTag3.CssClass = "ml1";

            TextBox txtTNFAKNummer3 = new TextBox();
            txtTNFAKNummer3.ID = "FAKNummer" + guid8;
            txtTNFAKNummer3.Width = 41;
            txtTNFAKNummer3.CssClass = "ml2";
            #endregion

            #region controls3
            TextBox txtName4 = new TextBox();
            txtName4.ID = "Name" + guid9;
            txtName4.Width = 41;
            txtName4.CssClass = "nomargin";

            TextBox txtVorname4 = new TextBox();
            txtVorname4.ID = "Vorname" + guid10;
            txtVorname4.Width = 41;
            txtVorname4.CssClass = "ml";

            TextBox txtGeburtsTag4 = new TextBox();
            txtGeburtsTag4.ID = "Geburtstag" + guid11;
            txtGeburtsTag4.Width = 41;
            txtGeburtsTag4.CssClass = "ml1";

            TextBox txtTNFAKNummer4 = new TextBox();
            txtTNFAKNummer4.ID = "FAKNummer" + guid12;
            txtTNFAKNummer4.Width = 41;
            txtTNFAKNummer4.CssClass = "ml2";
            #endregion

            #region addToPlaceholderControl1
            phTeilNehmer.Controls.Add(txtName2);
            phTeilNehmer.Controls.Add(txtVorname2);
            phTeilNehmer.Controls.Add(txtGeburtsTag2);
            phTeilNehmer.Controls.Add(txtTNFAKNumme99);
            #endregion

            #region addToPlaceholderControl2
            phTeilNehmer.Controls.Add(txtName3);
            phTeilNehmer.Controls.Add(txtVorname3);
            phTeilNehmer.Controls.Add(txtGeburtsTag3);
            phTeilNehmer.Controls.Add(txtTNFAKNummer3);
            #endregion

            #region addToPlaceholderControl3
            phTeilNehmer.Controls.Add(txtName4);
            phTeilNehmer.Controls.Add(txtVorname4);
            phTeilNehmer.Controls.Add(txtGeburtsTag4);
            phTeilNehmer.Controls.Add(txtTNFAKNummer4);
            #endregion
        }
    }
}