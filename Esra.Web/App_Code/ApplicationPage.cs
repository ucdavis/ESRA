using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
// added
using System.Security.Principal;
using System.Data.SqlClient;
using System.Collections;
using System.Threading;
using System.Web.SessionState;
using System.Web.Caching;
using CAESDO.Esra.Data;
using CAESDO.Esra.Core.DataInterfaces;
using System.Reflection;
using CAESOps;
using CAESDO.Esra.Core.Domain;
using System.Web.Configuration;


namespace CAESDO.Esra.Web
{
    /// <summary>
    /// All pages in the application except Login.aspx will derive from ApplicationPage.
    /// </summary>
    public class ApplicationPage : System.Web.UI.Page
    {
        public static string CHILD_RECORDS_EXIST = "Unable to delete record: Child records exist.";
        protected static readonly string MESSAGE_CHILD_RECORDS_EXIST = "Unable to delete record: Child records exist.";
        protected static readonly string MESSAGE_RECORD_EXISTS = "Unable to create new record: Duplcate record exists!.";
        protected static readonly string MESSAGE_RECORD_SAVED_SUCCESS = "Success: New Record Successfully Saved.";
        protected static readonly string MESSAGE_RECORD_DELETED_SUCCESS = "Success: Record Successfully Deleted";
        protected static readonly string MESSAGE_RECORD_UPDATED_SUCCESS = "Success: Record Successfully Updated";
        protected static readonly string MASTER_PAGE_MESSAGE_LABEL_NAME = "lbl_Message";
        protected static readonly string ROLE_ADMIN = "Admin";
        protected static readonly string ROLE_REVIEWER = "Reviewer";
        protected static readonly string ROLE_USER = "User";
        protected static readonly string ROLE_DOUser = "DOUser";
        protected static readonly string KEY_CURRENT_USER_ID = "UserID";
        protected static readonly string KEY_CURRENT_USER_ROLE = "UserRole";
        protected static readonly string KEY_IS_DEPARTMENT_USER = "IsDepartmentUser";
        protected static readonly string KEY_CURRENT_USER = "User";
        protected static readonly string KEY_APPLIED_FILTERS = "AppliedFilters";
        protected static readonly string KEY_SORT_PROPERTY_NAME = "SortPropertyName"; 
        protected static readonly string KEY_ASCENDING = "Ascending";
        protected static readonly string KEY_EMPLOYEE_ID = "EmployeeID";

        public ApplicationPage()
        {
        }

        public IDaoFactory daoFactory
        {
            get { return new NHibernateDaoFactory(); }
        }

        protected override void OnError(EventArgs e)
        {

            //Might want to rollback the transaction whenever an error gets this far up the stack
            NHibernateSessionManager.Instance.RollbackTransaction();

            //Grab the page context
            HttpContext ctx = HttpContext.Current;

            //Grab the exception that raised this error
            System.Exception ex = ctx.Server.GetLastError();

            //Handle Error

            base.OnError(e); //won't get called

            string errorMessage = null;

            // Added logic to bypass adding inner exception if null.  2008-04-29 by kjt.
            if (ex.InnerException != null)
            {
                errorMessage += " " + ex.InnerException.Message.Replace("\r\n", "<br />");
            }
            else
            {
                errorMessage = ex.Message.Replace("\r\n", "<br />");
            }

            // Pass entire exception to Error Reporting for delivery via email:
            ErrorReporting er = new ErrorReporting();
            er.ReportError(ex, "OnError");

            // Redirect to error page with customized error message:
            HttpContext.Current.ClearError();//Clear the error for redirect
            string redirectURL = "ErrorPage.aspx?reason=" + Server.HtmlEncode(errorMessage);
            Response.Redirect(redirectURL);
        }

        protected void gridView_OnRowDataBound(object sender, GridViewRowEventArgs e, string controlID)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState & DataControlRowState.Edit) != 0)
            {
                Control c = e.Row.Cells[3].FindControl(controlID);
                this.SetFocus(c);
            }
        }

        protected void gridView_Sorting(GridView gridView, GridViewSortEventArgs e, ObjectDataSource objectDataSource, string pageName)
        {
            /* If the currentPropertyName is the same as the e.SortExpression and
            * UsePurchasePageSortOrder = false: toggle the field's sort order
            * Else sort ascending
            * 
            * */
            string propertyName = e.SortExpression;
            string defaultPropertyName = String.Empty;
            if (objectDataSource.SelectParameters["propertyName"] != null)
            {
                defaultPropertyName = objectDataSource.SelectParameters["propertyName"].DefaultValue;
                objectDataSource.SelectParameters["propertyName"].DefaultValue = e.SortExpression;
            }
            else
            {
                Parameter propertyNameParam = new Parameter("propertyName", TypeCode.String, e.SortExpression);
                Parameter sortDirectionParam = new Parameter("ascending", TypeCode.Boolean, "true");
                objectDataSource.SelectParameters.Add(propertyNameParam);
                objectDataSource.SelectParameters.Add(sortDirectionParam);
            }


            if (Session["Use" + pageName + "SortOrder"] != null && (bool)Session["Use" + pageName + "SortOrder"])
            {
                if (propertyName.Equals(defaultPropertyName) == false)
                {
                    // sort by order provided:
                    objectDataSource.SelectParameters["ascending"].DefaultValue = (e.SortDirection == SortDirection.Ascending ? "true" : "false");
                }
                // else keep the same order.
            }
            else
            {
                // Toggle the sort order from its previous order, except if first time, then sort ascending:
                if (propertyName.Equals(defaultPropertyName))
                {
                    // toggle sort order
                    if (objectDataSource.SelectParameters["ascending"].DefaultValue.Equals("true"))
                    {
                        objectDataSource.SelectParameters["ascending"].DefaultValue = "false";
                    }
                    else
                    {
                        objectDataSource.SelectParameters["ascending"].DefaultValue = "true";
                    }
                }
                else
                {
                    // sort ascending:
                    objectDataSource.SelectParameters["ascending"].DefaultValue = "true";
                }
            }

            // New stuff for use with Excel output:
            Session.Add(KEY_ASCENDING, objectDataSource.SelectParameters["ascending"].DefaultValue);
            Session.Add(KEY_SORT_PROPERTY_NAME, propertyName);

            //gridView.DataBind();

            e.Cancel = true;
        }

        protected void checkRecordBeforeDeleting(GridViewDeleteEventArgs e, object recordToBeDeleted, Type bllType, string deleteRecordCheckMethodName, Label lblMessage, string message)
        {
            Object[] parameters = new Object[1];
            Type[] paramTypes = new Type[1];
            paramTypes[0] = recordToBeDeleted.GetType();

            MethodInfo bllInfo = bllType.GetMethod(deleteRecordCheckMethodName, paramTypes);
            parameters[0] = recordToBeDeleted;

            if (((bool)bllInfo.Invoke(bllType, parameters)) == false)
            {
                e.Cancel = true;
                lblMessage.Text = message;
                lblMessage.Visible = true;

                Control c = lblMessage;
                this.SetFocus(c);
            }
        }

        protected void ResetMasterPageLabel(string labelName)
        {
            Label lbl = (Label)Page.Master.FindControl(labelName);
            lbl.Visible = false;
            lbl.Text = "";
        }

        protected void SetMasterPageLabel(string labelName, string message)
        {
            SetMasterPageLabel(labelName, message, true);
        }

        protected void SetMasterPageLabel(string labelName, string message, bool visible)
        {
            Label lbl = (Label)Page.Master.FindControl(labelName);
            lbl.Visible = visible;
            lbl.Text = message;
        }

        protected bool IsDemoMode()
        {
            bool retval = false;
            string applicationMode = WebConfigurationManager.AppSettings["ApplicationMode"];
            if (String.IsNullOrEmpty(applicationMode) == false && applicationMode.Equals("demo", System.StringComparison.OrdinalIgnoreCase))
                retval = true;
            return retval;
        }

        private const string STR_CurrentUserType = "currentUserType";
        //private const string STR_CreateUserURL = "~/Login/CreateUser.aspx";

        #region UserProperties

        private User _p;

        public User p
        {
            get
            {
                if (_p == null && HttpContext.Current.User.Identity.IsAuthenticated)
                    _p = daoFactory.GetUserDao().GetUserByLogin(HttpContext.Current.User.Identity.Name);

                return _p;
            }
            set { _p = value; }
        }

        //private IDaoFactory daoFactory
        //{
        //    get { return new NHibernateDaoFactory(); }
        //}

        public string LoggedInUserName
        {
            get
            {
                string userName = string.Empty;

                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    if (p == null)
                    {
                        userName = HttpContext.Current.User.Identity.Name;
                    }
                    else
                    {
                        userName = p.FirstName + " " + p.LastName;
                    }
                }

                return userName;
            }
        }
        #endregion

        #region SalaryScaleMethods

        protected bool HasSalarySteps(object sender)
        {
            bool retval = false;
             
            IDataItemContainer item = sender as IDataItemContainer;
            SalaryScale ss = (SalaryScale)item.DataItem;
            
            if (ss.SalarySteps != null && ss.SalarySteps.Count > 0)
            {
                retval = true;
            }

            return retval;
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
            if (midStepNumbString.Equals(step.StepNumber))
            {
                retval = true;
            }

            return retval;
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

        #endregion
    }

}