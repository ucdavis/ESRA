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
    public partial class SalaryReviewAnalysis : ApplicationPage
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            // Scott says to put logic for query string parsing in the Page_Init method.
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(vSelectSalaryReviewAnalysis);
        }
    }
}
