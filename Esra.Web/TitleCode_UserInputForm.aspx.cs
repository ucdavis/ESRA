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
using CAESDO.Esra.BLL;
using CAESDO.Esra.Core.Domain;
using System.Globalization;

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
            CAESDO.Esra.Core.Domain.Title title = (CAESDO.Esra.Core.Domain.Title)gv.SelectedValue;
            ViewState.Add(CURRENT_SELECTED_TITLECODE_KEY_NAME, ((GridView)sender).SelectedValue);
            lblTitleCode.Text = title.TitleCode;
            lblPayrollTitle.Text = title.PayrollTitle;
            lblSalaryGrade.Text = title.SalaryGrade;
            lblBargainingCode.Text = title.BargainingCode;
            lblCollegeAverageAnnual.Text = "TBD (Calculated)";
            MultiView1.SetActiveView(vInsertNewTitleCodeAverages);
        }

        protected void btnClick_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName.Equals("cancel"))
            {
                
            }
            else if (e.CommandName.Equals("save"))
            {
                NumberStyles styles = NumberStyles.Number | NumberStyles.AllowCurrencySymbol;
                NumberFormatInfo numberFormatInfo = CultureInfo.CurrentCulture.NumberFormat;
                Title title = ViewState[CURRENT_SELECTED_TITLECODE_KEY_NAME] as Title;
                SalaryScale ss = new SalaryScale();

                ss.BargainingCode = title.BargainingCode;
                ss.SalaryGrade = title.SalaryGrade;

                double campusAverageAnnual = 0;
                double.TryParse(tbCampusAverageAnnual.Text, styles, numberFormatInfo, out campusAverageAnnual);
                ss.CampusAverageAnnual = campusAverageAnnual;

                DateTime today = DateTime.Today;
                DateTime.TryParse(tbEffectiveDate.Text, out today);
                ss.EffectiveDate = today;

                double laborMarketMidAnnual = 0;
                double.TryParse(tbLaborMarketMid.Text, styles, numberFormatInfo, out laborMarketMidAnnual);
                ss.LaborMarketMidAnnual = laborMarketMidAnnual;

                double laborMarketWAS = 0;
                double.TryParse(tbLaborMarketWAS.Text, styles, numberFormatInfo, out laborMarketWAS);
                ss.LaborMarketWAS = laborMarketWAS;

                ss.TitleCode = title.TitleCode;
                ss.Title = title;
                SalaryScaleBLL.InsertRecord(ss);
            }

            ViewState.Remove(CURRENT_SELECTED_TITLECODE_KEY_NAME);
            MultiView1.SetActiveView(vTitleCodeAverages);
        }
    }
}
