using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Esra.Web.CatOps;
using CAESDO.Esra.Core.Domain;
using CAESDO.Esra.BLL;

namespace CAESDO.Esra.Web
{
    public partial class Default : ApplicationPage
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Remove(KEY_CURRENT_USER_ID);
                Session.Remove(KEY_CURRENT_USER_ROLE);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                /*
                if (User.IsInRole(ROLE_USER))
                {
                    MultiView1.SetActiveView(vDepartments);
                }
                else
                {
                    MultiView1.SetActiveView(vDeansOffice);
                }
                 * */

                CAESDO.Esra.Core.Domain.User user = UserBLL.GetByLogin(User.Identity.Name);
                UCDEmployee employee = EmployeeBLL.GetByProperty("EmployeeID", user.EmployeeID);
                Session.Add(KEY_CURRENT_USER_ID, employee.EmployeeID);

                if (IsDemoMode())
                {
                    MultiView1.SetActiveView(vDemo);
                }
                else
                {

                    if (User.IsInRole(ROLE_ADMIN) || User.IsInRole(ROLE_DOUser) || User.IsInRole(ROLE_REVIEWER))
                    {
                        Session.Add(KEY_CURRENT_USER_ROLE, ROLE_REVIEWER);
                        MultiView1.SetActiveView(vDeansOffice);
                    }
                    else
                    {
                        Session.Add(KEY_CURRENT_USER_ROLE, ROLE_USER);
                        MultiView1.SetActiveView(vDepartments);
                    }
                }
            }
        }

        protected void rblDemoMode_SelectedIndexChanged(object sender, EventArgs e)
        {
            RadioButtonList rbl = (RadioButtonList)sender;
            if (rbl.SelectedValue.Equals(ROLE_USER))
            {
                Session.Add(KEY_CURRENT_USER_ROLE, ROLE_USER);
                MultiView1.SetActiveView(vDepartments);
            }
            else
            {
                Session.Add(KEY_CURRENT_USER_ROLE, ROLE_REVIEWER);
                MultiView1.SetActiveView(vDeansOffice);
            }
        }
    }
}

                    