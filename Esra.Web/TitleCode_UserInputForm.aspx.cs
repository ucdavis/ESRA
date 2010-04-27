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
        protected readonly string CURRENT_SELECTED_TITLECODE_KEY_NAME = "CurrentSelectedTitleCode";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.SetActiveView(vTitleCodeAverages);
            }
        }

        protected void gvSalaryScale_Sorting(object sender, GridViewSortEventArgs e)
        {
            gridView_Sorting((GridView)sender, e, odsSalaryScale, "TitleCode_UserInputForm");
        }

        protected void gvSalaryScale_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            gridView_OnRowDataBound((GridView)sender, e, "tbLaborMarketWAS");
        }

        protected void gvSalaryScale_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView gv = (GridView)sender;
            Session.Add(CURRENT_SELECTED_TITLECODE_KEY_NAME, ((GridView)sender).SelectedValue);
            MultiView1.SetActiveView(vInsertNewTitleCodeAverages);
        }
    }
}
