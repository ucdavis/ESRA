using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CAESDO.Esra.Web
{
    public partial class ExportToExcel : ApplicationPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            byte[] byteArray = (byte[])HttpContext.Current.Session["ExportExcel"];

            // Send the XML file to the web browser for download.
            Response.Clear();
            Response.AppendHeader("Content-Disposition", "filename=MyExportedFile.xml");
            Response.AppendHeader("Content-Length", byteArray.Length.ToString());
            Response.ContentType = "application/octet-stream";
            Response.BinaryWrite(byteArray);
        }
    }
}
