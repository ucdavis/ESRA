using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace CAESDO.Esra.Web
{
    public partial class TitleCode_UserInputForm : ApplicationPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvSalaryScale_Sorting(object sender, GridViewSortEventArgs e)
        {
            gridView_Sorting((GridView)sender, e, odsSalaryScale, "TitleCode_UserInputForm");
        }

        protected void gvSalaryScale_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            gridView_OnRowDataBound((GridView)sender, e, "tbLaborMarketWAS");
        }
    }
}
