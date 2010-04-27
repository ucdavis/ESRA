using System;
using System.Web.UI;

namespace CAESDO.Esra.Web
{
    public partial class ErrorPage : ApplicationPage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                base.Page_Load(sender, e);
                lit_ErrorType.Text = Server.HtmlDecode(Request.QueryString["reason"]);
            }
        }
    }
}
