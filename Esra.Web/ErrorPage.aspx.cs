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
    public partial class ErrorPage : ApplicationPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                lit_ErrorType.Text = Server.HtmlDecode(Request.QueryString["reason"]);
            }
        }
    }
}
