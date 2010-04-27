using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using CAESDO.Esra.BLL;
using CAESDO.Esra.Core.Domain;
using CAESDO.Esra.Data;

namespace CAESDO.Esra.Web
{
    public partial class NewSalarySteps_UserInputForm : ApplicationPage
    {
        public static readonly string KEY_CURRENT_SALARY_SCALE = "CurrentSalaryScale";

        protected SalaryScale CurrentSalaryScale
        {
            get { return ViewState[KEY_CURRENT_SALARY_SCALE] as SalaryScale; }
            set { ViewState.Add(KEY_CURRENT_SALARY_SCALE, value); }
        }

        protected String ReturnPage
        {
            get { return ViewState[KEY_RETURN_PAGE] as string; }
            set { ViewState.Add(KEY_RETURN_PAGE, value); }
        }

        protected string TitleCode
        {
            get
            {
                string retval = Request.QueryString[KEY_TITLE_CODE];

                long temp = 0;
                if (String.IsNullOrEmpty(retval) || retval.Length != 4 || long.TryParse(retval, out temp) == false)
                {
                    retval = null;
                }

                return retval;
            }
        }

        protected string EffectiveDate
        {
            get
            {
                string retval = Request.QueryString[KEY_EFFECTIVE_DATE];

                DateTime temp;
                if (String.IsNullOrEmpty(retval) || retval.Length == 0 || DateTime.TryParse(retval, out temp) == false)
                {
                    retval = null;
                }
                else
                {
                    retval = String.Format("{0:MM/dd/yyyy}", temp);
                }

                return retval;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ReturnPage = "~/Default.aspx";
                if (Request.UrlReferrer != null)
                    ReturnPage = Request.UrlReferrer.AbsolutePath;

                MultiView1.SetActiveView(vNoSalaryScaleDataProvided);

                if (String.IsNullOrEmpty(TitleCode) == false && String.IsNullOrEmpty(EffectiveDate) == false)
                {
                    MultiView1.SetActiveView(vDisplaySalaryScale);

                    /*
                    MultiView1.SetActiveView(vEditNewSalarySteps);
                    
                    SalaryScale ss = SalaryScaleBLL.GetSalaryScale(TitleCode, Convert.ToDateTime(EffectiveDate));
                    if (ss.SalarySteps == null || ss.SalarySteps.Count == 0)
                    {
                        ss.SalarySteps.Add(new SalaryStep(ss) { StepNumber = "1" } );
                    }

                    CurrentSalaryScale = ss; // Save current Salary Scale to View State.

                    IList<SalaryScale> list = new List<SalaryScale>();
                    list.Add(ss);

                    gvSalaryScale.DataSource = list;
                    gvSalaryScale.DataBind();
                     * */
                }
            }
        }

        protected void tbStepNumber_OnTextChanged(object sender, EventArgs args)
        {
            TextBox tb = (TextBox)sender;
            ListViewDataItem item = (ListViewDataItem)tb.NamingContainer;

            // Get the Step # or the item index:
            int dataItemIndex = item.DataItemIndex;
            SalaryStep ss = CurrentSalaryScale.SalarySteps[dataItemIndex];

            ss.StepNumber = tb.Text;
        }

        protected void tbSalaryAmount_OnTextChanged(object sender, EventArgs args)
        {
            NumberStyles styles = NumberStyles.Number | NumberStyles.AllowCurrencySymbol;
            NumberFormatInfo numberFormatInfo = CultureInfo.CurrentCulture.NumberFormat;
            TextBox tb = (TextBox)sender;
            ListViewDataItem item = (ListViewDataItem)tb.NamingContainer;

            // Get the Step # or the item index:
            int dataItemIndex = item.DataItemIndex;
            SalaryStep ss = CurrentSalaryScale.SalarySteps[dataItemIndex];

            // get new salary amount:
            double newSalary = 0;
            double.TryParse(tb.Text, styles, numberFormatInfo, out newSalary);
            tb.Text = String.Format("{0:c}", newSalary);
            ss.Annual = newSalary;

            // calculate new monthly amount:
            double monthlyAmount = newSalary / 12;

            monthlyAmount = Math.Round(monthlyAmount, 0, MidpointRounding.AwayFromZero);
            Label lblMonthly = findLabel(item, "Monthly");
            lblMonthly.Text = String.Format("{0:c}", monthlyAmount);
            ss.Monthly = monthlyAmount;


            // calculate new hourly amount:
            double hourlyAmount = newSalary / 2088;
            Label lblHourly = findLabel(item, "Hourly");
            lblHourly.Text = String.Format("{0:c}", hourlyAmount);
            ss.Hourly = hourlyAmount;
        }

        private Label findLabel(ListViewDataItem item, string namePart)
        {
            Label lbl = item.FindControl("lbl" + namePart) as Label;
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

        private TextBox findTextBox(ListViewDataItem item, string namePart)
        {
            TextBox tb = item.FindControl("tb" + namePart) as TextBox;
            if (tb == null)
            {
                tb = item.FindControl("tb" + namePart + "Alt") as TextBox;
                if (tb == null)
                {
                    tb = item.FindControl("tb" + namePart + "2") as TextBox;
                    if (tb == null)
                    {
                        tb = item.FindControl("tb" + namePart + "3") as TextBox;
                    }
                }
            }
            return tb;
        }

        protected void lvSalarySteps_ItemEditing(object sender, EventArgs e)
        {
            ResetMasterPageLabel(MASTER_PAGE_MESSAGE_LABEL_NAME);
        }

        protected void lbtnAddAnotherSalaryStep_Click(object sender, EventArgs e)
        {
            int nextStepNumber = CurrentSalaryScale.SalarySteps.Count + 1;
            CurrentSalaryScale.SalarySteps.Add(new SalaryStep(CurrentSalaryScale) { StepNumber = nextStepNumber.ToString() });

            IList<SalaryScale> scales = new List<SalaryScale>();
            scales.Add(CurrentSalaryScale);

            gvSalaryScale.DataSource = scales;
            gvSalaryScale.DataBind();
        }

        protected void lbtnEdit_Click(object sender, EventArgs e)
        {
            SalaryScale ss = SalaryScaleBLL.GetSalaryScale(TitleCode, Convert.ToDateTime(EffectiveDate));
            if (ss.SalarySteps == null || ss.SalarySteps.Count == 0)
            {
                ss.SalarySteps.Add(new SalaryStep(ss) { StepNumber = "1" });
            }

            CurrentSalaryScale = ss; // Save current Salary Scale to View State.

            IList<SalaryScale> list = new List<SalaryScale>();
            list.Add(ss);

            gvSalaryScale.DataSource = list;
            gvSalaryScale.DataBind();

            MultiView1.SetActiveView(vEditNewSalarySteps);
        }

        protected void lbtnDeleteSalaryStep_Click(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
            ListViewDataItem item = (ListViewDataItem)lb.NamingContainer;

            // Get the Step # or the item index:
            int dataItemIndex = item.DataItemIndex;
            CurrentSalaryScale.SalarySteps.Remove(CurrentSalaryScale.SalarySteps[dataItemIndex]);

            IList<SalaryScale> scales = new List<SalaryScale>();
            scales.Add(CurrentSalaryScale);

            gvSalaryScale.DataSource = scales;
            gvSalaryScale.DataBind();

            (gvSalaryScale.FindControl("upNumSalarySteps") as UpdatePanel).Update();
        }

        protected void gvSalaryScales_OnCommand(object sender, CommandEventArgs e)
        {
            if (e.CommandName.Equals("Save"))
            {
                SalaryScale ss = SalaryScaleBLL.GetSalaryScale(CurrentSalaryScale.TitleCode, CurrentSalaryScale.EffectiveDate);

                // This is necessary in order for the existing SalarySteps to be removed from the
                // relationship and the session; otherwise, we get an object with the same
                // identifier is already associated with the session.
                if (ss.SalarySteps != null && ss.SalarySteps.Count > 0)
                {
                    ss.SalarySteps.Clear();
                    SalaryScaleBLL.InsertRecord(ss);
                }

                ss.SalarySteps = CurrentSalaryScale.SalarySteps;
                ss.NumSalarySteps = CurrentSalaryScale.SalarySteps.Count;

                SalaryScaleBLL.InsertRecord(ss);

                // Exit the "Add" view and return back to the select display view:
                gvDisplaySalaryScale.DataBind();

                SetMasterPageLabel(MASTER_PAGE_MESSAGE_LABEL_NAME, MESSAGE_RECORD_UPDATED_SUCCESS);

                MultiView1.SetActiveView(vDisplaySalaryScale);

            }
            else if (e.CommandName.Equals("Exit"))
            {
                CurrentSalaryScale = null;
                //odsSalaryScale.DataBind();
                gvDisplaySalaryScale.DataBind();
                MultiView1.SetActiveView(vDisplaySalaryScale);
            }
        }

        protected void lbtnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect(ReturnPage);
        }
    }
}
