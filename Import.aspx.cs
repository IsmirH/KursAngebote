using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using SVBL_Kursangebote.Business;

namespace SVB_Kursangebote.AspNet
{
    public partial class Import : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadCsvData("C:\\KURSE_DS_TI 2012-12-19(269).csv");
        }
        private void loadCsvData(string fileName)
        {
            FileInfo fileIn = new FileInfo(fileName);

            StreamReader reader = fileIn.OpenText();
           string encoder =reader.CurrentEncoding.GetEncoder().ToString();
            string[] lineIn;

            while (!reader.EndOfStream)
            {
                lineIn = reader.ReadLine().Split(';');
                //Validate values here  
                Kurs kurs = new Kurs();
 
                kurs.KursUnterKategorieID = int.Parse(lineIn[0]);
                kurs.KursNr = lineIn[1].ToString();
                kurs.KursTitel = lineIn[2].ToString();
                kurs.SpracheID = 1;
                kurs.KursOrt = lineIn[4].ToString();
                kurs.KursBeginn = lineIn[5].ToString();
                kurs.KursEnde = lineIn[6].ToString();
                kurs.Dauer = int.Parse(lineIn[7].ToString());
                kurs.MaxTn = int.Parse(lineIn[8].ToString());
                kurs.Gebucht = int.Parse(lineIn[10].ToString());
                kurs.Frei = int.Parse(lineIn[11].ToString());
                kurs.Status = lineIn[12].ToString().Equals("") ? "buchen" : "ausgebucht";


                Kurs.Insert(kurs);
            }

            reader.Close();
        }
    }
}