using System;
using System.Web.UI.WebControls;
using CAESDO.Esra.Core.Domain;
using CAESDO.Esra.BLL;
using System.Collections.Generic;
using CAESDO.Core.Domain;
using System.Globalization;


namespace CAESDO.Esra.Web
{
    public partial class SalaryReviewAnalysisEditor : ApplicationPage
    {
        protected static readonly string KEY_REFERENCE_NUM = "ReferenceNumber";
        protected static readonly string KEY_EMPLOYEE_ID = "EmployeeID";
        protected static readonly string KEY_TITLE_CODE = "TitleCode";
        protected static readonly string KEY_EMPLOYEE_PAY_RATE = "Employee.PayRate";

        protected string EmployeeID
        {
            get
            {
                string retval = Request.QueryString[KEY_EMPLOYEE_ID];
                long temp = 0;

                if (String.IsNullOrEmpty(retval) || retval.Length != 13 || long.TryParse(retval, out temp) == false)
                {
                    retval = null;
                }
                
                return retval;
            }
        }

        protected string ReferenceNum
        {
            get
            {
                string retval = Request.QueryString[KEY_REFERENCE_NUM];
                long temp = 0;

                // ###20081001 min length = 11
                if (String.IsNullOrEmpty(retval) || retval.Length < 11 || long.TryParse(retval, out temp) == false)
                {
                    retval = null;
                }

                return retval;
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Clear out any previous values.
                Session.Remove(KEY_TITLE_CODE);
                Session.Remove(KEY_EMPLOYEE_ID);
                Session.Remove(KEY_EMPLOYEE_PAY_RATE);
                Session.Remove(KEY_REFERENCE_NUM);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //MultiView1.SetActiveView(vEmployees);
            if (!IsPostBack)
            {
                List<Employee> empList = new List<Employee>();
                List<Title> titleList = new List<Title>();
                SalaryReviewAnalysis sra = null;
                Employee emp = null;
                IList<Scenario> scenarios = null;

                if (String.IsNullOrEmpty(ReferenceNum) == false)
                {
                    sra = SalaryReviewAnalysisBLL.GetByProperty(KEY_REFERENCE_NUM, ReferenceNum);
                    if (sra != null)
                    {
                        emp = sra.Employee;
                        scenarios = sra.Scenarios;
                    }
                }
                else if (String.IsNullOrEmpty(EmployeeID) == false )
                {
                    emp = EmployeeBLL.GetByID(EmployeeID);
                }

                if (emp != null)
                {
                    empList.Add(emp);
                    titleList.Add(emp.Title);
                    Session.Add(KEY_EMPLOYEE_PAY_RATE, emp.PayRate);
                    Session.Add(KEY_TITLE_CODE, emp.Title.TitleCode);
                    rptScenarios_Init(scenarios);
                }
               
                gvEmployees.DataSource = empList;
                gvEmployees.DataBind();
                gvTitle.DataSource = titleList;
                gvTitle.DataBind();
                gvEmployeeTitle.DataSource = empList;
                gvEmployeeTitle.DataBind();
            }
        }

        protected void rtpSalary_OnItemDataBound(object sender, EventArgs e)
        {
            Repeater rpt = (Repeater)sender;
            if (rpt.Items.Count > 0)
            {
                rpt.Visible = true;
            }
            else
            {
                rpt.Visible = false;
            }
        }
        /*
        protected void tblTitleHeader_Init(Employee emp)
        {
            //((Label)gvEmployeeTitle.FindControl("lblEmployeeTitleCode")).Text = emp.Title.TitleCode;
            //((Label)gvEmployeeTitle.FindControl("lblEmployeePayrollTitle")).Text = emp.Title.PayrollTitle;
            //((Label)gvEmployeeTitle.FindControl("lblEmployeeSalaryGrade")).Text = emp.Title.SalaryGrade;
            //((Label)gvEmployeeTitle.FindControl("lblEmployeeSalaryStep")).Text = emp.SalaryStep;
            //((Label)gvEmployeeTitle.FindControl("lblEmployeeBargainingUnit")).Text = emp.Title.BargainingCode;
            //((Label)gvEmployeeTitle.FindControl("lblEmployeeReportDate")).Text = String.Format("{0:MM/dd/yyyy}", DateTime.Today);

            lblTblTitleHeaderTitleCode.Text = emp.Title.TitleCode;
            lblTblTitleHeaderPayrollTitle.Text = emp.Title.PayrollTitle;
            lblTblTitleHeaderSalaryGrade.Text = emp.Title.SalaryGrade;
            lblTblTitleHeaderSalaryStep.Text = emp.SalaryStep;
            lblTblTitleHeaderBargainingUnit.Text = emp.Title.BargainingCode;
            lblTblTitleHeaderReportDate.Text = String.Format("{0:MM/dd/yyyy}", DateTime.Today);
        }
        */

        /*
        protected void tblEmpDetails_Init(Employee emp)
        {
            lblTblEmpDetailsDeptName.Text = emp.HomeDepartment.Name;
            lblTblEmpDetailsEmpName.Text = emp.FullName;
            lblTblEmpDetailsHireDate.Text = String.Format("{0:MM/dd/yyyy}", emp.AdjustedCareerHireDate);
            lblTblEmpDetailsYearsOfService.Text = Convert.ToString(emp.YearsOfService);
            lblTblEmpDetailsBeginDate.Text = String.Format("{0:MM/dd/yyyy}", emp.AdjustedApptHireDate);
            lblTblEmpDetailsTimeInTitle.Text = Convert.ToString(emp.TimeInTitle);
            lblTblEmpDetailsPayRate.Text = String.Format("{0:c}", emp.PayRate);
            lblTblEmpDetailsDepartmentComments.Text = emp.DepartmentComments;
            lblTblEmpDetailsDeansOfficeComments.Text = emp.DeansOfficeComments;
        }
        */

        protected void rptScenarios_Init()
        {
            rptScenarios_Init(null);
        }

        protected void rptScenarios_Init(IList<Scenario> scenarios)
        {
            if (scenarios == null)
            {
                scenarios = new List<Scenario>();
                scenarios.Add(new Scenario() { ScenarioNumber = 1, SelectionType = SelectionTypeBLL.GetByType(SelectionType.NONE).Type });
            }
            rptScenarios.DataSource = scenarios;
            rptScenarios.DataBind();
        }

        override protected void OnInit(EventArgs e)
        {
            base.OnInit(e);
            rptScenarios.ItemCommand += new RepeaterCommandEventHandler(rptScenarios_ItemCommand);
        }

        protected void rptScenarios_ItemCommand(object sender, RepeaterCommandEventArgs args)
        {
            if (args.CommandArgument.Equals("resetApproved"))
            {
                RadioButton rb = args.Item.FindControl("rbApproved") as RadioButton;
                if (rb == null)
                {
                    rb = args.Item.FindControl("rbApprovedAlt") as RadioButton;
                }
                rb.Checked = false;
            }
            else if (args.CommandArgument.Equals("resetFields"))
            {
                //RadioButton rb = args.Item.FindControl("rbApproved") as RadioButton;
                //if (rb == null)
                //{
                //    rb = args.Item.FindControl("rbApprovedAlt") as RadioButton;
                //}
                //rb.Checked = false;

                CheckBox ckBox = args.Item.FindControl("cbxApproved") as CheckBox;
                if (ckBox == null)
                {
                    ckBox = args.Item.FindControl("cbxApprovedAlt") as CheckBox;
                }
                ckBox.Checked = false;

                DropDownList ddlCriteria = args.Item.FindControl("ddlCriteria") as DropDownList;
                if (ddlCriteria == null)
                {
                    ddlCriteria = args.Item.FindControl("ddlCriteriaAlt") as DropDownList;
                }
                ddlCriteria.SelectedIndex = -1;

                TextBox tbPercentIncrease = args.Item.FindControl("tbPercentIncrease") as TextBox;
                if (tbPercentIncrease == null)
                {
                    tbPercentIncrease = args.Item.FindControl("tbPercentIncreaseAlt") as TextBox;
                }
                tbPercentIncrease.Text = String.Format("{0:p}", 0);

                TextBox tbSalaryAmount = args.Item.FindControl("tbSalaryAmount") as TextBox;
                if (tbSalaryAmount == null)
                {
                    tbSalaryAmount = args.Item.FindControl("tbSalaryAmountAlt") as TextBox;
                }
                tbSalaryAmount.Text = String.Format("{0:c}", (double)Session["Employee.PayRate"]);
            }
        }

        protected void ddlCriteria_SelectedIndexChanged(object sender, EventArgs args)
        {
            DropDownList ddl = (DropDownList)sender;
            double newSalary = 0;
            double.TryParse(ddl.SelectedValue, out newSalary);
            RepeaterItem item = (RepeaterItem)ddl.Parent;
            TextBox tbSalaryAmount = item.FindControl("tbSalaryAmount") as TextBox;
            if (tbSalaryAmount == null)
            {
                tbSalaryAmount = item.FindControl("tbSalaryAmountAlt") as TextBox;
            }
            double oldSalary = (double)Session["Employee.PayRate"];
            
            if (newSalary == 0)
            {
                newSalary = oldSalary;
            }
            tbSalaryAmount.Text = String.Format("{0:c}", newSalary);

            // calculate percent increase up or down:

            double percentIncrease = (newSalary / oldSalary - 1);
            TextBox tbPercentIncrease = item.FindControl("tbPercentIncrease") as TextBox;
            if (tbPercentIncrease == null)
            {
                tbPercentIncrease = item.FindControl("tbPercentIncreaseAlt") as TextBox;
            }
            tbPercentIncrease.Text = String.Format("{0:p}", percentIncrease);
        }

        protected void tbSalaryAmount_OnTextChanged(object sender, EventArgs args)
        {
            NumberStyles styles = NumberStyles.Number | NumberStyles.AllowCurrencySymbol;
            NumberFormatInfo numberFormatInfo = CultureInfo.CurrentCulture.NumberFormat;
            TextBox tb = (TextBox)sender;
            RepeaterItem item = (RepeaterItem)tb.Parent;
            DropDownList ddl = item.FindControl("ddlCriteria") as DropDownList;
            if (ddl == null)
            {
                ddl = item.FindControl("ddlCriteriaAlt") as DropDownList;
            }

            ddl.SelectedIndex = -1; // reset ddl

            // get new salary amount:
            double newSalary = 0;
            double.TryParse(tb.Text, styles, numberFormatInfo, out newSalary);
            tb.Text = String.Format("{0:c}", newSalary);

            // get old salary amount:
            double oldSalary = (double)Session["Employee.PayRate"];
  
            // calculate percent increase up or down:
            double percentIncrease = (newSalary / oldSalary - 1);
            TextBox tbPercentIncrease = item.FindControl("tbPercentIncrease") as TextBox;
            if (tbPercentIncrease == null)
            {
                tbPercentIncrease = item.FindControl("tbPercentIncreaseAlt") as TextBox;
            }
            tbPercentIncrease.Text = String.Format("{0:p}", percentIncrease);
        }

        protected void tbPercentIncrease_OnTextChanged(object sender, EventArgs args)
        {
            NumberStyles styles = NumberStyles.Number | NumberStyles.AllowCurrencySymbol | NumberStyles.AllowTrailingSign | NumberStyles.AllowLeadingSign | NumberStyles.AllowDecimalPoint | NumberStyles.AllowTrailingWhite;
            NumberFormatInfo numberFormatInfo = CultureInfo.CurrentCulture.NumberFormat;
            TextBox tb = (TextBox)sender;
            RepeaterItem item = (RepeaterItem)tb.Parent;
            DropDownList ddl = item.FindControl("ddlCriteria") as DropDownList;
            if (ddl == null)
            {
                ddl = item.FindControl("ddlCriteriaAlt") as DropDownList;
            }

            ddl.SelectedIndex = -1; // reset ddl

            // get the percentage:
            // For some reason the space percent sign is not converting properly.
            tb.Text = tb.Text.Replace("%", "");
            double percentIncrease = 0;
            double.TryParse(tb.Text, styles, numberFormatInfo, out percentIncrease);
            tb.Text = String.Format("{0:p}", (percentIncrease/100));

            // get old salary amount:
            double oldSalary = (double)Session["Employee.PayRate"];

            // calculate new salary amount based on percent increase up or down:
            double newSalary = oldSalary * (1 + (percentIncrease / 100));
            TextBox tbSalaryAmount = item.FindControl("tbSalaryAmount") as TextBox;
            if (tbSalaryAmount == null)
            {
                tbSalaryAmount = item.FindControl("tbSalaryAmountAlt") as TextBox;
            }
            tbSalaryAmount.Text = String.Format("{0:c}", newSalary);
         }

        protected decimal? GetSelectedValue(object item)
        {
            decimal? retval = null;

            Scenario scenario = ((RepeaterItem)item).DataItem as Scenario;
            if (scenario != null)
            {
                if (scenario.SelectionType.Equals(SelectionType.NONE) == false)
                {
                    retval = SalaryScaleBLL.GetCriteriaListItems(Session[KEY_TITLE_CODE] as String)[scenario.SelectionType];
                }
            }

            return retval;
        }

        protected void btnAddAnotherScenario_Click(object sender, EventArgs e)
        {
            Repeater rpt = ((System.Web.UI.Control)sender).Parent.NamingContainer as Repeater;
            RepeaterItemCollection items = rpt.Items;

            List<Scenario> scenarios = new List<Scenario>();
            foreach (RepeaterItem item in items)
            {
                scenarios.Add(UpdateScenarioValues(item));
            }
            scenarios.Add(new Scenario()
            {
                ScenarioNumber = items.Count + 1,
                SelectionType = SelectionType.NONE,
                SalaryAmount = Session[KEY_EMPLOYEE_PAY_RATE] as Double?,
                Approved = false
            });
            
            rptScenarios.DataSource = scenarios;
            rptScenarios.DataBind();
        }

        protected void btnSubmitSalaryReviewAnalysis_Click(object sender, EventArgs e)
        {
            // TODO: Add logic to save the updated SalaryReviewAnalysis and Scenarios.
        }

        protected void btnCancelSalaryReviewAnalysis_Click(object sender, EventArgs e)
        {
            // TODO: Add logic to clear out any modified variables.
        }

        protected void cbxApproved_CheckChanged(object sender, EventArgs e)
        {
            CheckBox cb = (CheckBox)sender;
            RepeaterItem item = cb.Parent as RepeaterItem;
            object parent = item.NamingContainer;
            Repeater rpt = parent as Repeater;
            RepeaterItemCollection items = rpt.Items;
            /*
           HiddenField idField = item.FindControl("scenarioId") as HiddenField;
           if (idField == null)
           {
               idField = item.FindControl("scenarioIdAlt") as HiddenField;
           }
           String id = idField.Value;
           */
            foreach (RepeaterItem rptItem in items)
            {
                CheckBox ckBox = rptItem.FindControl("cbxApproved") as CheckBox;
                if (ckBox == null)
                {
                    ckBox = rptItem.FindControl("cbxApprovedAlt") as CheckBox;
                }
                ckBox.Checked = false;
            }
            cb.Checked = true;
        }

        protected Scenario UpdateScenarioValues(RepeaterItem item)
        {
            NumberStyles styles = NumberStyles.Number | NumberStyles.AllowCurrencySymbol | NumberStyles.AllowTrailingSign | NumberStyles.AllowLeadingSign | NumberStyles.AllowTrailingWhite | NumberStyles.AllowDecimalPoint;
            NumberFormatInfo numberFormatInfo = CultureInfo.CurrentCulture.NumberFormat;
            Scenario scenario = null;

            HiddenField idField = item.FindControl("scenarioId") as HiddenField;
            if (idField == null)
            {
                idField = item.FindControl("scenarioIdAlt") as HiddenField;
            }
            String id = idField.Value;
            // Logic to force a restore of a non-saved scenario:
            if (String.IsNullOrEmpty(id) || id.Equals("0"))
            {
                scenario =  new Scenario();
            }
            else
            {
                scenario = ScenarioBLL.GetByID(Convert.ToInt32(id));  
            }
            
            // Update scenario values with any changes from UI:
            scenario.ScenarioNumber = item.ItemIndex + 1;

            CheckBox ckBox = item.FindControl("cbxApproved") as CheckBox;
            if (ckBox == null)
            {
                ckBox = item.FindControl("cbxApprovedAlt") as CheckBox;
            }
            scenario.Approved = Convert.ToBoolean(ckBox.Checked);

            DropDownList ddlCriteria = item.FindControl("ddlCriteria") as DropDownList;
            if (ddlCriteria == null)
            {
                ddlCriteria = item.FindControl("ddlCriteriaAlt") as DropDownList;
            }
            ListItem selectedItem = ddlCriteria.Items[ddlCriteria.SelectedIndex];
            
            scenario.SelectionType = selectedItem.Text;

            TextBox tbPercentIncrease = item.FindControl("tbPercentIncrease") as TextBox;
            if (tbPercentIncrease == null)
            {
                tbPercentIncrease = item.FindControl("tbPercentIncreaseAlt") as TextBox;
            }
            // For some reason the space percent sign is not converting properly.
            tbPercentIncrease.Text = tbPercentIncrease.Text.Replace("%", "");
            double percentIncrease = 0;
            double.TryParse(tbPercentIncrease.Text, styles, numberFormatInfo, out percentIncrease);
            scenario.PercentIncrease = percentIncrease / 100;

            TextBox tbSalaryAmount = item.FindControl("tbSalaryAmount") as TextBox;
            if (tbSalaryAmount == null)
            {
                tbSalaryAmount = item.FindControl("tbSalaryAmountAlt") as TextBox;
            }
            double newSalary = 0;
            double.TryParse(tbSalaryAmount.Text, styles, numberFormatInfo, out newSalary);
            scenario.SalaryAmount = newSalary;

            return scenario;
        }
    }
}

