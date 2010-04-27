using System;
using System.Web.UI.WebControls;
using CAESDO.Esra.Core.Domain;
using CAESDO.Esra.BLL;
using System.Collections.Generic;
using CAESDO.Core.Domain;


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
                List<Employee> empList = new List<Employee>();
                List<Title> titleList = new List<Title>();
                if (String.IsNullOrEmpty(employeeID) == false && employeeID.Length == 13 && long.TryParse(employeeID, out temp))
                {
                    Employee emp = EmployeeBLL.GetByID(employeeID);
                    if (emp != null)
                    {
                        empList.Add(emp);
                        titleList.Add(emp.Title);
                        tblEmpDetails_Init(emp);
                        tblTitleHeader_Init(emp.Title);
                        rptScenarios_Init();
                        Session.Add("TitleCode", Convert.ToInt32(emp.Title.TitleCode));
                    }
                }
                gvEmployees.DataSource = empList;
                gvEmployees.DataBind();
                gvTitle.DataSource = titleList;
                gvTitle.DataBind();
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

        protected void tblTitleHeader_Init(Title title)
        {
            lblTblTitleHeaderTitleCode.Text = title.TitleCode;
            lblTblTitleHeaderPayrollTitle.Text = title.PayrollTitle;
            lblTblTitleHeaderSalaryGrade.Text = title.SalaryGrade;
            lblTblTitleHeaderBargainingUnit.Text = title.BargainingCode;
            lblTblTitleHeaderReportDate.Text = String.Format("{0:MM/dd/yyyy}", DateTime.Today);
        }

        protected void tblEmpDetails_Init(Employee emp)
        {
            lblTblEmpDetailsDeptName.Text = emp.HomeDepartment.Name;
            //lblTblEmpDetailsTitleCode.Text = emp.Title.TitleCode;
            //lblTblEmpDetailsBargainingUnit.Text = emp.Title.BargainingCode;
            lblTblEmpDetailsEmpName.Text = emp.FullName;
            lblTblEmpDetailsHireDate.Text = String.Format("{0:MM/dd/yyyy}", emp.AdjustedCareerHireDate);
            lblTblEmpDetailsYearsOfService.Text = Convert.ToString(emp.YearsOfService);
            lblTblEmpDetailsBeginDate.Text = String.Format("{0:MM/dd/yyyy}", emp.AdjustedApptHireDate);
            lblTblEmpDetailsTimeInTitle.Text = Convert.ToString(emp.TimeInTitle);
            lblTblEmpDetailsPayRate.Text = String.Format("{0:c}", emp.PayRate);
            lblTblEmpDetailsDepartmentComments.Text = emp.DepartmentComments;
            lblTblEmpDetailsDeansOfficeComments.Text = emp.DeansOfficeComments;
        }

        protected void rptScenarios_Init()
        {
            List<Scenario> scenarios = new List<Scenario>();
            scenarios.Add(new Scenario() { ScenarioNumber = 1, SelectionType =  SelectionTypeBLL.GetByType(SelectionType.NONE)});
            rptScenarios.DataSource = scenarios;
            rptScenarios.DataBind();
        }
    }
}

