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
        protected static readonly string CURRENT_SELECTED_TITLECODE_KEY_NAME = "CurrentSelectedTitleCode";
        
        protected void Page_Init(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

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
            ResetMasterPageLabel(MASTER_PAGE_MESSAGE_LABEL_NAME);

            GridView gv = (GridView)sender;
            CAESDO.Esra.Core.Domain.Title title = (CAESDO.Esra.Core.Domain.Title)gv.SelectedValue;
            ViewState.Add(CURRENT_SELECTED_TITLECODE_KEY_NAME, ((GridView)sender).SelectedValue);
            lblTitleCode.Text = title.TitleCode;
            lblPayrollTitle.Text = title.PayrollTitle;
            lblSalaryGrade.Text = title.SalaryGrade;
            lblBargainingCode.Text = title.BargainingCode;
            lblCollegeAverageAnnual.Text = "TBD (Calculated)";
            tbCampusAverageAnnual.Text = null;
            tbEffectiveDate.Text = null;
            tbLaborMarketMid.Text = null;
            tbLaborMarketWAS.Text = null;
            MultiView1.SetActiveView(vInsertNewTitleCodeAverages);
        }

        protected void btnClick_Command(object sender, CommandEventArgs e)
        {
            ResetMasterPageLabel(MASTER_PAGE_MESSAGE_LABEL_NAME);

            if (e.CommandName.Equals("cancel"))
            {
                // TODO: Add any logic specific for the "cancel" event.
                
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

                DateTime tempDate = new DateTime();
                if (DateTime.TryParse(tbEffectiveDate.Text, out tempDate))
                    ss.EffectiveDate = tempDate;
                else
                    ss.EffectiveDate = DateTime.Today;

                double laborMarketMidAnnual = 0;
                double.TryParse(tbLaborMarketMid.Text, styles, numberFormatInfo, out laborMarketMidAnnual);
                ss.LaborMarketMidAnnual = laborMarketMidAnnual;

                double laborMarketWAS = 0;
                double.TryParse(tbLaborMarketWAS.Text, styles, numberFormatInfo, out laborMarketWAS);
                ss.LaborMarketWAS = laborMarketWAS;

                ss.TitleCode = title.TitleCode;
                ss.Title = title;
                // First check to see if a record with this title code and effective date
                // already exists.
                if (SalaryScaleBLL.Exists(ss))
                {
                    SetMasterPageLabel(MASTER_PAGE_MESSAGE_LABEL_NAME, MESSAGE_RECORD_EXISTS);
                }
                else
                {
                    SalaryScaleBLL.InsertRecord(ss);
                    gvSalaryScale.DataBind();

                    SetMasterPageLabel(MASTER_PAGE_MESSAGE_LABEL_NAME, MESSAGE_RECORD_SAVED_SUCCESS);
                }
                
            }
            else if (e.CommandName.Equals("remove"))
            {
                GridViewRow gvr = gvSalaryScale.Rows[Convert.ToInt32(e.CommandArgument)];
                SalaryScale ss = new SalaryScale();
                string titleCode = ((Label)gvr.FindControl("lblTitleCode")).Text;
                ss.TitleCode = titleCode;
                string effectiveDateString = ((Label)gvr.FindControl("lblEffectiveDate")).Text;
                ss.EffectiveDate = Convert.ToDateTime(effectiveDateString);
                ss = SalaryScaleBLL.GetByInclusionExample(ss, "TitleCode", "EffectiveDate")[0];
                if (SalaryScaleBLL.CanBeDeleted(ss))
                {
                    SalaryScaleBLL.DeleteRecord(ss, true);
                    gvSalaryScale.DataBind();

                    SetMasterPageLabel(MASTER_PAGE_MESSAGE_LABEL_NAME, MESSAGE_RECORD_DELETED_SUCCESS);
                }
                else
                {
                    SetMasterPageLabel(MASTER_PAGE_MESSAGE_LABEL_NAME, MESSAGE_CHILD_RECORDS_EXIST);
                }
            }

            ViewState.Remove(CURRENT_SELECTED_TITLECODE_KEY_NAME);
            MultiView1.SetActiveView(vTitleCodeAverages);
        }

        protected void gvSalaryScale_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            SetMasterPageLabel(MASTER_PAGE_MESSAGE_LABEL_NAME, MESSAGE_RECORD_UPDATED_SUCCESS);
        }

        protected void gvSalaryScale_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ResetMasterPageLabel(MASTER_PAGE_MESSAGE_LABEL_NAME);
        }

        //protected void ResetMasterPageLabel(string labelName)
        //{
        //    Label lbl = (Label)Page.Master.FindControl(labelName);
        //    lbl.Visible = false;
        //    lbl.Text = "";
        //}

        //protected void SetMasterPageLabel(string labelName, string message)
        //{
        //    SetMasterPageLabel(labelName, message, true);
        //}

        //protected void SetMasterPageLabel(string labelName, string message, bool visible)
        //{
        //    Label lbl = (Label)Page.Master.FindControl(labelName);
        //    lbl.Visible = visible;
        //    lbl.Text = message;
        //}
    }
}
