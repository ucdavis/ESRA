using System;
using System.Collections.Generic;
using System.Data;
using System.Reflection;
using System.Web;
using System.Web.Services;
using System.Web.UI.WebControls;
using CAESDO.Core.Domain;
using CAESDO.Esra.BLL;
using CAESDO.Esra.Core.Domain;
using CAESOps;


namespace CAESDO.Esra.Web
{
    public partial class EmployeeSalaryComparisonPage : ApplicationPage
    {
        //protected static readonly string KEY_SELECTED_DEPARTMENT_STRINGS = "selectedDepartmentStrings";
        //protected static readonly string KEY_SELECTED_DEPARTMENTS = "selectedDepartments";
        //protected static readonly string KEY_SELECTED_TITLE_STRINGS = "selectedTitleStrings";
        //protected static readonly string KEY_SELECTED_TITLES = "selectedTitles";
        //protected static readonly string KEY_SEARCH_PARAMETERS = "searchParameters";
        public static readonly string[] TRACK_CHANGES_FIELD_NAMES = new string[] 
        {"AdjustedCareerHireDate",
         "AdjustedApptHireDate",
         "ExperienceBeginDate",
         "DepartmentComments",
         "DeansOfficeComments",
         "PPSCareerHireDateChecked",
         "PPSApptHireDateChecked"};

        protected static List<Title> SelectedTitles { get; set; }
        protected static List<Department> SelectedDepartments { get; set; }
        protected static string[] SelectedTitleStrings { get; set; }
        protected static string[] SelectedDepartmentStrings { get; set; }
        protected static ESRSearchParameters SearchParameters { get; set; }
        protected static string EmployeeID { get; set; }

        protected string CurrentEditingRecordID { get; set; }

        protected void Page_Init(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Session.Remove(KEY_SELECTED_DEPARTMENT_STRINGS);
                SelectedDepartmentStrings = null;
                //Session.Remove(KEY_SELECTED_DEPARTMENTS);
                SelectedDepartments = null;
                //Session.Remove(KEY_SELECTED_TITLES);
                SelectedTitles = null;
                //Session.Remove(KEY_SELECTED_TITLE_STRINGS);
                SelectedTitleStrings = null;
                //Session.Remove(KEY_EMPLOYEE_ID);
                EmployeeID = null;
                //Session.Remove(KEY_SEARCH_PARAMETERS);
                SearchParameters = null;

                hiddenUserID.Value = null;
                hiddenIsDepartmentUser.Value = null;
                hiddenEmployeeID.Value = null;
                hiddenSelectedDepartmentStrings.Value = null;
                hiddenSelectedTitleStrings.Value = null;
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!IsPostBack)
            {
                // Revised to use Catbert user
                User user = UserBLL.GetCurrent();
                
                //ViewState.Add(KEY_CURRENT_USER, user);
                //MultiView1.SetActiveView(vEmployees);
                MultiView1.SetActiveView(vSalaryReviewAnalysis);

                lbxDepartments_ClearSelectedValues();
                lbxTitleCodes_ClearSelectedValues();
                ddlEmployee_ClearSelectedValue();

                gvESRSearchParams_Init();

                hiddenUserID.Value = UserBLL.GetCurrent().EmployeeID;
                hiddenIsDepartmentUser.Value = IsDepartmentUser().ToString();

                lbxDepartments_Init(null,null);

                Page.Form.DefaultButton = btnSearch.UniqueID;
            }
            #region test_app_exception
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
            # endregion
        }

        #region ExcelOps
        [WebMethod]
        public static void ExportToExcel(string propertyName, string ascending, string titleCodesString, string pkEmployee, string departmentIDsString)
        {
            System.Web.SessionState.HttpSessionState Session = HttpContext.Current.Session;
                      
                //string userId = Session[KEY_CURRENT_USER_ID] as string;
            // Revised to use Catbert user.
            User user = UserBLL.GetCurrent();
            string userId = user.EmployeeID;
            //bool isDepartmentUser = (Session[KEY_IS_DEPARTMENT_USER] as bool? == null ? false : (bool)Session[KEY_IS_DEPARTMENT_USER]);
            bool isDepartmentUser = IsDepartmentUser();

           // string propertyName = Session[KEY_SORT_PROPERTY_NAME] as string;
           // bool ascending = (String.IsNullOrEmpty(Session[KEY_ASCENDING] as string) ? true : Convert.ToBoolean((string)Session[KEY_ASCENDING]));

            //string[] titleStrings = Session[KEY_SELECTED_TITLE_STRINGS] as string[];
            string[] titleStrings = titleCodesString.Split('|');
            //string pkEmployee = Session[KEY_EMPLOYEE_ID] as string;
            //string pkEmployee = EmployeeID as string;
            
            //string[] departmentStrings = Session[KEY_SELECTED_DEPARTMENT_STRINGS] as string[];
            string[] departmentStrings = departmentIDsString.Split('|');

            IList<Employee> employees = EmployeeBLL.GetAllEmployeesForUser(
                userId,
                isDepartmentUser,
                propertyName,
                Convert.ToBoolean(ascending),
                titleStrings,
                pkEmployee,
                departmentStrings);
            
            // Convert the employees list to a datatable

            CAESOps.ExcelOps eops = new CAESOps.ExcelOps();
            List<CAESOps.ExcelBorder> borders = new List<CAESOps.ExcelBorder>();

            string tempString = "";
            Type stringType = tempString.GetType();

            Decimal tempDecimal = new Decimal();
            Type decimalType = tempDecimal.GetType();

            Double tempDouble = new Double();
            Type doubleType = tempDouble.GetType();

            DataTable dt = new DataTable();
            
            // Add the data headers:
            dt.Columns.Add("Department Name", stringType);
            dt.Columns.Add("Title Code", stringType);
            dt.Columns.Add("Salary Grade", stringType);
            dt.Columns.Add("Bargaining Unit", stringType);
            dt.Columns.Add("Employee Name", stringType);
            dt.Columns.Add("Hire Date", stringType);
            dt.Columns.Add("Years Of Service", doubleType);
            dt.Columns.Add("Begin Date (In Title)", stringType);
            dt.Columns.Add("Time In Title", doubleType);
            dt.Columns.Add("Experience Begin Date", stringType);
            dt.Columns.Add("Years Of Experience", doubleType);
            dt.Columns.Add("Pay Rate", doubleType);
            dt.Columns.Add("Department Comments", stringType);
            dt.Columns.Add("Deans Office Comments", stringType);

            DataRow row;

            foreach (Employee emp in employees)
            {
                row = dt.NewRow();

                row["Department Name"] = emp.HomeDepartment.Name;
                row["Employee Name"] = emp.FullName;
                row["Department Comments"] = emp.DepartmentComments;
                row["Deans Office Comments"] = emp.DeansOfficeComments;
                row["Title Code"] = emp.TitleCode;
                row["Salary Grade"] = emp.SalaryGrade;
                row["Bargaining Unit"] = emp.BargainingUnitCode;
                row["Hire Date"] = String.Format("{0:MM/dd/yyyy}", emp.AdjustedCareerHireDate);
                row["Years Of Service"] = (emp.YearsOfService ?? 0d);
                row["Begin Date (In Title)"] = String.Format("{0:MM/dd/yyyy}", emp.AdjustedApptHireDate);
                row["Time In Title"] = (emp.TimeInTitle ?? 0d);
                row["Experience Begin Date"] = String.Format("{0:MM/dd/yyyy}", emp.ExperienceBeginDate);
                row["Years Of Experience"] = (emp.YearsOfExperience ?? 0d);
                //row["Years Of Experience"] = emp.YearsOfExperience;
                row["Pay Rate"] = emp.PayRate;

                if (isDepartmentUser)
                {
                    // Check if is department employee and blank out field if not:
                    if (!EmployeeBLL.IsDepartmentEmployee(user, emp))
                    {
                        row["Department Name"] = null;
                        row["Employee Name"] = null;
                        row["Department Comments"] = null;
                        row["Deans Office Comments"] = null;
                    }
                }

                dt.Rows.Add(row);
            }

            eops.HorizontalFreeze = 1;
            ExcelStyle numberTwoDecimalStyle = new ExcelStyle();
            numberTwoDecimalStyle.Format = PredefinedExcelStyles.NumberTwoDecimal;
            eops.AddColumnStyle("Years Of Service", numberTwoDecimalStyle);
            eops.AddColumnStyle("Time In Title", numberTwoDecimalStyle);
            eops.AddColumnStyle("Years Of Experience", numberTwoDecimalStyle);
            ExcelStyle currencyStyle = new ExcelStyle();
            currencyStyle.Format = PredefinedExcelStyles.CurrencyTwoDecimal;
            eops.AddColumnStyle("Pay Rate", currencyStyle);

            byte[] byteArray = eops.ExportToExcel(dt);

            HttpContext.Current.Session["ExportExcel"] = byteArray;
        }

        #endregion

        protected void ddlTitleCode_SelectedIndexChanged(object sender, EventArgs e)
        {
                string titleCode = ((DropDownList)sender).SelectedValue;
                ddlSearchByTitleCode.SelectedValue = titleCode;
        }

        protected void ddlSearchByTitleCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            string titleCode = ((DropDownList)sender).SelectedValue;
            ddlTitleCode.SelectedValue = titleCode;
        }

        protected void ddlEmployee_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Assume that if the employees ddl was selected, that they want a single 
            // employee and their associated title code.
            string id = ((DropDownList)sender).SelectedValue.ToString();

            if (String.IsNullOrEmpty(id) == false && id.Equals("0") == false)
            {
                Employee emp = EmployeeBLL.GetByID(id);
                hiddenEmployeeID.Value = id;

                ddlTitleCode.SelectedValue = emp.Title.ID;
                ddlSearchByTitleCode.SelectedValue = emp.Title.ID;
                lbxTitleCodes_ClearSelectedValues();
                lbxDepartments_ClearSelectedValues();
                gvESRSearchParams_Load(emp);
            }
            else
            {
                gvESRSearchParams_Load();
            }
        }

        protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlEmployee_ClearSelectedValue();
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
                    hiddenEmployeeID.Value = id;

                    ddlTitleCode.SelectedValue = emp.Title.ID;
                    ddlSearchByTitleCode.SelectedValue = emp.Title.ID;
                    lbxDepartments_ClearSelectedValues();
                }
            }
            else if ((lbxTitleCodes.SelectedIndex > 0 || lbxTitleCodeIDs.SelectedIndex > 0) &&
                (lbxDepartments.SelectedIndex > 0 || lbxDepartmentIDs.SelectedIndex > 0))
            {
                // Get all the employees for a given department with the matching title code.
                ddlEmployee_ClearSelectedValue();
            }

            else if (lbxDepartments.SelectedIndex > 0 || lbxDepartmentIDs.SelectedIndex > 0)
            {
                // Get all employees in the given departments with any title code.
                ddlEmployee_ClearSelectedValue();
                lbxTitleCodes_ClearSelectedValues();
            }
            else if (lbxTitleCodes.SelectedIndex > 0 || lbxTitleCodeIDs.SelectedIndex > 0)
            {
                // Get all employees with the given title codes in any department.
                ddlEmployee_ClearSelectedValue();
                lbxDepartments_ClearSelectedValues();
            }
            else
            {
                // Get all employees regardless of their department or title code.
                lbxTitleCodes_ClearSelectedValues();
                ddlEmployee_ClearSelectedValue();
                
                lbxDepartments_ClearSelectedValues();
            }

            MultiView1.SetActiveView(vEmployees);
            gvESRSearchParams_Load();
        }

        protected void gvEmployees_SelectedIndexChanged(object sender, EventArgs e)
        {
          // tet  
            int retval = 0;

        }

        protected void gvEmployees_Sorting(object sender, GridViewSortEventArgs e)
        {
            gridView_Sorting((GridView)sender, e, odsEmployee, "Default");
        }

        protected void gvEmployees_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Get the old employee record and compare it against the new values
            // to see if any of the tracked fields have changed, and add an
            // employee change record as appropriate.

            Employee emp = EmployeeBLL.GetNullableByID(e.Keys["ID"] as string);
            
            EmployeeChanges changeRecord = null;
            foreach (string fieldName in TRACK_CHANGES_FIELD_NAMES)
            {
                bool createChangeRecord = false;
                PropertyInfo pi = typeof (Employee).GetProperty(fieldName);
                var oldValue = pi.GetValue(emp, null);
                string newValue = (e.NewValues[fieldName] == null ? null : e.NewValues[fieldName].ToString());

                if ((oldValue == null && newValue != null) ||
                    (oldValue != null && newValue == null))
                {
                    // Create change record
                    createChangeRecord = true;
                }
                else if (oldValue != null && newValue != null)
                {
                    if (oldValue is DateTime)
                    {
                        // Compare dates and create change record if diffenent
                        if (!DateTime.Equals(oldValue, Convert.ToDateTime(newValue)))
                        {
                            createChangeRecord = true;
                        }
                    }
                    else if (oldValue is bool)
                    {
                        if (!oldValue.Equals(Convert.ToBoolean(newValue)))
                        {
                            // create change record
                            createChangeRecord = true;
                        }
                    }
                    else if (!newValue.Equals(oldValue.ToString()))
                    {
                        // create change record
                        createChangeRecord = true;
                    }
                }

                if (createChangeRecord)
                {
                    // Create a new EmployeeChanges record and add to to EmployeeChanges table:
                    var record = new EmployeeChanges()
                        {
                            ChangeType = ChangeTypeBLL.GetByProperty("Type", fieldName),
                            Comments = "Old value: [" + oldValue + "]; new value: [" + newValue + "]",
                            DateChanged = DateTime.Now,
                            Employee = emp,
                            User = UserBLL.GetCurrent(),
                            Title = emp.Title
                        };

                    using (var ts = new CAESArch.BLL.TransactionScope())
                    {
                        EmployeeChangesBLL.EnsurePersistent(record);
                        ts.CommitTransaction();
                    }
                }
            }
        }

        protected void gvEmployees_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            gvEmployees.DataBind();
        }

        protected Employee ddlEmployee_ClearSelectedValue()
        {
            ddlEmployee.SelectedIndex = -1;
            //Session.Add(KEY_EMPLOYEE_ID, "0");
            EmployeeID = "0";
            hiddenEmployeeID.Value = EmployeeID;
            return GetAllNamedEmployee();
        }

        protected void lbxDepartments_ClearSelectedValues()
        {
            //Session.Add("selectedDepartmentStrings", new string[] { "0" });
            SelectedDepartmentStrings = new string[] { "0" };
            hiddenSelectedDepartmentStrings.Value = string.Join("|", SelectedDepartmentStrings);
            
            //Session.Add("selectedDepartments", new List<Department>() { GetAllNamedDepartment() });

            SelectedDepartments =  new List<Department>() { GetAllNamedDepartment() };

            lbxDepartments.SelectedIndex = -1;
            lbxDepartmentIDs.SelectedIndex = -1;

        }

        protected void lbxDepartments_SelectedValues(object sender, EventArgs e)
        {
            ddlEmployee_ClearSelectedValue();
            List<string> selected = new List<string>();
            List<Department> selectedDepartments = new List<Department>();
            
            foreach (int i in lbxDepartments.GetSelectedIndices())
            {
                string value = lbxDepartments.Items[i].Value;
                
                if (value.Equals("0") == false)
                {
                    selectedDepartments.Add(DepartmentBLL.GetByID(value));
                    selected.Add(value);
                }
            }

            Department tempDept = null;
            foreach (int i in lbxDepartmentIDs.GetSelectedIndices())
            {
                string value = lbxDepartmentIDs.Items[i].Value;
                
                if (value.Equals("0") == false)
                {
                    tempDept = DepartmentBLL.GetByID(value);
                    if (!selectedDepartments.Contains(tempDept))
                    {
                        selectedDepartments.Add(tempDept);
                        selected.Add(value);
                    }
                }
            }
            tempDept = null;

            if (selected.Count == 0)
            {
                selected.Add("0");
                selectedDepartments.Add(GetAllNamedDepartment());
            }

            string[] retval = selected.ToArray();
            //Session.Add(KEY_SELECTED_DEPARTMENT_STRINGS, retval);
            SelectedDepartmentStrings = retval;
            hiddenSelectedDepartmentStrings.Value = string.Join("|", SelectedDepartmentStrings);
            //Session.Add(KEY_SELECTED_DEPARTMENTS, selectedDepartments);
            SelectedDepartments = selectedDepartments;
        }

        protected void lbxTitleCodes_ClearSelectedValues()
        {
            //Session.Add(KEY_SELECTED_TITLE_STRINGS, new string[] { "0" });
            SelectedTitleStrings =  new string[] { "0" };
            hiddenSelectedTitleStrings.Value = string.Join("|", SelectedTitleStrings);
            //Session.Add(KEY_SELECTED_TITLES, new List<Title>() { GetAllNamedTitle() });
            SelectedTitles = new List<Title>() { GetAllNamedTitle() };
         
            lbxTitleCodes.SelectedIndex = -1;
            lbxTitleCodeIDs.SelectedIndex = -1;
        }

        protected void lbxTitleCodes_SelectedValues(object sender, EventArgs e)
        {
            ddlEmployee_ClearSelectedValue();
            List<string> selected = new List<string>();
            List<Title> selectedTitles = new List<Title>();

            foreach (int i in lbxTitleCodes.GetSelectedIndices())
            {
                string value = lbxTitleCodes.Items[i].Value;
                //selected.Add(value);
                if (value.Equals("0") == false)
                {
                    selectedTitles.Add(TitleBLL.GetByID(value));
                    selected.Add(value);
                }
            }

            Title tempTitle = null;
            foreach (int i in lbxTitleCodeIDs.GetSelectedIndices())
            {
                string value = lbxTitleCodeIDs.Items[i].Value;
                //selected.Add(value);
                if (value.Equals("0") == false)
                {
                    tempTitle = TitleBLL.GetByID(value);
                    if (!selectedTitles.Contains(tempTitle))
                    {
                        selectedTitles.Add(tempTitle);
                        selected.Add(value);
                    }
                }
            }
            tempTitle = null;

            if (selected.Count == 0)
            {
                selected.Add("0");
                selectedTitles.Add(GetAllNamedTitle());
            }

            string[] retval = selected.ToArray();

            //Session.Add(KEY_SELECTED_TITLE_STRINGS, retval);
            SelectedTitleStrings = retval;
            hiddenSelectedTitleStrings.Value = string.Join("|", SelectedTitleStrings);
            //Session.Add(KEY_SELECTED_TITLES, selectedTitles);
            SelectedTitles = selectedTitles;

            if (retval.Length == 1 && retval[0].Equals("0") == false)
            {
                ddlTitleCode.SelectedValue = retval[0];
            }
        }

        protected void gvESRSearchParams_Init()
        {
            ESRSearchParameters sp = new ESRSearchParameters()
            {
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
                //SearchTitles = Session[KEY_SELECTED_TITLES] as List<Title>,
                SearchTitles = SelectedTitles,
                //SearchDepartments = (List<Department>)Session[KEY_SELECTED_DEPARTMENTS] as List<Department>,
                SearchDepartments = SelectedDepartments,
                SearchEmployee = GetSelectedEmployee()
            };
            List<ESRSearchParameters> esParams = new List<ESRSearchParameters>();
            esParams.Add(sp);

            gvESRSearchParams.DataSource = esParams;
            gvESRSearchParams.DataBind();

            //Session.Add(KEY_SEARCH_PARAMETERS, sp);
            SearchParameters = sp;
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

        protected static Title GetAllNamedTitle()
        {
            return new Title()
            {
                TitleCode = "Any",
                PayrollTitle = "Any",
                SalaryScales =
                    new List<SalaryScale>() { new SalaryScale() { SalaryGrade="Any" } }
            };
        }

        protected static Department GetAllNamedDepartment()
        {
            return new Department() { Name = "Any" };
        }

        protected static Employee GetAllNamedEmployee()
        {
            return new Employee() { FullName = "Any" };
        }

        protected Employee GetSelectedEmployee()
        {
            Employee searchEmployee = null;
            if (ddlEmployee.SelectedIndex > 0)
            {
                searchEmployee = EmployeeBLL.GetByID(ddlEmployee.SelectedValue);

                //Session.Add(KEY_EMPLOYEE_ID, ddlEmployee.SelectedValue);
                EmployeeID = ddlEmployee.SelectedValue;
                hiddenEmployeeID.Value = EmployeeID;
            }
            else
            {
                searchEmployee = GetAllNamedEmployee();
                //Session.Add(KEY_EMPLOYEE_ID, "0");
                EmployeeID = "0";
                hiddenEmployeeID.Value = EmployeeID;
            }
            return searchEmployee;
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
            lbxDepartmentIDs.DataSource = odsDepartmentNumbers;
            
            if (IsDepartmentUser())
            {
                lbxDepartments.DataSource = odsDepartmentUserDepartments;
                lbxDepartmentIDs.DataSource = odsDepartmentUserDepartmentNumbers;
            }
            lbxDepartments.DataBind();
            lbxDepartmentIDs.DataBind();
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

        /// <summary>
        /// This method hides certain user details of non-department employees 
        /// from department users who are not in the employee's departments.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gvEmployees_RowDataBound(object sender, EventArgs e)
        {
            GridViewRowEventArgs args = (GridViewRowEventArgs)e;
            GridViewRow gvr = args.Row;

            if (IsDepartmentUser())
            {
                if (gvr.RowType.Equals(DataControlRowType.DataRow))
                {
                    // Revised to use Catbert user.
                    //User user = ViewState[KEY_CURRENT_USER] as User;
                    User user = UserBLL.GetCurrent();
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
        }

        private void AddUserDepartmentsToSession()
        {
            // Add departments to session:
            //IList<Department> departments = DepartmentBLL.GetAllDepartmentsForUser(Session[KEY_CURRENT_USER_ID] as string, "Name", true);
            IList<Department> departments = DepartmentBLL.GetAllDepartmentsForUser(UserBLL.GetCurrent().EmployeeID as string, "Name", true);
            
            //Session.Add(KEY_SELECTED_DEPARTMENTS, departments);
            SelectedDepartments = departments as List<Department>;
            //Session.Add(KEY_SELECTED_DEPARTMENT_STRINGS, new string[] { "0" });
            SelectedDepartmentStrings = new string[] {"0"};
            hiddenSelectedDepartmentStrings.Value = string.Join("|", SelectedDepartmentStrings);

        }
    }
}
