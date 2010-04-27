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
            gvEmployees.DataBind();
        }

        protected void ddlEmployee_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlTitleCode.SelectedIndex = -1;
            ddlDepartment.SelectedIndex = -1;
            gvEmployees.DataBind();
        }

        protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlEmployee.SelectedIndex = -1;
            gvEmployees.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (ddlTitleCode.SelectedIndex > 0 && ddlDepartment.SelectedIndex > 0)
            {
                // Get all the employees for a given department with the matching title code.
                ddlEmployee.SelectedIndex = -1;
            }
            else if (ddlEmployee.SelectedIndex > 0)
            {
                // Get a specific employee.
                ddlTitleCode.SelectedIndex = -1;
                ddlDepartment.SelectedIndex = -1;
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
    }
}
