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

            UCDEmployee user = EmployeeBLL.GetByProperty("EmployeeID", userID);
            departments.Add(user.HomeDepartment);
            if ((bool)user.Different)
            {
                departments.Add(user.WorkDepartment);
            }

            if (!ascending)
                departments.Reverse();
            else
                departments.Sort();

            return departments;
        }

    }
}
