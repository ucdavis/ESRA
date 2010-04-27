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
                List<Employee> empList = new List<Employee>();
                List<Title> titleList = new List<Title>();
                if (String.IsNullOrEmpty(employeeID) == false && employeeID.Length == 13 && long.TryParse(employeeID, out temp))
                {
                    Employee emp = EmployeeBLL.GetByID(employeeID);
                    if (emp != null)
                    {
                        empList.Add(emp);
                        titleList.Add(emp.Title);
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
    }
}

