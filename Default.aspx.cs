using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SVBL_Kursangebote.Business;
using System.Text;

namespace SVB_Kursangebote.AspNet
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            rptKurs.ItemCommand += new RepeaterCommandEventHandler(rptKurs_ItemCommand);
        }

        void rptKurs_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            PHListedCourses.Visible = false;
            ucKursDetails.KursDetailsData = KursDetails.GetKursDetailsByKursUnterKategorieID(int.Parse(e.CommandArgument.ToString())).FirstOrDefault();
            int unterKategorie = int.Parse(Session["SelectedKategorieID"]!=null ? Session["SelectedKategorieID"].ToString() :"0");
            if (unterKategorie > 0)
            {
                KursUnterkategorie kursUnterKategorie = KursUnterkategorie.GetKursUnterkategorie(unterKategorie,1);
                ucKursDetails.SelectedKursKategorie = kursUnterKategorie.KursUneterkategorieTitel;
            }
            PHKursDetails.DataBind();
            PHKursDetails.Visible = true;
            StringBuilder sbScript = new StringBuilder();

        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            if (Session["SelectedKategorieID"] != null)
            {
                int unterKategorie = int.Parse(Session["SelectedKategorieID"].ToString());
                KursKategorie kursKategorie = KursKategorie.GetKursKategorieByKursKategorieID(unterKategorie).SingleOrDefault();
                ltlKursKategorie.Text = kursKategorie.KursKategorieTitel;
                List<Kurs> listOfCourses = Kurs.GetAll().Where(a => a.KursUnterKategorieID == unterKategorie && a.SpracheID == 1).OrderBy(t => t.KursNr).Distinct().ToList();
                rptKurs.DataSource = listOfCourses;
                rptKurs.DataBind();
            }
        }
    }
}