using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using CAESDO.Esra.Core.DataInterfaces;
using CAESDO.Esra.Core.Domain;
using CAESDO.Esra.Data;

namespace CAESDO.Esra.BLL
{
    public class DepartmentBLL : GenericBLL<Department, string>
    {
        public static IList<Department> GetAllDepartmentsForUser(string userID, string propertyName, bool ascending)
        {
            List<Department> departments = new List<Department>();

            //UCDEmployee user = EmployeeBLL.GetByProperty("EmployeeID", userID);
            // Revised for Catbert user.
            
            /*
            departments.Add(user.HomeDepartment);
            if ((bool)user.Different)
            {
                departments.Add(user.WorkDepartment);
            }
            */

            User user = UserBLL.GetByProperty("EmployeeID", userID);
            foreach (Unit unit in user.Units)
            {
                departments.Add(GetByID(unit.PPSCode));
            }

            departments.Sort();
            if (!ascending)
                departments.Reverse();

            return departments;
        }

        // This method contains the logic, which resolves the originating department
        // based on the user provided.  Currently it's set to the user's work department.
        public static Department GetOriginatingDepartmentForUser(string usersEmployeeID)
        {
            Department retval = null;

            if (String.IsNullOrEmpty(usersEmployeeID) == false)
            {
                UCDEmployee user = EmployeeBLL.GetByProperty("EmployeeID", usersEmployeeID);
                if (user != null)
                {
                    retval = user.WorkDepartment;
                }
            }
            return retval;
        }
    }
}
