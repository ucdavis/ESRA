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
                Session.Remove(KEY_IS_DEPARTMENT_USER);
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            HideNavPanel();
            HidePanel(KEY_ADMIN_MAINTENANCE_PANEL);

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
            }

            if (IsDemoMode())
            {
                MultiView1.SetActiveView(vDemo);
            }
            else
            {
                ShowNavPanel();
                if (User.IsInRole(ROLE_ADMIN))
                {
                    ShowPanel(KEY_ADMIN_MAINTENANCE_PANEL);
                    Session.Add(KEY_CURRENT_USER_ROLE, ROLE_ADMIN);
                    Session.Add(KEY_IS_DEPARTMENT_USER, false);
                    MultiView1.SetActiveView(vAdmin);
                }
                else if (User.IsInRole(ROLE_DOUser))
                {
                    ShowPanel(KEY_ADMIN_MAINTENANCE_PANEL);
                    Session.Add(KEY_CURRENT_USER_ROLE, ROLE_DOUser);
                    Session.Add(KEY_IS_DEPARTMENT_USER, false);
                    MultiView1.SetActiveView(vDeansOffice);
                }
                else if (User.IsInRole(ROLE_REVIEWER))
                {
                    Session.Add(KEY_CURRENT_USER_ROLE, ROLE_REVIEWER);
                    Session.Add(KEY_IS_DEPARTMENT_USER, false);
                    MultiView1.SetActiveView(vReviewer);
                }
                else
                {
                    Session.Add(KEY_CURRENT_USER_ROLE, ROLE_USER);
                    Session.Add(KEY_IS_DEPARTMENT_USER, true);
                    MultiView1.SetActiveView(vDepartments);
                }
            }
        }

        protected void rblDemoMode_SelectedIndexChanged(object sender, EventArgs e)
        {
            RadioButtonList rbl = (RadioButtonList)sender;

            HidePanel(KEY_ADMIN_MAINTENANCE_PANEL);
            if (rbl.SelectedValue.Equals(ROLE_ADMIN))
            {
                ShowPanel(KEY_ADMIN_MAINTENANCE_PANEL);
                Session.Add(KEY_CURRENT_USER_ROLE, ROLE_ADMIN);
                Session.Add(KEY_IS_DEPARTMENT_USER, false);
                MultiView1.SetActiveView(vAdmin);
            }
            else if (rbl.SelectedValue.Equals(ROLE_DOUser))
            {
                ShowPanel(KEY_ADMIN_MAINTENANCE_PANEL);
                Session.Add(KEY_CURRENT_USER_ROLE, ROLE_DOUser);
                Session.Add(KEY_IS_DEPARTMENT_USER, false);
                MultiView1.SetActiveView(vDeansOffice);
            }
            else if (rbl.SelectedValue.Equals(ROLE_REVIEWER))
            {
                Session.Add(KEY_CURRENT_USER_ROLE, ROLE_REVIEWER);
                Session.Add(KEY_IS_DEPARTMENT_USER, false);
                MultiView1.SetActiveView(vReviewer);
            }
            else 
            {
                Session.Add(KEY_CURRENT_USER_ROLE, ROLE_USER);
                Session.Add(KEY_IS_DEPARTMENT_USER, true);
                MultiView1.SetActiveView(vDepartments);
            }
            ShowNavPanel();
        }
    }
}

                    