using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SVBL.AspNet.Controls
{
    public partial class LeftMenu : System.Web.UI.UserControl
    {
        public static int KategorieID { get; set; }

        protected void Page_Init(object sender, EventArgs e)
        {
            rptKursKategorie.ItemCommand += new RepeaterCommandEventHandler(rptKursKategorie_ItemCommand);
        }

        void rptKursKategorie_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            foreach (RepeaterItem ri in rptKursKategorie.Items)
            {
                Repeater rptKursUnterKategorieFound = ri.FindControl("rptKursUnterKategorie") as Repeater;
                rptKursUnterKategorieFound.Visible = false;
            }

            Repeater rptKursUnterKategorie = e.Item.FindControl("rptKursUnterKategorie") as Repeater;
            rptKursUnterKategorie.Visible = true;

            Session["SelectedKategorieID"] = e.CommandArgument.ToString();



            rptKursUnterKategorie.DataSource = SVBL_Kursangebote.Business.KursUnterkategorie.GetKursUnterkategorieByKursKategorieID(int.Parse(e.CommandArgument.ToString())).Where(ku=>ku.SpracheID ==1);
            rptKursUnterKategorie.DataBind();    
        }
        protected void Page_Load(object sender, EventArgs e)
        {
                rptKursKategorie.DataSource = SVBL_Kursangebote.Business.KursKategorie.GetAll();
                rptKursKategorie.DataBind();
        }

    }
}