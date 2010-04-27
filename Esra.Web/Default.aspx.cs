using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using CAESDO.Esra.BLL;
using CAESDO.Esra.Core.Domain;
using CAESDO.Esra.Data;

namespace CAESDO.Esra.Web
{
    public partial class _Default : ApplicationPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //MultiView1.SetActiveView(vEmployees);
            if (!IsPostBack)
            {
                MultiView1.SetActiveView(vEmployees);

                
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
            ddlEmployee.SelectedIndex = -1;
            //gvEmployees.DataBind();
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
                ddlDepartment.SelectedIndex = -1;
            }
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
                    ddlDepartment.SelectedIndex = -1;
                }
            }
            else if (ddlTitleCode.SelectedIndex > 0 && ddlDepartment.SelectedIndex > 0)
            {
                // Get all the employees for a given department with the matching title code.
                ddlEmployee.SelectedIndex = -1;
            }
            
            else if (ddlDepartment.SelectedIndex > 0)
            {
                // Get all employees in the given department with any title code.
                ddlEmployee.SelectedIndex = -1;
                ddlTitleCode.SelectedIndex = -1;
            }
            else
            {
                // Get all employees regardless of their department or title code.
                ddlTitleCode.SelectedIndex = -1;
                ddlEmployee.SelectedIndex = -1;
                ddlDepartment.SelectedIndex = -1;
            }
            gvEmployees.DataBind();
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
            //gvEmployees.DataBind();

            // This is the a temporary fix to get the updated Years of service and TimeInTitle to 
            // update properly.
            //Response.Redirect(Page.Request.Url.ToString());
            
            string queryString = "TitleCode="+ddlTitleCode.SelectedValue+"&Department="+ddlDepartment.SelectedValue+"&EmployeeID="+ddlEmployee.SelectedValue;
            string pathString = Page.Request.Url.AbsolutePath;
            Response.Redirect(pathString+"?"+queryString);  
        }

        protected void gvEmployees_DataBound(object sender, EventArgs e)
        {
           // If a single row is returned, then set the ddlTitleCode's selected value to that
           // of the employee returned.
            //GridView gv = (GridView)sender;
            //if (gv.Rows.Count == 1)
            //{
            //    string id = gv.DataKeys[0].Value.ToString();
            //    Employee emp = EmployeeBLL.GetByID(id);
            //    ddlTitleCode.SelectedValue = emp.Title.ID.ToString();
            //    string queryString = "TitleCode=" + ddlTitleCode.SelectedValue + "&Department=" + ddlDepartment.SelectedValue + "&EmployeeID=" + ddlEmployee.SelectedValue;
            //    string pathString = Page.Request.Url.AbsolutePath;
            //    Response.Redirect(pathString + "?" + queryString);
            //}
        }
    }
}
