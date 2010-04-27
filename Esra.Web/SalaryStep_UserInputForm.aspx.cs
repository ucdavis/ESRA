using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CAESDO.Esra.BLL;
using CAESDO.Esra.Core.Domain;
using System.Globalization;
using CAESDO.Esra.Data;

namespace CAESDO.Esra.Web
{
    public partial class SalaryStep_UserInputForm : ApplicationPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.SetActiveView(vDisplaySalaryScales);
            }
        }

        protected void gvSalaryScales_Sorting(object sender, GridViewSortEventArgs e)
        {
            gridView_Sorting((GridView)sender, e, odsSalaryScale, "SalaryStep_UserInputForm");
        }

        protected void btnClick_Command(object sender, CommandEventArgs e)
        {
            string[] keySegments = ((string)e.CommandArgument).Split(new char[] { '|' });
            if (e.CommandName.Equals("remove"))
            {
                SalaryScale ss = new SalaryScale()
                {
                    TitleCode = keySegments[0],
                    EffectiveDate = Convert.ToDateTime(keySegments[1])
                };

                ss = SalaryScaleBLL.GetByInclusionExample(ss, "TitleCode", "EffectiveDate")[0];

                if (!SalaryScaleBLL.CanBeDeleted(ss))
                {
                    SetMasterPageLabel(MASTER_PAGE_MESSAGE_LABEL_NAME, MESSAGE_CHILD_RECORDS_EXIST);
                }
                else
                {
                    SalaryScaleBLL.DeleteRecord(ss, true);
                    gvSalaryScales.DataBind();

                    SetMasterPageLabel(MASTER_PAGE_MESSAGE_LABEL_NAME, MESSAGE_RECORD_DELETED_SUCCESS);
                }
            }
        }

        protected void lvSalarySteps_ItemEditing(object sender, EventArgs e)
        {
            ResetMasterPageLabel(MASTER_PAGE_MESSAGE_LABEL_NAME);
        }

        protected void gvSalaryScales_OnCommand(object sender, CommandEventArgs e)
        {
            string[] keySegments = ((string)e.CommandArgument).Split(new char[]{'|'}) ;
            if (e.CommandName.Equals("Copy"))
            {
                SalaryScale ss = SalaryScaleBLL.GetEffectiveSalaryScale(keySegments[0], Convert.ToDateTime(keySegments[1]));
                
                SalaryScale ssCopy = ss.InitializedCopy();
                List<SalaryScale> ssList = new List<SalaryScale>();
                ssList.Add(ssCopy);
                lvNewSalaryScale.DataSource = ssList;
                lvNewSalaryScale.DataBind();
                
                // Open the edit view and allow the user to edit the efective date and salary amounts.
                MultiView1.SetActiveView(vEditNewSalaryScale);
            }
        }

        protected void lvNewSalaryScale_OnCommand(object sender, EventArgs args)
        {

        }

        protected void tbSalaryAmount_OnTextChanged(object sender, EventArgs args)
        {
            NumberStyles styles = NumberStyles.Number | NumberStyles.AllowCurrencySymbol;
            NumberFormatInfo numberFormatInfo = CultureInfo.CurrentCulture.NumberFormat;
            TextBox tb = (TextBox)sender;
            ListViewDataItem item = (ListViewDataItem)tb.NamingContainer;

            // get new salary amount:
            double newSalary = 0;
            double.TryParse(tb.Text, styles, numberFormatInfo, out newSalary);
            tb.Text = String.Format("{0:c}", newSalary);
           
            // calculate new monthly amount:
            double monthlyAmount = newSalary / 12;
            Label lblMonthly = item.FindControl("lblMonthly2") as Label;
            if (lblMonthly == null)
            {
                lblMonthly = item.FindControl("lblMonthly3") as Label;
            }
            monthlyAmount = Math.Round(monthlyAmount, 0, MidpointRounding.AwayFromZero);
            lblMonthly.Text = String.Format("{0:c}", monthlyAmount);

            // calculate new hourly amount:
            double hourlyAmount = newSalary / 2088;
            Label lblHourly = item.FindControl("lblHourly2") as Label;
            if (lblHourly == null)
            {
                lblHourly = item.FindControl("lblHourly3") as Label;
            }
            lblHourly.Text = String.Format("{0:c}", hourlyAmount);
        }

        protected void vNewSalaryScale_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            NumberStyles styles = NumberStyles.Number | NumberStyles.AllowCurrencySymbol;
            NumberFormatInfo numberFormatInfo = CultureInfo.CurrentCulture.NumberFormat;

            ListView lv = sender as ListView;
            ListViewItem lvi = lv.Items[e.ItemIndex];

            Label lblTitleCode = lvi.FindControl("TitleCodeLabel") as Label;
            string titleCode = lblTitleCode.Text;

            TextBox tbEffectiveDate = lvi.FindControl("tbEffectiveDate") as TextBox;
            string effectiveDateStr = tbEffectiveDate.Text;
            DateTime effectiveDate = Convert.ToDateTime(effectiveDateStr);

            Label lblNumSalarySteps = lvi.FindControl("NumSalaryStepsLabel") as Label;
            string numSalarySteps = lblNumSalarySteps.Text;

            ListView lvSalarySteps = lvi.FindControl("lvSalarySteps") as ListView;
            IList<ListViewDataItem> stepItems = lvSalarySteps.Items;

            if (stepItems.Count > 0)
            {
                SalaryScale ss = SalaryScaleBLL.GetEffectiveSalaryScale(titleCode, effectiveDate);
                SalaryScale ssCopy = ss.InitializedCopy();
                ssCopy.EffectiveDate = effectiveDate;
                
                int stepIndex = 0;
                foreach (ListViewItem item in stepItems)
                {   
                    TextBox tbAnnual = item.FindControl("tbAnnual2") as TextBox;
                    if (tbAnnual == null)
                        tbAnnual = (TextBox)item.FindControl("tbAnnual3");
                    string annual = tbAnnual.Text;

                    // get new salary amount:
                    double newSalary = 0;
                    double.TryParse(annual, styles, numberFormatInfo, out newSalary);
                    double monthlyAmount = 0;
                    double hourlyAmount = 0;
                    if (newSalary > 0)
                    {
                        monthlyAmount = Math.Round((newSalary / 12), 0, MidpointRounding.AwayFromZero);
                        hourlyAmount = newSalary / 2088;

                        SalaryStep step = ssCopy.SalarySteps[stepIndex];
                        step.Annual = newSalary;
                        step.EffectiveDate = effectiveDate;
                        step.Monthly = monthlyAmount;
                        step.Hourly = hourlyAmount;
                    }
                    stepIndex++;
                }
                // Only save salary scale if there's salary steps present.
                // All the save logic goes here.
                SalaryScaleBLL.InsertRecord(ssCopy); 

                // Exit the "Add" view and return back to the select display view:
                gvSalaryScales.DataBind();

                SetMasterPageLabel(MASTER_PAGE_MESSAGE_LABEL_NAME, MESSAGE_RECORD_SAVED_SUCCESS);

                MultiView1.SetActiveView(vDisplaySalaryScales);
            }
        }
    }
}
