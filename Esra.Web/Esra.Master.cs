using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace CAESDO.Esra.Web
{
    public partial class Esra : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_Version.Text = "Version : " + System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString();

            if (!Page.IsPostBack)
            {
                if (Session["Message"] != null)
                {
                    this.lbl_Message.Text = Session["Message"].ToString();
                    this.lbl_Message.Visible = true;
                    Session["Message"] = null;
                }
                else
                {
                    this.lbl_Message.Visible = false;
                }
            }
            else
            {
                this.lbl_Message.Visible = false;
            }
        }
    }
}
