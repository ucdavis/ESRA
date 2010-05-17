using System;
using System.Web;
using System.Web.UI.WebControls;
using CAESDO.Esra.Core.Domain;
using CAESDO.Esra.BLL;
using System.Web.Security;

namespace CAESDO.Esra.Web
{
    public partial class Default : ApplicationPage
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Session.Remove(KEY_CURRENT_USER_ID);
                Session.Remove(KEY_CURRENT_USER_ROLE);
                Session.Remove(KEY_IS_DEPARTMENT_USER);
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            HideNavPanel();
            //HidePanel(KEY_ADMIN_MAINTENANCE_PANEL);
            HidePanel(KEY_ADMIN_PANEL);
            HidePanel(KEY_MAINTENANCE_PANEL);

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

                CAESDO.Esra.Core.Domain.User user = UserBLL.GetCurrent();
                //Session.Add(KEY_CURRENT_USER_ID, user.EmployeeID);
                //UCDEmployee employee = EmployeeBLL.GetByProperty("EmployeeID", user.EmployeeID);
                //Session.Add(KEY_CURRENT_USER_ID, employee.EmployeeID);
            }

            if (IsDemoMode())
            {
                MultiView1.SetActiveView(vDemo);
                if (User.IsInRole(ROLE_EMULATION_USER))
                    div_emulate.Visible = true;
            }
            else
            {
                ShowNavPanel();
                if (User.IsInRole(ROLE_ADMIN))
                {
                    //ShowPanel(KEY_ADMIN_MAINTENANCE_PANEL);
                    ShowPanel(KEY_ADMIN_PANEL);
                    ShowPanel(KEY_MAINTENANCE_PANEL);
                    //Session.Add(KEY_CURRENT_USER_ROLE, ROLE_ADMIN);
                    //Session.Add(KEY_IS_DEPARTMENT_USER, false);
                    MultiView1.SetActiveView(vAdmin);
                    if (User.IsInRole(ROLE_EMULATION_USER))
                        div_emulate1.Visible = true;
                }
                else if (User.IsInRole(ROLE_DOUser))
                {
                    //ShowPanel(KEY_ADMIN_MAINTENANCE_PANEL);
                    ShowPanel(KEY_MAINTENANCE_PANEL);
                    //Session.Add(KEY_CURRENT_USER_ROLE, ROLE_DOUser);
                    //Session.Add(KEY_IS_DEPARTMENT_USER, false);
                    MultiView1.SetActiveView(vDeansOffice);
                }
                else if (User.IsInRole(ROLE_REVIEWER))
                {
                    //Session.Add(KEY_CURRENT_USER_ROLE, ROLE_REVIEWER);
                    //Session.Add(KEY_IS_DEPARTMENT_USER, false);
                    MultiView1.SetActiveView(vReviewer);
                }
                else
                {
                    //Session.Add(KEY_CURRENT_USER_ROLE, ROLE_USER);
                    //Session.Add(KEY_IS_DEPARTMENT_USER, true);
                    MultiView1.SetActiveView(vDepartments);
                }
            }
        }

        protected void rblDemoMode_SelectedIndexChanged(object sender, EventArgs e)
        {
            RadioButtonList rbl = (RadioButtonList)sender;

            //HidePanel(KEY_ADMIN_MAINTENANCE_PANEL);
            HidePanel(KEY_ADMIN_PANEL);
            HidePanel(KEY_MAINTENANCE_PANEL);
            if (rbl.SelectedValue.Equals(ROLE_ADMIN))
            {
                //ShowPanel(KEY_ADMIN_MAINTENANCE_PANEL);
                ShowPanel(KEY_ADMIN_PANEL);
                ShowPanel(KEY_MAINTENANCE_PANEL);
                Session.Add(KEY_CURRENT_USER_ROLE, ROLE_ADMIN);
                Session.Add(KEY_IS_DEPARTMENT_USER, false);
                MultiView1.SetActiveView(vAdmin);
            }
            else if (rbl.SelectedValue.Equals(ROLE_DOUser))
            {
                //ShowPanel(KEY_ADMIN_MAINTENANCE_PANEL);
                ShowPanel(KEY_MAINTENANCE_PANEL);
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

        protected void btnEmulate_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            String textBoxName = btn.CommandArgument;
            TextBox tb = btn.Parent.FindControl(textBoxName) as TextBox;

            FormsAuthentication.SignOut();

            FormsAuthentication.Initialize();

            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1,
                tb.Text,
                DateTime.Now,
                DateTime.Now.AddMinutes(15),
                false,
                String.Empty,
                FormsAuthentication.FormsCookiePath);

            string hash = FormsAuthentication.Encrypt(ticket);
            HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, hash);

            Response.Cookies.Add(cookie);

            Response.Redirect(FormsAuthentication.DefaultUrl);
        }
    }
}

                    