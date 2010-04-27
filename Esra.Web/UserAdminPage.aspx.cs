using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using CAESDO.Esra.Core.Domain;
using Esra.Web.CatOps;

namespace CAESDO.Esra.Web
{
    public partial class UserAdminPage : ApplicationPage
    {
        protected static readonly string KEY_SELECTED_UNIT_STRINGS = "SelectedUnits";
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!IsPostBack)
            {
                if (!IsAdminUser())
                {
                    string hl = "<br /><a href='Default.aspx'>Return to Home</a>";
                    string redirectURL = "~/ErrorPage.aspx?reason=" + ERROR_MESSAGE_NOT_AUTHORIZED + hl;
                    
                    Response.Redirect(redirectURL);
                }
            }
        }

        protected void GViewUsers_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Grab the loginID for the selected user from the DataKeys
            GridView gview = (GridView)sender;

            string selectedLoginID = gview.SelectedDataKey["Login"].ToString();

            //Now get the selected user's corresponding object
            User selectedUser = daoFactory.GetUserDao().GetUserByLogin(selectedLoginID);

            //Fill in all User Info fields
            lblUserInfoName.Text = string.Format("{0} {1}", selectedUser.FirstName, selectedUser.LastName);

            lblUserInfoLoginID.Text = selectedLoginID;
            lblUserInfoEmployeeID.Text = selectedUser.EmployeeID;

            gViewUserUnits.DataSource = selectedUser.Units;
            gViewUserUnits.DataBind();

            gViewUserRoles.DataSource = CatbertManager.GetRolesByUser(selectedLoginID);
            gViewUserRoles.DataBind();

            //Update the panel with the newest information and show the modal popup
            updateUserInfo.Update();
            mpopupUserInfo.Show();
        }

        protected void gViewUserUnits_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridView gv = (GridView)sender;

            //lblUserInfoEmployeeID.Text = gv.DataKeys[e.RowIndex].Value;
            //Remove the user from the desired unit
            bool success = CatbertManager.RemoveUserFromUnit(lblUserInfoLoginID.Text, (int)gv.DataKeys[e.RowIndex].Value);

            //update the grid
            User selectedUser = daoFactory.GetUserDao().GetUserByLogin(lblUserInfoLoginID.Text);

            gViewUserUnits.DataSource = selectedUser.Units;
            gViewUserUnits.DataBind();

            GViewUsers.DataBind();
            updateUserGrid.Update();

            updateUserInfo.Update();
            mpopupUserInfo.Show();
        }

        protected void btnUserInfoAddUnit_Click(object sender, EventArgs e)
        {
            //Add the user to the desired unit
            bool success = CatbertManager.AddUserToUnit(lblUserInfoLoginID.Text, int.Parse(dlistUnits.SelectedValue));
            //update the grid
            User selectedUser = daoFactory.GetUserDao().GetUserByLogin(lblUserInfoLoginID.Text);

            gViewUserUnits.DataSource = selectedUser.Units;
            gViewUserUnits.DataBind();

            GViewUsers.DataBind();
            updateUserGrid.Update();

            updateUserInfo.Update();
            mpopupUserInfo.Show();
        }

        protected void btnAddUserSearch_Click(object sender, EventArgs e)
        {
            //Show the gridview results
            gViewAddUserSearch.Visible = true;
            mpopupAddUser.Show();
        }

        protected void gViewAddUserSearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView gview = (GridView)sender;

            //insert the new user
            string loginID = gview.SelectedDataKey["Login"] as string;

            int userID = -1;
            //Check to see if the user is already in CATBERT
            bool verifyUserStatus = CatbertManager.VerifyUser(loginID);
            if (verifyUserStatus == false)
                userID = CatbertManager.InsertNewUser(loginID);
            else
                userID = 0;

            //txtAddUserLoginID.Text = userID.ToString();
            //Add the user to the given role and unit
            DropDownList unit = gview.SelectedRow.FindControl("dlistAddUserUnits") as DropDownList;
            DropDownList role = gview.SelectedRow.FindControl("dlistAddUserRoles") as DropDownList;

            if (userID == -1 || unit == null || role == null) //make sure we found the dlists and the user was created.
            {
                lblAddUserStatus.ForeColor = System.Drawing.Color.Red;
                lblAddUserStatus.Text = "User " + loginID + " not added: Check your role and unit selection and try again";
            }
            else
            {
                //get the unit and role ID's, and add the user to those roles
                bool addRoleStatus = CatbertManager.AddUserToRole(loginID, int.Parse(role.SelectedValue));
                bool addUnitStatus = CatbertManager.AddUserToUnit(loginID, int.Parse(unit.SelectedValue));

                lblAddUserStatus.ForeColor = System.Drawing.Color.Green;
                lblAddUserStatus.Text = "User " + loginID + " successfully added";
            }

            gViewAddUserSearch.SelectedIndex = -1;
            gViewAddUserSearch.Visible = false; //hide the search grid

            GViewUsers.DataBind(); //rebind the user grid and update
            updateUserGrid.Update();

            updateAddUser.Update(); // update the add user panel

            mpopupAddUser.Show(); //keep up the popup
        }

        protected void btnUserInfoAddRole_Click(object sender, EventArgs e)
        {
            //Add the user to the desired unit
            bool success = CatbertManager.AddUserToRole(lblUserInfoLoginID.Text, int.Parse(dlistRoles.SelectedValue));

            //update the grid
            gViewUserRoles.DataSource = CatbertManager.GetRolesByUser(lblUserInfoLoginID.Text);
            gViewUserRoles.DataBind();

            GViewUsers.DataBind(); //rebind the user grid and update
            updateUserGrid.Update();

            updateUserInfo.Update();
            mpopupUserInfo.Show();
        }

        protected void gViewUserRoles_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridView gv = (GridView)sender;

            //Remove the user from the desired unit
            bool success = CatbertManager.RemoveUserFromRole((int)gv.DataKeys[e.RowIndex].Value, lblUserInfoLoginID.Text);

            //update the grid
            gViewUserRoles.DataSource = CatbertManager.GetRolesByUser(lblUserInfoLoginID.Text);
            gViewUserRoles.DataBind();

            // This fixes an issue of a user having no roles, but still showing up in the gridview.
            GViewUsers.DataBind(); //rebind the user grid and update
            //GViewUsers.SelectedIndex = -1;
            updateUserGrid.Update();

            updateUserInfo.Update();
            mpopupUserInfo.Show();
        }

        protected void btnGetUnitUsers_Click(object sender, EventArgs e)
        {
            GViewUsers.DataBind();
            updateUserGrid.Update();
        }

        protected void lbxUnits_SelectedValues(object sender, EventArgs e)
        {
            ListBox lbx = sender as ListBox;
            List<string> selected = new List<string>();
            List<Units> selectedUnits = new List<Units>();

            foreach (int i in lbx.GetSelectedIndices())
            {
                string value = lbx.Items[i].Value;
                selected.Add(value);
                /*
                if (value.Equals("0") == false)
                {
                    selectedUnits.Add(TitleBLL.GetByID(value));
                }
                else
                {
                    selectedUnits.Add(GetAllNamedTitle());
                }
                 * */
            }
            string[] retval = selected.ToArray();
            Session.Add(KEY_SELECTED_UNIT_STRINGS, retval);
            //Session.Add(KEY_SELECTED_TITLES, selectedTitles);

            /*
            if (retval.Length == 1 && retval[0].Equals("0") == false)
            {
                lbx.SelectedValue = retval[0];
            }
             * */
        }
    }
}
