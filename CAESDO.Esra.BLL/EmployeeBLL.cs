using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using CAESDO.Esra.Core.DataInterfaces;
using CAESDO.Esra.Core.Domain;
using CAESDO.Esra.Data;

namespace CAESDO.Esra.BLL
{
    public class EmployeeBLL : GenericBLL<Employee, int>
    {
        public static IList<Employee> GetByTitleCode(string titleCode, string propertyName, bool ascending)
        {
            return EmployeeBLL.daoFactory.GetEmployeeDao().GetByTitleCode(titleCode, propertyName, ascending);
        }

        public static IList<Employee> GetByDepartmentID(string departmentID, string propertyName, bool ascending)
        {
            IList<Employee> retval = null;

            if (String.IsNullOrEmpty(departmentID) == false && departmentID.Equals("0") == false)
            {
                Department department = DepartmentBLL.GetByID(Convert.ToInt32(departmentID));
                if (department != null)
                {
                    List<Employee> employees = department.Employees as List<Employee>;

                    if (String.IsNullOrEmpty(propertyName) == false && propertyName.Equals("FullName") && ascending == false)
                    {
                        employees.Reverse();
                    }
                    else
                    {
                        employees.Sort();
                    }
                    retval = employees;
                }
            }
            else
            {
                retval = GetAll(propertyName, ascending);
            }

            return retval;
        }

        public static IList<Employee> GetEmployees(string propertyName, bool ascending, string titleCode, string employeeID, string departmentID)
        {
            return daoFactory.GetEmployeeDao().GetEmployees(propertyName, ascending, titleCode, employeeID, departmentID);
        }
    }
}
