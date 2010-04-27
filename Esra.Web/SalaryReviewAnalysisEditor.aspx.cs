using System;
using System.Web.UI.WebControls;
using CAESDO.Esra.Core.Domain;
using CAESDO.Esra.BLL;
using System.Collections.Generic;
using CAESDO.Core.Domain;
using System.Globalization;
using System.Web.UI;


namespace CAESDO.Esra.Web
{
    public partial class SalaryReviewAnalysisEditor : ApplicationPage
    {
        protected static readonly string KEY_REFERENCE_NUM = "ReferenceNumber";
        //protected static readonly string KEY_TITLE_CODE = "TitleCode";
        protected static readonly string KEY_EMPLOYEE_PAY_RATE = "Employee.PayRate";
        protected static readonly string KEY_DEANS_OFFICE_COMMENTS = "DeansOfficeComments";
        protected static readonly string KEY_DEPARTMENT_COMMENTS = "DepartmentComments";
        protected static readonly string KEY_TITLES = "Titles";
        protected static readonly string KEY_EMPLOYEES = "Employees";
        protected static readonly string KEY_CRITERIA = "Criteria";
        
        protected string EmployeeID
        {
            get
            {
                string retval = Request.QueryString[KEY_EMPLOYEE_ID];
                if (String.IsNullOrEmpty(retval))
                {
                    retval = Session[KEY_EMPLOYEE_ID] as string;
                }

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
                if (String.IsNullOrEmpty(retval))
                {
                    retval = Session[KEY_REFERENCE_NUM] as string;
                }

                long temp = 0;
                // ###20081001 min length = 11
                if (String.IsNullOrEmpty(retval) || retval.Length < 11 || long.TryParse(retval, out temp) == false)
                {
                    retval = null;
                }
                return retval;
            }
        }

        protected List<Title> Titles
        {
            get { return ViewState[KEY_TITLES] as List<Title>; }
            set { ViewState[KEY_TITLES] = value; }
        }

        protected List<SRAEmployee> Employees
        {
            get { return ViewState[KEY_EMPLOYEES] as List<SRAEmployee>; }
            set { ViewState[KEY_EMPLOYEES] = value; }
        }

        protected Dictionary<string, decimal?> Criteria
        {
            get { return ViewState[KEY_CRITERIA] as Dictionary<string, decimal?>; }
            set { ViewState[KEY_CRITERIA] = value; }
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

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            //MultiView1.SetActiveView(vEmployees);
            if (!IsPostBack)
            {
                List<SRAEmployee> empList = new List<SRAEmployee>();
                List<Title> titleList = new List<Title>();
                SalaryReviewAnalysis sra = null;
                SRAEmployee emp = null;
                IList<Scenario> scenarios = null;
                pnlProposedTitle.Visible = false;
                UCDEmployee user = EmployeeBLL.GetByProperty("EmployeeID", Session[KEY_CURRENT_USER_ID] as string);
                
                if (String.IsNullOrEmpty(ReferenceNum) == false)
                {
                    // Set the session reference number so that it can be
                    // used by the datasource select method.
                    Session[KEY_REFERENCE_NUM] = ReferenceNum;

                    sra = SalaryReviewAnalysisBLL.GetByProperty(KEY_REFERENCE_NUM, ReferenceNum);
                    if (sra != null)
                    {
                        if (!IsDepartmentUser() || (IsDepartmentUser() && SRAEmployeeBLL.IsDepartmentEmployee(user, sra.Employee)))
                        {
                            emp = sra.Employee;
                            scenarios = sra.Scenarios;
                            ViewState.Add(KEY_DEANS_OFFICE_COMMENTS, sra.DeansOfficeComments);
                            ViewState.Add(KEY_DEPARTMENT_COMMENTS, sra.DepartmentComments);

                            // Code for setting the correct criteria list items:
                            Criteria = SalaryScaleBLL.GetCriteriaListItems(sra.SalaryScale.TitleCode, sra.SalaryScale.EffectiveDate);

                            rptScenarios_Init(scenarios);

                            //lblTblSRAMain_CurrentTitleCode.Text = TitleBLL.GetByTitleCode(sra.CurrentTitleCode).TitleCode_Name;

                            lblTblSRAMain_TitleCode.Text = sra.Title.TitleCode_Name;
                            if (sra.IsReclass)
                            {
                                pnlProposedTitle.Visible = true;
                            }

                            empList.Add(emp);
                            Employees = empList; // Save the employees list to the ViewState recall later.

                            // if existing analysis, use sra's title:
                            titleList.Add(sra.Title);

                            Titles = titleList;// Save the Titles list to the ViewState for recall later.
                            Session.Add(KEY_EMPLOYEE_PAY_RATE, emp.PayRate);
                            Session.Add(KEY_TITLE_CODE, sra.Title.TitleCode);

                            MultiView1.SetActiveView(vSalaryReviewAnalysis);
                        }
                        else
                        {
                            MultiView1.SetActiveView(vNotAuthorized);
                        }
                    }
                }
                else if (String.IsNullOrEmpty(EmployeeID) == false )
                {
                    emp = new SRAEmployee(EmployeeBLL.GetByID(EmployeeID));

                    if (emp != null)
                    {
                        if (!IsDepartmentUser() || (IsDepartmentUser() && SRAEmployeeBLL.IsDepartmentEmployee(user, emp)))
                        {
                            empList.Add(emp);
                            Employees = empList; // Save the employees list to the ViewState recall later.

                            // if new sra, use employee's title initially:
                            titleList.Add(emp.Title);

                            Titles = titleList;// Save the Titles list to the ViewState for recall later.

                            Session.Add(KEY_EMPLOYEE_PAY_RATE, emp.PayRate);
                            Session.Add(KEY_TITLE_CODE, emp.Title.TitleCode);

                            if (emp.Title.SalaryScales == null ||
                                emp.Title.SalaryScales.Count == 0)
                            {
                                MultiView1.SetActiveView(vNoSalaryDataAvailable);
                            }
                            else
                            {
                                lblCurrentTitleCode.Text = emp.Title.TitleCode_Name;
                                ddlProposedTitleCode.SelectedValue = emp.TitleCode;
                                lblOriginalTitleCode.Text = emp.Title.TitleCode_Name;

                                MultiView1.SetActiveView(vSelectSalaryReviewType);
                            }
                        }
                        else
                        {
                            MultiView1.SetActiveView(vNotAuthorized);
                        }
                    }
                }

                /*
                 * 20081202 by kjt: Commented out this logic and moved to the appropriate 
                 * section above in order to deal with proposed title codes and reclasses.
                 * 
                if (emp != null)
                {
                    empList.Add(emp);
                    Employees = empList; // Save the employees list to the ViewState recall later.
                   
                    titleList.Add(emp.Title);
                    
                    Titles = titleList;// Save the Titles list to the ViewState for recall later.
                    Session.Add(KEY_EMPLOYEE_PAY_RATE, emp.PayRate);
                    Session.Add(KEY_TITLE_CODE, emp.Title.TitleCode);
                }
                 * */

                //gvEmployees.DataSource = empList; // Changed this to use ViewState collection.
                gvEmployees.DataBind();
                //gvTitle.DataSource = titleList;  // Changed this to use ViewState collection.
                gvTitle.DataBind();
                //gvEmployeeTitle.DataSource = empList; // Changed this to use ViewState collection.
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
                scenarios.Add(new Scenario()
                {
                    ScenarioNumber = 1,
                    SelectionType = SelectionTypeBLL.GetByType(SelectionType.NONE).Type,
                    SalaryAmount = (double)Session["Employee.PayRate"],
                    Approved = false
                });
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
            else if (args.CommandName.Equals("remove"))
            {
                // The goal is to remove the particular item from the scenarios list and 
                // renumber the ScenarioNumber appropriately.
                Repeater rpt = sender as Repeater;
                RepeaterItemCollection items = rpt.Items;

                List<Scenario> scenarios = new List<Scenario>();
                int i = 0;
                foreach (RepeaterItem item in items)
                {
                    // For some odd reason, the item.ItemIndex always
                    // had a value of zero, so I needed to use an external index.
                    if (Convert.ToInt32(args.CommandArgument) != i)
                    {
                        // Add all but the item they desire deleted back to the
                        // scenarios list.
                        scenarios.Add(UpdateScenarioValues(item));
                    }
                    i++;
                }

                rptScenarios.DataSource = scenarios;
                rptScenarios.DataBind();
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
            string percentIncreaseString = tb.Text.Replace("%", "");
            double percentIncrease = 0;
            double.TryParse(percentIncreaseString, styles, numberFormatInfo, out percentIncrease);
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
                    //retval = SalaryScaleBLL.GetCriteriaListItems(Session[KEY_TITLE_CODE] as String)[scenario.SelectionType];
                    retval = Criteria[scenario.SelectionType];
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
            string message = MESSAGE_RECORD_SAVED_SUCCESS;

            List<Scenario> scenarios = new List<Scenario>();
            foreach (RepeaterItem item in rptScenarios.Items)
            {
                scenarios.Add(UpdateScenarioValues(item));
            }

            string dateApproved = null;
            if (gvSalaryReviewAnaysis.Rows.Count ==1)
            {
                // Get date approved:
                TextBox tbDateApproved = gvSalaryReviewAnaysis.Rows[0].FindControl("tbDateApproved") as TextBox;
                if (tbDateApproved != null)
                {
                    dateApproved = tbDateApproved.Text;
                }
            }

            SalaryReviewAnalysis sra = null;
            if (String.IsNullOrEmpty(ReferenceNum) == false)
            {
                // Then this is an existing analysis:

                sra = SalaryReviewAnalysisBLL.GetByReferenceNumber(ReferenceNum);
                if (sra == null)
                {
                    User user = UserBLL.GetCurrent();
                    SRAEmployee emp = sra.Employee;
                    string titleCode = Titles[0].TitleCode;
                    bool isReclass = false;
                    if (titleCode.Equals(emp.TitleCode) == false)
                    {
                        isReclass = true;
                    }
                    sra = new SalaryReviewAnalysis()
                    {
                        ReferenceNumber = ReferenceNum,
                        DateInitiated = DateTime.Today,
                        InitiatedByReviewerName = user.FullName,
                        OriginatingDepartment = DepartmentBLL.GetOriginatingDepartmentForUser(user.EmployeeID),
                        Title = TitleBLL.GetByTitleCode(titleCode),
                        Employee = emp,
                        SalaryScale = SalaryScaleBLL.GetEffectiveSalaryScale(titleCode, DateTime.Today),
                        CurrentTitleCode = emp.TitleCode,
                        IsReclass = isReclass
                    };
                }
                else
                {
                    // Record exists --> Update
                    message = MESSAGE_RECORD_UPDATED_SUCCESS;
                }
            }
            else
            {
                // Else this is a new analysis:

                User user = UserBLL.GetCurrent();
                SRAEmployee emp = new SRAEmployee(EmployeeBLL.GetByID(EmployeeID));
                string titleCode = Titles[0].TitleCode;
                bool isReclass = false;
                if (titleCode.Equals(emp.TitleCode) == false)
                {
                    isReclass = true;
                }
                sra = new SalaryReviewAnalysis()
                {
                    DateInitiated = DateTime.Today,
                    InitiatedByReviewerName = user.FullName,
                    OriginatingDepartment = DepartmentBLL.GetOriginatingDepartmentForUser(user.EmployeeID),
                    Title = TitleBLL.GetByTitleCode(titleCode),
                    Employee = emp,
                    SalaryScale = SalaryScaleBLL.GetEffectiveSalaryScale(titleCode, DateTime.Today),
                    CurrentTitleCode = emp.TitleCode,
                    IsReclass = isReclass
                };
            }

            if (String.IsNullOrEmpty(dateApproved) == false)
                sra.DateApproved = Convert.ToDateTime(dateApproved);
            else
                sra.DateApproved = null;

            sra.DeansOfficeComments = ViewState[KEY_DEANS_OFFICE_COMMENTS] as string;
            sra.DepartmentComments = ViewState[KEY_DEPARTMENT_COMMENTS] as string;

            sra.Scenarios = scenarios;

            SalaryReviewAnalysisBLL.UpdateRecord(sra);
            // At this point we need to set the reference number if a newly created analysis!
            Session[KEY_REFERENCE_NUM] = sra.ReferenceNumber;

            // This data binding is needed here because we're using a DataSource vs a DataSourceID,
            // and the DataBinding is not automatic.
            gvEmployees.DataBind();
            gvTitle.DataBind();
            gvEmployeeTitle.DataBind();

            Session["Message"] = message;

            string redirectURL = "~/SalaryReviewAnalysisPage.aspx?" + KEY_REFERENCE_NUM + "=" + ReferenceNum;
            Response.Redirect(redirectURL);
        }

        protected void tbSalaryReviewAnalysisDeansOfficeCommentsFooter_TextChanged(object sender, EventArgs e)
        {
            // Allows us to be able to save the updated dean's office comments.
            ViewState.Add(KEY_DEANS_OFFICE_COMMENTS, ((TextBox)sender).Text);
        }

        protected void tbSalaryReviewAnalysisDepartmentCommentsFooter_TextChanged(object sender, EventArgs e)
        {
            // Allows us to be able to save the updated dean's office comments.
            ViewState.Add(KEY_DEPARTMENT_COMMENTS, ((TextBox)sender).Text);
        }

        protected void gvSalaryReviewAnaysis_OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            e.Cancel = true;
        }

        protected void btnCancelSalaryReviewAnalysis_Click(object sender, EventArgs e)
        {
            string redirectURL = "~/SalaryReviewAnalysisPage.aspx";
            
            if(String.IsNullOrEmpty(ReferenceNum) == false)
            {
                redirectURL += "?" + KEY_REFERENCE_NUM + "=" + ReferenceNum;
            }
            Response.Redirect(redirectURL);
        }

        /// <summary>
        /// This method is supposed to check if a check box
        /// has been changed to "checked" and uncheck all other
        /// check boxes.
        /// It should also handle the situation of a person "unchecking" a
        /// check box and not re-check it, but leave it unchecked, as-is.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cbxApproved_CheckChanged(object sender, EventArgs e)
        {
            GridViewRow gvr = gvSalaryReviewAnaysis.Rows[0];  // There's always only one row.
            CheckBox cb = (CheckBox)sender;
            
            // if cb has just been unchecked, then just exit the method.
            if (cb.Checked)
            {
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

                TextBox tb = gvr.FindControl("tbDateApproved") as TextBox;
                if (tb != null)
                {
                    if (String.IsNullOrEmpty(tb.Text))
                    {
                    // if blank, then set date approved with today's date:
                        tb.Text = String.Format("{0:MM/dd/yyyy}", DateTime.Today);
                        ((UpdatePanel)gvr.FindControl("upDateApproved")).Update();
                    }
                    // else keep the date already entered by doing nothing.
                }
            }
            else
            {
            // All "Approved" scenarios have been cleared, so clear 
            // DateApproved as well, providing it's been previously set.
                TextBox tb = gvr.FindControl("tbDateApproved") as TextBox;
                if (tb != null && String.IsNullOrEmpty(tb.Text) == false)
                {
                    // Clear the date approved field?
                    tb.Text = null;
                    ((UpdatePanel)gvr.FindControl("upDateApproved")).Update();
                }
            }
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
            string percentIncreaseString = tbPercentIncrease.Text.Replace("%", "");
            double percentIncrease = 0;
            double.TryParse(percentIncreaseString, styles, numberFormatInfo, out percentIncrease);
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

        protected void ddlProposedTitleCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = sender as DropDownList;
            string titleCodeString = ddl.SelectedValue;
            SalaryScale ss = SalaryScaleBLL.GetEffectiveSalaryScale(titleCodeString, DateTime.Today);
            Title proposedTitle = ss.Title;

            Titles.Clear();
            Titles.Add(proposedTitle);
            
            Criteria = SalaryScaleBLL.GetCriteriaListItems(proposedTitle.TitleCode);
            rptScenarios_Init(null);

            //lblTblSRAMain_CurrentTitleCode.Text = Employees[0].Title.TitleCode_Name;
            lblTblSRAMain_TitleCode.Text = proposedTitle.TitleCode_Name;
            pnlProposedTitle.Visible = true;

            gvTitle.DataBind();
            gvEmployees.DataBind();
            gvEmployeeTitle.DataBind();

            MultiView1.SetActiveView(vSalaryReviewAnalysis);
        }

        protected void btnDoEquityReview_Click(object sender, EventArgs e)
        {
            Criteria = SalaryScaleBLL.GetCriteriaListItems(Employees[0].TitleCode);
            rptScenarios_Init(null);

            //lblTblSRAMain_CurrentTitleCode.Text = Employees[0].Title.TitleCode_Name;

            lblTblSRAMain_TitleCode.Text = Employees[0].Title.TitleCode_Name;
            pnlProposedTitle.Visible = false;

            gvTitle.DataBind();
            gvEmployees.DataBind();
            gvEmployeeTitle.DataBind();

            MultiView1.SetActiveView(vSalaryReviewAnalysis);
        }
    }
}

