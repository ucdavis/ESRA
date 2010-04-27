using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CAESDO.Esra.Web
{
    public partial class SalaryStep_UserInputForm : ApplicationPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvSalaryScales_Sorting(object sender, GridViewSortEventArgs e)
        {
            gridView_Sorting((GridView)sender, e, odsSalaryScale, "SalaryStep_UserInputForm");
        }

        protected void lvSalarySteps_ItemEditing(object sender, EventArgs e)
        {
            ResetMasterPageLabel(MASTER_PAGE_MESSAGE_LABEL_NAME);
        }
    }
}
