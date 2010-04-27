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
            Exception ex = ctx.Server.GetLastError();

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

    }

}