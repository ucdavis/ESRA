﻿using System;
using System.Web.UI.WebControls;
using CAESDO.Esra.Core.Domain;
using CAESDO.Esra.BLL;
using System.Collections.Generic;
using CAESDO.Core.Domain;
using System.Globalization;


namespace CAESDO.Esra.Web
{
    public partial class Test : ApplicationPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //MultiView1.SetActiveView(vEmployees);
            if (!IsPostBack)
            {
                long temp = 0;
                string employeeID = Request.QueryString["EmployeeID"];
                Session.Remove("TitleCode");
                Session.Remove("Employee.PayRate");
                List<Employee> empList = new List<Employee>();
                List<Title> titleList = new List<Title>();
                if (String.IsNullOrEmpty(employeeID) == false && employeeID.Length == 13 && long.TryParse(employeeID, out temp))
                {
                    Employee emp = EmployeeBLL.GetByID(employeeID);
                    if (emp != null)
                    {
                        empList.Add(emp);
                        titleList.Add(emp.Title);
                        //tblEmpDetails_Init(emp);
                        //tblTitleHeader_Init(emp);
                        Session.Add("Employee.PayRate", emp.PayRate);
                        Session.Add("TitleCode", emp.Title.TitleCode);
                        rptScenarios_Init();
                    }
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
            List<Scenario> scenarios = new List<Scenario>();
            scenarios.Add(new Scenario() { ScenarioNumber = 1, SelectionType =  SelectionTypeBLL.GetByType(SelectionType.NONE).Type});            rptScenarios.DataSource = scenarios;
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
                RadioButton rb = (RadioButton)args.Item.FindControl("rbApproved") as RadioButton;
                if (rb == null)
                {
                    rb = (RadioButton)args.Item.FindControl("rbApprovedAlt") as RadioButton;
                }
                rb.Checked = false;
            }
        }

        protected void ddlCriteria_SelectedIndexChanged(object sender, EventArgs args)
        {
            DropDownList ddl = (DropDownList)sender;
            double newSalary = 0;
            double.TryParse(ddl.SelectedValue, out newSalary);
            RepeaterItem item = (RepeaterItem)ddl.Parent;
            TextBox tbSalaryAmount = (TextBox)item.FindControl("tbSalaryAmount");
            double oldSalary = (double)Session["Employee.PayRate"];
            
            if (newSalary == 0)
            {
                newSalary = oldSalary;
            }
            tbSalaryAmount.Text = String.Format("{0:c}", newSalary);

            // calculate percent increase up or down:

            double percentIncrease = (newSalary / oldSalary - 1);
            TextBox tbPercentIncrease = (TextBox)item.FindControl("tbPercentIncrease");
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
            double oldSalary = (double)Session["Employee.PayRate"];;
  
            // calculate percent increase up or down:
            double percentIncrease = (newSalary / oldSalary - 1);
            TextBox tbPercentIncrease = (TextBox)item.FindControl("tbPercentIncrease");
            tbPercentIncrease.Text = String.Format("{0:p}", percentIncrease);
        }

        protected void tbPercentIncrease_OnTextChanged(object sender, EventArgs args)
        {
            NumberStyles styles = NumberStyles.Number | NumberStyles.AllowCurrencySymbol | NumberStyles.AllowTrailingSign | NumberStyles.AllowLeadingSign;
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
            double percentIncrease = 0;
            double.TryParse(tb.Text, styles, numberFormatInfo, out percentIncrease);
            tb.Text = String.Format("{0:p}", (percentIncrease/100));

            // get old salary amount:
            double oldSalary = (double)Session["Employee.PayRate"];

            // calculate new salary amount based on percent increase up or down:
            double newSalary = oldSalary * (1 + (percentIncrease / 100));
            TextBox tbSalaryAmount = (TextBox)item.FindControl("tbSalaryAmount");
            tbSalaryAmount.Text = String.Format("{0:c}", newSalary);
        }
    }
}

