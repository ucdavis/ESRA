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
using System.Collections.Specialized;
using System.Threading;
using System.Web.SessionState;
using System.Web.Caching;
using CAESDO.Esra.Data;
using CAESDO.Esra.Core.DataInterfaces;
using System.Reflection;


namespace CAESDO.Esra.Web
{
    /// <summary>
    /// All pages in the application except Login.aspx will derive from ApplicationPage.
    /// </summary>
    public class ApplicationPage : System.Web.UI.Page
    {
        public static string CHILD_RECORDS_EXIST = "Unable to delete record: Child records exist.";

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
            string errorMessage = ex.Message.Replace("\r\n", "<br />");

            // Added logic to bypass adding inner exception if null.  2008-04-29 by kjt.
            if (ex.InnerException != null)
            {
                errorMessage += " " + ex.InnerException.Message.Replace("\r\n", "<br />");
            }

            string redirectURL = "ErrorPage.aspx?reason=" + Server.HtmlEncode(errorMessage);

            Response.Redirect(redirectURL);
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

            gridView.DataBind();

            e.Cancel = true;
        }

    }

}