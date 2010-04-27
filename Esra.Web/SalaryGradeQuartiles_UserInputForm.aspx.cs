using System;
using System.Web.UI.WebControls;
using CAESDO.Esra.Core.Domain;
using CAESDO.Esra.BLL;
using System.Globalization;

namespace CAESDO.Esra.Web
{
    public partial class SalaryGradeQuartiles_UserInputForm : ApplicationPage
    {
        protected static readonly string KEY_SALARY_GRADE = "SalaryGrade";
        protected string SalaryGrade
        {
            get { return ViewState[KEY_SALARY_GRADE] as string; }
            set {ViewState.Add(KEY_SALARY_GRADE, value); }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!IsPostBack)
            {
                ResetMasterPageLabel(MASTER_PAGE_MESSAGE_LABEL_NAME);
                MultiView1.SetActiveView(vShowQuartiles);
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
            bool success = true;

            string salaryGrade = (string)e.Keys["SalaryGrade"];
            DateTime effectiveDate = (DateTime)e.Keys["EffectiveDate"];

            //DateTime tempDate = new DateTime();
            //if (!DateTime.TryParse(tbEffectiveDate.Text, out tempDate))
            //tempDate = DateTime.Today;

            SalaryGradeQuartiles quartile = SalaryGradeQuartilesBLL.GetRecord(salaryGrade, effectiveDate);

            NumberStyles styles = NumberStyles.Number | NumberStyles.AllowCurrencySymbol;
            NumberFormatInfo numberFormatInfo = CultureInfo.CurrentCulture.NumberFormat;

            decimal minAnnual = 0;
            success = decimal.TryParse((string)e.NewValues["MinAnnual"], styles, numberFormatInfo, out minAnnual);
            if (!success)
            {
                EditFailed(e);
                return;
            }
            quartile.MinAnnual = minAnnual;

            decimal firstQrtleAnnual = 0;
            success = decimal.TryParse((string)e.NewValues["FirstQrtleAnnual"], styles, numberFormatInfo, out firstQrtleAnnual);
            if (!success)
            {
                EditFailed(e);
                return;
            }
            quartile.FirstQrtleAnnual = firstQrtleAnnual;

            decimal midAnnual = 0;
            success = decimal.TryParse((string)e.NewValues["MidAnnual"], styles, numberFormatInfo, out midAnnual);
            if (!success)
            {
                EditFailed(e);
                return;
            }
            quartile.MidAnnual = midAnnual;

            decimal thirdQrtleAnnual = 0;
            success = decimal.TryParse((string)e.NewValues["ThirdQrtleAnnual"], styles, numberFormatInfo, out thirdQrtleAnnual);
            if (!success)
            {
                EditFailed(e);
                return;
            }
            quartile.ThirdQrtleAnnual = thirdQrtleAnnual;

            decimal maxAnnual = 0;
            success = decimal.TryParse((string)e.NewValues["MaxAnnual"], styles, numberFormatInfo, out maxAnnual);
            if (!success)
            {
                EditFailed(e);
                return;
            }
            quartile.MaxAnnual = maxAnnual;

            SalaryGradeQuartilesBLL.InsertRecord(quartile);

            gvSalaryGradeQuartiles.DataBind();

            SetMasterPageLabel(MASTER_PAGE_MESSAGE_LABEL_NAME, MESSAGE_RECORD_UPDATED_SUCCESS);

            e.Cancel = true;
            ((GridView)sender).EditIndex = -1;
        }

        private void EditFailed(GridViewUpdateEventArgs e)
        {
            e.Cancel = true;
            SetMasterPageLabel(MASTER_PAGE_MESSAGE_LABEL_NAME, MESSAGE_RECORD_BAD_DATA_FORMAT);
        }

        protected void ddlSelectQuartile_SelectedIndexChanged(object sender, EventArgs e)
        {
            gvSalaryGradeQuartiles.DataBind();
        }

        protected void gvSalaryGradeQuartiles_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("New"))
            {

                /*
                string salaryGrade = ((string)e.CommandArgument).Trim();

                SalaryGradeQuartiles sgq = new SalaryGradeQuartiles()
                {
                     EffectiveDate = DateTime.Today,
                     SalaryGrade = salaryGrade
                };
                SalaryGradeQuartilesBLL.InsertRecord(sgq);
                gvSalaryGradeQuartiles.DataBind();

                SetMasterPageLabel(MASTER_PAGE_MESSAGE_LABEL_NAME, MESSAGE_RECORD_SAVED_SUCCESS); 
                 * */
            }
        }

        protected void gvSalaryGradeQuartiles_SelectedIndexChanged(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(vInsertQuartile);
            SalaryGrade = (string)((GridView)sender).SelectedValue;
            lblSalaryGrade.Text = SalaryGrade;
        }

        protected void btnClick_Command(object sender, CommandEventArgs e)
        {
            ResetMasterPageLabel(MASTER_PAGE_MESSAGE_LABEL_NAME);

            if (e.CommandName.Equals("cancel"))
            {
                MultiView1.SetActiveView(vShowQuartiles);
            }
            else if (e.CommandName.Equals("save"))
            {
                string salaryGrade = SalaryGrade;

                DateTime tempDate = new DateTime();
                if (!DateTime.TryParse(tbEffectiveDate.Text, out tempDate))
                    tempDate = DateTime.Today;

                SalaryGradeQuartiles quartile = new SalaryGradeQuartiles()
                {
                    SalaryGrade = salaryGrade,
                    EffectiveDate = tempDate
                };

                // First check to see if a record with this title code and effective date
                // already exists.
                if (SalaryGradeQuartilesBLL.Exists(quartile))
                {
                    SetMasterPageLabel(MASTER_PAGE_MESSAGE_LABEL_NAME, MESSAGE_RECORD_EXISTS);
                }
                else
                {
                // Otherwise, create a new one.
                    NumberStyles styles = NumberStyles.Number | NumberStyles.AllowCurrencySymbol;
                    NumberFormatInfo numberFormatInfo = CultureInfo.CurrentCulture.NumberFormat;

                    decimal minAnnual = 0;
                    decimal.TryParse(tbMinAnnual.Text, styles, numberFormatInfo, out minAnnual);
                    quartile.MinAnnual = minAnnual;

                    decimal firstQrtleAnnual = 0;
                    decimal.TryParse(tbFirstQrtleAnnual.Text, styles, numberFormatInfo, out firstQrtleAnnual);
                    quartile.FirstQrtleAnnual = firstQrtleAnnual;

                    decimal midAnnual = 0;
                    decimal.TryParse(tbMidAnnual.Text, styles, numberFormatInfo, out midAnnual);
                    quartile.MidAnnual = midAnnual;

                    decimal thirdQrtleAnnual = 0;
                    decimal.TryParse(tbThirdQrtleAnnual.Text, styles, numberFormatInfo, out thirdQrtleAnnual);
                    quartile.ThirdQrtleAnnual = thirdQrtleAnnual;

                    decimal maxAnnual = 0;
                    decimal.TryParse(tbMaxAnnual.Text, styles, numberFormatInfo, out maxAnnual);
                    quartile.MaxAnnual = maxAnnual;

                    SalaryGradeQuartilesBLL.InsertRecord(quartile);

                    gvSalaryGradeQuartiles.DataBind();

                    SetMasterPageLabel(MASTER_PAGE_MESSAGE_LABEL_NAME, MESSAGE_RECORD_SAVED_SUCCESS);
                }
            }
            else if (e.CommandName.Equals("remove"))
            {
                GridViewRow gvr = gvSalaryGradeQuartiles.Rows[Convert.ToInt32(e.CommandArgument)];

                string salaryGrade = ((Label)gvr.FindControl("lblSalaryGrade")).Text;
                string effectiveDateString = ((Label)gvr.FindControl("lblEffectiveDate")).Text;
                
                SalaryGradeQuartiles quartile = new SalaryGradeQuartiles()
                    {
                        SalaryGrade = salaryGrade,
                        EffectiveDate = Convert.ToDateTime(effectiveDateString)
                    };

                quartile = SalaryGradeQuartilesBLL.GetRecord(quartile);
                if (SalaryGradeQuartilesBLL.CanBeDeleted(quartile))
                {
                    SalaryGradeQuartilesBLL.DeleteRecord(quartile, true);
                    gvSalaryGradeQuartiles.DataBind();

                    SetMasterPageLabel(MASTER_PAGE_MESSAGE_LABEL_NAME, MESSAGE_RECORD_DELETED_SUCCESS);
                }
                else
                {
                    SetMasterPageLabel(MASTER_PAGE_MESSAGE_LABEL_NAME, MESSAGE_CHILD_RECORDS_EXIST);
                }
            }
            SalaryGrade = null;
            MultiView1.SetActiveView(vShowQuartiles);
        }
    }
}
