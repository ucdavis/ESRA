﻿using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using CAESDO.Esra.BLL;
using CAESDO.Esra.Core.Domain;
using CAESDO.Esra.Data;
using System.Collections;
using System.Collections.Generic;
using CAESDO.Core.Domain;

namespace CAESDO.Esra.Web
{
    public partial class EmployeeSalaryComparisonPage : ApplicationPage
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Remove("selectedDepartmentStrings");
                Session.Remove("selectedDepartments");
                Session.Remove("selectedTitles");
                Session.Remove("selectedTitleStrings");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //MultiView1.SetActiveView(vEmployees);
            if (!IsPostBack)
            {
                UCDEmployee user = EmployeeBLL.GetByProperty("EmployeeID", Session[KEY_CURRENT_USER_ID] as string);
                ViewState.Add(KEY_CURRENT_USER, user);
                MultiView1.SetActiveView(vEmployees);

                /*
                string titleCode = Request.QueryString["TitleCode"];
                if (String.IsNullOrEmpty(titleCode) == false)
                {
                    ddlTitleCode.SelectedValue = titleCode;
                }

                string department = Request.QueryString["Department"];
                if (String.IsNullOrEmpty(department) == false)
                {
                    ddlDepartment.SelectedValue = department;
                }

                string employeeID = Request.QueryString["EmployeeID"];
                if (String.IsNullOrEmpty(employeeID) == false)
                {
                    ddlEmployee.SelectedValue = employeeID;
                }
                */
                //lbxDepartments_SelectedValues(null, null);
                lbxDepartments_ClearSelectedValues();
                lbxTitleCodes_ClearSelectedValues();
                ddlEmployee_ClearSelectedValue();

                gvESRSearchParams_Init();
                
            }

            /*
            AppException exception = AppExceptionBLL.GetByID(21);

            Response.Write(string.Format("{0}: {1}", exception.ID, exception.DateException.ToShortDateString()));
            */
            /*
            exception.DateException = DateTime.Now;

            using (new TransactionScope())
            {
                Response.Write(
                    AppExceptionBLL.MakePersistent(ref exception)
                    );
            }
            */

            //AppException exception = new CAESDO.NHibernatev2.Data.NHibernateDaoFactory().GetGenericDao<AppException, int>().GetById(10, false);

            //Response.Write(exception.ApplicationID + " " + exception.DateException.ToShortDateString());
            //AppException exception = GenericBLL<AppException, int>.GetByID(10);
            //exception.ApplicationID = 2;

            //Response.Write(exception == null ? "Null value" : exception.ApplicationID);

        }

        protected void ddlTitleCode_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void ddlEmployee_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Assume that if the employees ddl was selected, that they want a single 
            // employee and their associated title code.
            string id = ((DropDownList)sender).SelectedValue.ToString();

            if (String.IsNullOrEmpty(id) == false && id.Equals("0") == false)
            {
                Employee emp = EmployeeBLL.GetByID(id);
            
                ddlTitleCode.SelectedValue = emp.Title.ID;
                lbxTitleCodes_ClearSelectedValues();
                lbxDepartments_ClearSelectedValues();
                //ddlDepartment.SelectedIndex = -1;
                gvESRSearchParams_Load(emp);
            }
            else
                gvESRSearchParams_Load();
            //ddlTitleCode.SelectedIndex = -1;
           
            //gvEmployees.DataBind();
        }

        protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlEmployee.SelectedIndex = -1;
            //gvEmployees.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (ddlEmployee.SelectedIndex > 0)
            {
                string id = ddlEmployee.SelectedValue.ToString();

                // Get a specific employee.
                if (String.IsNullOrEmpty(id) == false && id.Equals("0") == false)
                {
                    Employee emp = EmployeeBLL.GetByID(id);

                    ddlTitleCode.SelectedValue = emp.Title.ID;
                    //ddlDepartment.SelectedIndex = -1;
                    lbxDepartments_ClearSelectedValues();
                }
            }
            else if (lbxTitleCodes.SelectedIndex > 0 && lbxDepartments.SelectedIndex > 0)
            {
                // Get all the employees for a given department with the matching title code.
                //ddlEmployee.SelectedIndex = -1;
                ddlEmployee_ClearSelectedValue();
            }
            
            else if (lbxDepartments.SelectedIndex > 0)
            {
                // Get all employees in the given departments with any title code.
                //ddlEmployee.SelectedIndex = -1;
                ddlEmployee_ClearSelectedValue();
                lbxTitleCodes_ClearSelectedValues();
            }
            else if (lbxTitleCodes.SelectedIndex > 0)
            {
                // Get all employees with the given title codes in any department.
                //ddlEmployee.SelectedIndex = -1;
                ddlEmployee_ClearSelectedValue();
                lbxDepartments_ClearSelectedValues();
            }
            else
            {
                // Get all employees regardless of their department or title code.
                lbxTitleCodes_ClearSelectedValues();
                ddlEmployee_ClearSelectedValue();
                //ddlEmployee.SelectedIndex = -1;

                lbxDepartments_ClearSelectedValues();
            }

            gvESRSearchParams_Load();
            //gvEmployees.DataBind();
        }

        protected void gvEmployees_SelectedIndexChanged(object sender, EventArgs e)
        {
            

        }

        protected void gvEmployees_Sorting(object sender, GridViewSortEventArgs e)
        {
            gridView_Sorting((GridView)sender, e, odsEmployee, "Default");
        }

        protected void gvEmployees_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            gvEmployees.DataBind();

            // This is the a temporary fix to get the updated Years of service and TimeInTitle to 
            // update properly.
            //Response.Redirect(Page.Request.Url.ToString());
            
            /*
            string queryString = "TitleCode="+ddlTitleCode.SelectedValue+"&Department="+ddlDepartment.SelectedValue+"&EmployeeID="+ddlEmployee.SelectedValue;
            string pathString = Page.Request.Url.AbsolutePath;
            Response.Redirect(pathString+"?"+queryString);  
             * */
        }

        protected Employee ddlEmployee_ClearSelectedValue()
        {
            ddlEmployee.SelectedIndex = -1;
            return GetAllNamedEmployee();
        }

        protected void lbxDepartments_ClearSelectedValues()
        {
            /*
            if (IsDepartmentUser())
            {
                Session.Add("selectedDepartmentStrings", new string[] { "0" });
                AddUserDepartmentsToSession();
            }
            else
            {
                Session.Add("selectedDepartmentStrings", new string[] { "0" });
                Session.Add("selectedDepartments", new List<Department>() { GetAllNamedDepartment() });
            }
            */
            Session.Add("selectedDepartmentStrings", new string[] { "0" });
            Session.Add("selectedDepartments", new List<Department>() { GetAllNamedDepartment() });

            lbxDepartments.SelectedIndex = -1;

        }

        protected void lbxDepartments_SelectedValues(object sender, EventArgs e)
        {
            ddlEmployee.SelectedIndex = -1;
            List<string> selected = new List<string>();
            List<Department> selectedDepartments = new List<Department>();
            
            foreach (int i in lbxDepartments.GetSelectedIndices())
            {
                string value = lbxDepartments.Items[i].Value;
                selected.Add(value);
                if (value.Equals("0") == false)
                {
                    selectedDepartments.Add(DepartmentBLL.GetByID(value));
                }
                else
                {
                    selectedDepartments.Add(GetAllNamedDepartment());
                }
            }
            string[] retval = selected.ToArray();
            Session.Add("selectedDepartmentStrings", retval);
            Session.Add("selectedDepartments", selectedDepartments);
        }

        protected void lbxTitleCodes_ClearSelectedValues()
        {
            Session.Add("selectedTitleStrings", new string[] { "0" });
            Session.Add("selectedTitles", new List<Title>() { GetAllNamedTitle() });
            lbxTitleCodes.SelectedIndex = -1;
        }

        protected void lbxTitleCodes_SelectedValues(object sender, EventArgs e)
        {
            ddlEmployee.SelectedIndex = -1;
            List<string> selected = new List<string>();
            List<Title> selectedTitles = new List<Title>();

            foreach (int i in lbxTitleCodes.GetSelectedIndices())
            {
                string value = lbxTitleCodes.Items[i].Value;
                selected.Add(value);
                if (value.Equals("0") == false)
                {
                    selectedTitles.Add(TitleBLL.GetByID(value));
                }
                else
                {
                    selectedTitles.Add(GetAllNamedTitle());
                }
            }
            string[] retval = selected.ToArray();
            Session.Add("selectedTitleStrings", retval);
            Session.Add("selectedTitles", selectedTitles);

            if (retval.Length == 1 && retval[0].Equals("0") == false)
            {
                ddlTitleCode.SelectedValue = retval[0];
            }
        }

        protected void gvESRSearchParams_Init()
        {
            ESRSearchParameters sp = new ESRSearchParameters()
            {
                //SearchTitles = new List<Title>() { GetAllNamedTitle() },
                //SearchDepartments = (IsDepartmentUser() ? DepartmentBLL.GetAllDepartmentsForUser(Session[KEY_CURRENT_USER_ID] as string, "Name", true) as List<Department> : new List<Department>() { GetAllNamedDepartment() }),
                //SearchEmployee = GetAllNamedEmployee()

                SearchTitles = new List<Title>() { GetAllNamedTitle() },
                SearchDepartments = new List<Department>() { GetAllNamedDepartment() },
                SearchEmployee = GetAllNamedEmployee()
            };
            List<ESRSearchParameters> esParams = new List<ESRSearchParameters>();
            esParams.Add(sp);

            gvESRSearchParams.DataSource = esParams;
            gvESRSearchParams.DataBind();
        }

        protected void gvESRSearchParams_Load()
        {
            ESRSearchParameters sp = new ESRSearchParameters()
            {
                // Get the selected titles:
                SearchTitles = Session["selectedTitles"] as List<Title>,
                SearchDepartments = (List<Department>)Session["selectedDepartments"] as List<Department>,
                SearchEmployee = GetSelectedEmployee()
            };
            List<ESRSearchParameters> esParams = new List<ESRSearchParameters>();
            esParams.Add(sp);

            gvESRSearchParams.DataSource = esParams;
            gvESRSearchParams.DataBind();
        }

        protected void gvESRSearchParams_Load(Employee emp)
        {
            ESRSearchParameters sp = new ESRSearchParameters()
            {
                // Get the selected titles:
                SearchTitles = new List<Title>() { emp.Title },
                SearchDepartments = new List<Department>() { emp.HomeDepartment },
                SearchEmployee = GetSelectedEmployee()
            };
            List<ESRSearchParameters> esParams = new List<ESRSearchParameters>();
            esParams.Add(sp);

            gvESRSearchParams.DataSource = esParams;
            gvESRSearchParams.DataBind();
        }

        protected Title GetAllNamedTitle()
        {
            return new Title()
            {
                TitleCode = "Any",
                PayrollTitle = "Any",
                BargainingCode = "Any",
                SalaryScales =
                    new List<SalaryScale>() { new SalaryScale() { SalaryGrade="Any" } }
            };
        }

        protected Department GetAllNamedDepartment()
        {
            return new Department() { Name = "Any" };
        }

        protected Employee GetAllNamedEmployee()
        {
            return new Employee() { FullName = "Any" };
        }

        protected Employee GetSelectedEmployee()
        {
            Employee searchEmployee = null;
            if (ddlEmployee.SelectedIndex > 0)
            {
                searchEmployee = EmployeeBLL.GetByID(ddlEmployee.SelectedValue);
            }
            else
            {
                searchEmployee = GetAllNamedEmployee();
            }
            return searchEmployee;
        }

        protected bool IsMiddleStep(object sender)
        {
            bool retval = false;
            RepeaterItem item = (RepeaterItem)sender;  
            SalaryStep step = (SalaryStep)item.DataItem;
            SalaryScale ss = step.SalaryScale;
            int numSteps = ss.SalarySteps.Count;
            int midStepIndex = numSteps / 2;

            // select next lower step if even number of steps.
            if (numSteps % 2 == 0)
            {
                midStepIndex--;
            }
            
            string midStepNumbString = ss.SalarySteps[midStepIndex].StepNumber;
            if(midStepNumbString.Equals(step.StepNumber))
            {
                retval = true;
            }

            return retval;
        }
        
        protected void rtpSalary_OnItemDataBound(object sender, EventArgs e)
        {
           Repeater rpt = (Repeater)sender;
           int numSteps = ((IList<SalaryStep>)rpt.DataSource as IList<SalaryStep>).Count;
           rpt.Visible = false;  // assume no salary steps present
           if (numSteps > 0)
           {
               rpt.Visible = true;
           }
        }

        protected bool IsDepartmentUser()
        {
            bool retval = false;
            bool? isDepartmentUser = Session[KEY_IS_DEPARTMENT_USER] as Boolean?;
            if (isDepartmentUser != null)
                retval = (bool)isDepartmentUser;
            //if (((string)Session[KEY_CURRENT_USER_ROLE]).Equals(ROLE_USER))
            //{
            //    retval = true;
            //}
            return retval;
        }

        protected ObjectDataSource GetDataSourceForDepartments()
        {
            ObjectDataSource retval = odsDepartments;
            if (IsDepartmentUser())
            {
                retval = odsDepartmentUserDepartments;
            }
            return retval;
        }

        protected void lbxDepartments_Init(object sender, EventArgs e)
        {
            lbxDepartments.DataSource = odsDepartments;
            
            if (IsDepartmentUser())
            {
                lbxDepartments.DataSource = odsDepartmentUserDepartments;
            }
            lbxDepartments.DataBind();
        }

        protected void ddlEmployee_Init(object sender, EventArgs e)
        {
            ddlEmployee.DataSource = odsEmployees;

            if (IsDepartmentUser())
            {
                ddlEmployee.DataSource = odsDepartmentUserEmployees;
            }
            ddlEmployee.DataBind();
        }

        protected void gvEmployees_RowDataBound(object sender, EventArgs e)
        {
            GridViewRowEventArgs args = (GridViewRowEventArgs)e;
            GridViewRow gvr = args.Row;

            if (gvr.RowType.Equals(DataControlRowType.DataRow))
            {
                UCDEmployee user = ViewState[KEY_CURRENT_USER] as UCDEmployee;
                if (user != null)
                {
                    Employee employee = gvr.DataItem as Employee;

                    if (!EmployeeBLL.IsDepartmentEmployee(user, employee))
                    {
                        ((Label)gvr.FindControl("lblDeptName")).Text = null;
                        ((Label)gvr.FindControl("lblFullName")).Text = null;
                        ((Label)gvr.FindControl("lblDepartmentComments")).Text = null;
                        ((Label)gvr.FindControl("lblDeansOfficeComments")).Text = null;
                        ((LinkButton)gvr.FindControl("lbtnEdit")).Visible = false;
                    }
                }
            }
        }

        private void AddUserDepartmentsToSession()
        {
            // Add departments to session:
            IList<Department> departments = DepartmentBLL.GetAllDepartmentsForUser(Session[KEY_CURRENT_USER_ID] as string, "Name", true);
            Session.Add("selectedDepartments", departments);
            Session.Add("selectedDepartmentStrings", new string[] { "0" });

            /*
            List<string> selectedDepartmentStrings = new List<string>();
            foreach (Department dept in departments)
            {
                selectedDepartmentStrings.Add(dept.ID);
            }
            Session.Add("selectedDepartmentStrings", selectedDepartmentStrings.ToArray());
             * */
        }

        protected bool HasSalarySteps(object sender)
        {
            bool retval = false;
            RepeaterItem item = (RepeaterItem)sender;
            SalaryScale ss = (SalaryScale)item.DataItem;

            if (ss.SalarySteps != null && ss.SalarySteps.Count > 0)
            {
                retval = true;
            }

            return retval;
        }
    }
}
