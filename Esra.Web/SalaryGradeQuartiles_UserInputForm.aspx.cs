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
    public partial class SalaryGradeQuartiles_UserInputForm : ApplicationPage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!IsPostBack)
            {
                ResetMasterPageLabel(MASTER_PAGE_MESSAGE_LABEL_NAME);
            }
        }

        protected void gvSalaryGradeQuartiles_Sorting(object sender, GridViewSortEventArgs e)
        {
            gridView_Sorting((GridView)sender, e, odsSalaryGradeQuartiles, "SalaryGradeQuartiles_UserInputForm");
        }

        protected void gvSalaryGradeQuartiles_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            gridView_OnRowDataBound((GridView)sender, e, "tbMinAnnual");
        }

        protected void gvSalaryGradeQuartiles_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            SetMasterPageLabel(MASTER_PAGE_MESSAGE_LABEL_NAME, MESSAGE_RECORD_UPDATED_SUCCESS);
        }
    }
}
