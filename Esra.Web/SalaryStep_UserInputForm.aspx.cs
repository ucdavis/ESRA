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
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
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
            else if (e.CommandName.Equals("Save"))
            {
                NumberStyles styles = NumberStyles.Number | NumberStyles.AllowCurrencySymbol;
                NumberFormatInfo numberFormatInfo = CultureInfo.CurrentCulture.NumberFormat;
                SalaryScale ss = new SalaryScale()
                {
                    TitleCode = keySegments[0],
                    EffectiveDate = Convert.ToDateTime(keySegments[1])
                };
                ss = SalaryScaleBLL.GetByInclusionExample(ss, "TitleCode", "EffectiveDate")[0];
                GridViewRow gvr = ((System.Web.UI.Control)sender).NamingContainer as GridViewRow;
                /*
                TextBox tbEffectiveDate = gvr.FindControl("tbEffectiveDate") as TextBox;
                string effectiveDateStr = tbEffectiveDate.Text;
                DateTime effectiveDate = Convert.ToDateTime(effectiveDateStr);
                // Should only do this if there's no SRAs associated with this SalaryScale; otherwise,
                // we'll possibly need to update the EffectiveDate on the SRA as well.
                // TODO: Add check if SRAs exist.
                bool hasSalaryReviewAnalysis = SalaryScaleBLL.HasSalaryReviewAnalysis(ss);
                if (!hasSalaryReviewAnalysis)
                {
                    ss.EffectiveDate = effectiveDate;
                }
                else
                {
                    // Display a message that the date can't be updated or w
                    // possibly update the EffectiveDate on the SRA or what?
                    //Don't change the date:
                    effectiveDate = ss.EffectiveDate;
                }
                */
                // In any case, update the salary steps:
                ListView lvSalarySteps = gvr.FindControl("lvSalarySteps") as ListView;
                IList<ListViewDataItem> stepItems = lvSalarySteps.Items;

                if (stepItems.Count > 0)
                {
                    int stepIndex = 0;
                    foreach (ListViewItem item in stepItems)
                    {
                        TextBox tbAnnual = findTBAnnual(item);
                        string annual = tbAnnual.Text;

                        // get new salary amount:
                        double newSalary = 0;
                        double.TryParse(annual, styles, numberFormatInfo, out newSalary);
                        double monthlyAmount = 0;
                        double hourlyAmount = 0;

                        SalaryStep step = ss.SalarySteps[stepIndex];
                        //step.EffectiveDate = effectiveDate;

                        if (newSalary > 0)
                        {
                            monthlyAmount = Math.Round((newSalary / 12), 0, MidpointRounding.AwayFromZero);
                            hourlyAmount = newSalary / 2088;
                            step.Annual = newSalary;
                            step.Monthly = monthlyAmount;
                            step.Hourly = hourlyAmount;
                        }
                        stepIndex++;
                    }
                    // Only save salary scale if there's salary steps present.
                    // All the save logic goes here.
                    SalaryScaleBLL.InsertRecord(ss);
                    IOrderedEnumerable<SalaryStep> sortedSteps = ss.SalarySteps.OrderBy(step => step);

                    // Exit the "Add" view and return back to the select display view:
                    gvSalaryScales.DataBind();
                    gvSalaryScales.EditIndex = -1;

                    SetMasterPageLabel(MASTER_PAGE_MESSAGE_LABEL_NAME, MESSAGE_RECORD_UPDATED_SUCCESS);

                    MultiView1.SetActiveView(vDisplaySalaryScales);
                }
            }
        }

        protected void lvNewSalaryScale_OnCommand(object sender, CommandEventArgs e)
        {
            if (e.CommandName.Equals("Close"))
            {
                ResetMasterPageLabel(MASTER_PAGE_MESSAGE_LABEL_NAME);
                MultiView1.SetActiveView(vDisplaySalaryScales);
            }
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
            
            monthlyAmount = Math.Round(monthlyAmount, 0, MidpointRounding.AwayFromZero);
            Label lblMonthly = findLabel(item, "Monthly");
            lblMonthly.Text = String.Format("{0:c}", monthlyAmount);

            // calculate new hourly amount:
            double hourlyAmount = newSalary / 2088;
            Label lblHourly = findLabel(item, "Hourly");
            lblHourly.Text = String.Format("{0:c}", hourlyAmount);
        }

        private Label findLabel(ListViewDataItem item, string namePart)
        {
            Label lbl = item.FindControl("lbl"+namePart) as Label;
            if (lbl == null)
            {
                lbl = item.FindControl("lbl" + namePart + "Alt") as Label;
                if (lbl == null)
                {
                    lbl = item.FindControl("lbl" + namePart + "2") as Label;
                    if (lbl == null)
                    {
                        lbl = item.FindControl("lbl" + namePart + "3") as Label;
                    }
                }
            }
            return lbl;
        }

        private TextBox findTBAnnual(ListViewItem item)
        {
            TextBox tbAnnual = item.FindControl("tbAnnual") as TextBox;
            if (tbAnnual == null)
            {
                tbAnnual = (TextBox)item.FindControl("tbAnnualAlt");
                if (tbAnnual == null)
                {
                    tbAnnual = (TextBox)item.FindControl("tbAnnual2");
                    if (tbAnnual == null)
                    {
                        tbAnnual = (TextBox)item.FindControl("tbAnnual3");
                    }
                }
            }
            return tbAnnual;
        }

        protected void ddlSelectTitle_SelectIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = sender as DropDownList;

            hiddenTitleCode.Value = ddl.SelectedValue;
            ddlSelectPayrollTitle.SelectedValue = ddl.SelectedValue;
            ddlSelectTitleCode.SelectedValue = ddl.SelectedValue;
            gvSalaryScales.DataBind();
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
                    TextBox tbAnnual = findTBAnnual(item);
                    string annual = tbAnnual.Text;

                    // get new salary amount:
                    double newSalary = 0;
                    double.TryParse(annual, styles, numberFormatInfo, out newSalary);
                    double monthlyAmount = 0;
                    double hourlyAmount = 0;

                    SalaryStep step = ssCopy.SalarySteps[stepIndex];
                    step.EffectiveDate = effectiveDate;

                    if (newSalary > 0)
                    {
                        monthlyAmount = Math.Round((newSalary / 12), 0, MidpointRounding.AwayFromZero);
                        hourlyAmount = newSalary / 2088;
                        step.Annual = newSalary;
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
