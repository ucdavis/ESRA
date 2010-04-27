using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using CAESDO.Esra.BLL;
using CAESDO.Esra.Core.Domain;
using Esra.Web.CatOps;

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
