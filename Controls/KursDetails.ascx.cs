using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SVB_Kursangebote.AspNet.Controls
{
    public partial class KursDetails : System.Web.UI.UserControl
    {
        public SVBL_Kursangebote.Business.KursDetails KursDetailsData { get; set; }
        public string SelectedKursKategorie { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            btnFreieDatum.Click += new EventHandler(btnFreieDatum_Click);
        }

        void btnFreieDatum_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected override void OnDataBinding(EventArgs e)
        {
            if (KursDetailsData != null)
            {
                lbl_kursinhalt.Text = KursDetailsData.Kursinhalt;
                lbl_zielgruppe.Text = KursDetailsData.Zielgruppe;
                lbl_voraussetzungen.Text = KursDetailsData.Voraussetzungen;
                lbl_teilnehmende.Text = KursDetailsData.Teilnehmende != null ? KursDetailsData.Teilnehmende.GetValueOrDefault().ToString() : "";
                lbl_Kursort.Text = KursDetailsData.Kursort;
                lbl_Kursdaten.Text = KursDetailsData.Kursdaten;
                lbl_Kursbeschreibung.Text = KursDetailsData.Kursbeschreibung;
                lbl_KostenNichtmitglieder.Text = KursDetailsData.KostenNichtmitglieder;
                lbl_kostenMitglieder.Text = KursDetailsData.KostenMitglieder;
                lbl_dauer.Text = KursDetailsData.Dauer;
                lbl_ausbildungsnachweis.Text = KursDetailsData.Ausbildungsnachweis;
                lbl_Ausbilder.Text = KursDetailsData.Ausbilder;
                ltlKursKategorie.Text = SelectedKursKategorie;
                img_logo.ImageUrl = "~/Logos/" + KursDetailsData.ImageUrl;
                pdf_link.HRef = "~/Documents/" + KursDetailsData.PDFUrl;

                if (KursDetailsData.Pausenverpflegung)
                {
                    imgPausenverpflegung.ImageUrl = "~/images/ja/pause_ja.jpg";
                }
                else
                {
                    imgPausenverpflegung.ImageUrl = "~/images/nein/pause_nein.jpg";
                }

                if (KursDetailsData.Mittagessen)
                {
                    imgMittagessen.ImageUrl = "~/images/ja/essen_ja.jpg";
                }
                else
                {
                    imgMittagessen.ImageUrl = "~/images/nein/essen_nein.jpg";
                }

                if (KursDetailsData.Getraenke_AlkoholFrei)
                {
                    imgGetrenkeAlkFrei.ImageUrl = "~/images/ja/getraenke_alkfrei_ja.jpg";
                }
                else
                {
                    imgGetrenkeAlkFrei.ImageUrl = "~/images/nein/getraenke_alkfrei_nein.jpg";
                }

                if (KursDetailsData.Alle_Getraenke)
                {
                    imgAlleGetrenk.ImageUrl = "~/images/ja/alle_getraenke_ja.jpg";
                }
                else
                {
                    imgAlleGetrenk.ImageUrl = "~/images/nein/alle_getraenke_nein.jpg";
                }

                if (KursDetailsData.Unterlagen)
                {
                    imgUnterlagen.ImageUrl = "~/images/ja/unterlagen_ja.jpg";
                }
                else
                {
                    imgUnterlagen.ImageUrl = "~/images/nein/unterlagen_nein.jpg";
                }

                if (KursDetailsData.Fuhrerausweis)
                {
                    imgFuhrerausweis.AlternateText = "Image missing";
                }
                else
                {
                    imgFuhrerausweis.ImageUrl = "~/images/nein/fuehrerausweis_nein.jpg" ;
                }
            }

            base.OnDataBinding(e);
        }
    }
}