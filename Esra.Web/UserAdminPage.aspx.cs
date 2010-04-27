using System;

namespace CAESDO.Esra.Web
{
    public partial class UserAdminPage : ApplicationPage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!IsPostBack)
            {
                if (!IsAdminUser())
                {
                    string hl = "<br /><a href='Default.aspx'>Return to Home</a>";
                    string redirectURL = "~/ErrorPage.aspx?reason=" + ERROR_MESSAGE_NOT_AUTHORIZED + hl;
                    
                    Response.Redirect(redirectURL);
                }
            }
        }
    }
}
