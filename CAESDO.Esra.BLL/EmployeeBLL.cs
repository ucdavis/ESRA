using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using CAESDO.Esra.Core.DataInterfaces;
using CAESDO.Esra.Core.Domain;
using CAESDO.Esra.Data;

namespace CAESDO.Esra.BLL
{
    public class EmployeeBLL : GenericBLL<Employee, string>
    {
        public static IList<Employee> GetByTitleCode(string titleCode, string propertyName, bool ascending)
        {
            return EmployeeBLL.daoFactory.GetEmployeeDao().GetByTitleCode(titleCode, propertyName, ascending);
        }

        public static IList<Employee> GetAllEmployeesForUser(string userID, string propertyName, bool ascending)
        {
            UCDEmployee user = GetByProperty("EmployeeID", userID);
            return GetEmployees(propertyName, ascending, null, null, new string[] { user.HomeDepartment.ID, user.WorkDepartment.ID });
        }

        public static bool IsDepartmentEmployee(UCDEmployee user, Employee employee) 
        {
            // Business rules for determining whether or not a employee is visible to a user:
            bool retval = false;

            if ((employee.HomeDepartmentID != null && employee.HomeDepartmentID.Equals(user.HomeDepartmentID)) ||
                (employee.WorkDepartmentID != null && employee.WorkDepartmentID.Equals(user.HomeDepartmentID)))
            {
                retval = true;
            }

            return retval;
        }

        public static IList<Employee> GetAllEmployeesForUser(string userID, bool isDepartmentUser, string propertyName, bool ascending, string[] titleCodes, string pkEmployee, string[] departmentIDs)
        {
            if (isDepartmentUser && String.IsNullOrEmpty(propertyName) == false && propertyName.Equals("FullName"))
            {
                propertyName = "FullName";  // Default sort by FullName
            }
            if (String.IsNullOrEmpty(propertyName))
                propertyName = "FullName";

            IList<Employee> employees = GetEmployees(propertyName, ascending, titleCodes, pkEmployee, departmentIDs);
            List<Employee> retval = null;
            if (isDepartmentUser)
            {
                // Then blank out the Name, department and comments from non-departmental employees:
                List<Employee> nullList = new List<Employee>();
                retval = new List<Employee>();
                UCDEmployee user = GetByProperty("EmployeeID", userID);

                foreach (Employee employee in employees)
                {
                    try
                    {
                        if (!IsDepartmentEmployee(user, employee))
                        {
                            // blank out the username, department and comments:
                            //employee.HomeDepartment = null;
                            //employee.FullName = null;
                            //employee.DeansOfficeComments = null;
                            //employee.DepartmentComments = null;
                            if (propertyName.Equals("FullName") || propertyName.Equals("HomeDepartment") || propertyName.Equals("Title"))
                            {
                                // if sorted by FullName, add these employees to their own array.
                                nullList.Add(employee);
                            }
                            else
                            {
                                // otherwise just add them to the return array.
                                retval.Add(employee);
                            }
                        }
                        else
                        {
                            // add them as-is to the return array.
                            retval.Add(employee);
                        }
                    }
                    catch (System.Exception ex)
                    {
                        System.Console.Out.WriteLine(ex.InnerException);
                    }
                }

                if (propertyName.Equals("FullName"))
                {
                    // sort by FullName
                    retval.Sort();
                    if (!ascending)
                    {
                      retval.Reverse();
                    }
                    retval.AddRange(nullList);
                }
                else if (propertyName.Equals("HomeDepartment"))
                {
                    // Sort by Departments, then by FullNames within individual departments:
                    if (ascending)
                    {
                        retval.Sort(Employee.sortHomeDepartmentAscending());
                    }
                    else
                    {
                        retval.Sort(Employee.sortHomeDepartmentDescending());
                    }
                    retval.AddRange(nullList);
                }
                else if (propertyName.Equals("Title"))
                {
                    if (ascending)
                    {
                        retval.Sort(Employee.sortTitleAscending());
                    }
                    else
                    {
                        retval.Sort(Employee.sortTitleDescending());
                    }
                    retval.AddRange(nullList);
                }
                else
                {
                    retval.AddRange(nullList);
                }
            }
            else
            {
                // Return all employees as-is.
                retval = employees as List<Employee>;
            }
            return retval;
        }

        /*
         * If sort by department, first we need the list of employees.
         * Once we have the list of employees, we need to sort them by department name.
         * 
         * */

        public static IList<Employee> GetByDepartmentID(string departmentID, string propertyName, bool ascending)
        {
            IList<Employee> retval = null;

            if (String.IsNullOrEmpty(departmentID) == false && departmentID.Equals("0") == false)
            {
                Department department = DepartmentBLL.GetByID(departmentID);
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

        public static IList<Employee> GetEmployees(string propertyName, bool ascending, string[] titleCodes, string pkEmployee, string[] departmentIDs)
        {
            return daoFactory.GetEmployeeDao().GetEmployees(propertyName, ascending, titleCodes, pkEmployee, departmentIDs);
        }

        public static IList<Employee> GetAllEmployees(string propertyName, bool ascending)
        {
            return daoFactory.GetEmployeeDao().GetAllEmployees(propertyName, ascending);
        }

        public static void UpdateRecord(Employee record)
        {

            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref record);
                ts.CommittTransaction();
            }
        }

        public static void UpdateRecord(
            string AdjustedCareerHireDate,
            string AdjustedApptHireDate,
            string DepartmentComments,
            string DeansOfficeComments,
            string original_ID
            )
        {
            UpdateRecord(
                AdjustedCareerHireDate,
                AdjustedApptHireDate,
                null,
                DepartmentComments,
                DeansOfficeComments,
                null,
                original_ID);
        }

        public static void UpdateRecord(
            string AdjustedCareerHireDate,
            string AdjustedApptHireDate,
            string ExperienceBeginDate,
            string DepartmentComments,
            string DeansOfficeComments,
            string IsDepartmentUser,
            string original_ID
            )
        {
            
            Employee record = GetByID(original_ID);

            // Career Hire Date and Appt Hire Date logic:
            DateTime? careerHireDate = (String.IsNullOrEmpty(AdjustedCareerHireDate) ? null : (DateTime?)Convert.ToDateTime(AdjustedCareerHireDate));
            DateTime? apptHireDate = (String.IsNullOrEmpty(AdjustedApptHireDate) ? null : (DateTime?)Convert.ToDateTime(AdjustedApptHireDate));
            DateTime? experienceBeginDate = (String.IsNullOrEmpty(ExperienceBeginDate) ? null : (DateTime?)Convert.ToDateTime(ExperienceBeginDate));
            
            if (careerHireDate == null && apptHireDate == null)
                record.DatesHaveBeenAdjusted = false;
            else if (careerHireDate == record.CareerHireDate && apptHireDate == record.ApptHireDate)
                record.DatesHaveBeenAdjusted = false;
            else if ((careerHireDate == null && apptHireDate == record.ApptHireDate) ||
                (apptHireDate == null && careerHireDate == record.CareerHireDate))
                record.DatesHaveBeenAdjusted = false;
            else
                record.DatesHaveBeenAdjusted = true;

            if (record.CareerHireDate != careerHireDate)
            {
                record.CareerHireDate = careerHireDate;
                if (careerHireDate == null)
                {
                    record.YearsOfService = (DateTime.Today - record.HireDate).TotalDays / 365.25;
                }
                else
                {
                    record.YearsOfService = (DateTime.Today - (DateTime)careerHireDate).TotalDays / 365.25;
                }
            }

            if (record.ApptHireDate != apptHireDate)
            {
                record.ApptHireDate = apptHireDate;
                if (apptHireDate == null)
                {
                    record.TimeInTitle = (DateTime.Today - record.BeginDate).TotalDays / 365.25;
                }
                else
                {
                    record.TimeInTitle = (DateTime.Today - (DateTime)apptHireDate).TotalDays / 365.25;
                }
            }

            if (record.ExperienceBeginDate != experienceBeginDate)
            {
                record.ExperienceBeginDate = experienceBeginDate;
                if (experienceBeginDate == null)
                {
                    record.YearsOfExperience = (DateTime.Today - (DateTime)record.ExperienceBeginDate).TotalDays / 365.25;
                }
                else
                {
                    record.YearsOfExperience = (DateTime.Today - (DateTime)experienceBeginDate).TotalDays / 365.25;
                }
            }

            if (String.IsNullOrEmpty(IsDepartmentUser) || Convert.ToBoolean(IsDepartmentUser) == false)
            {
                record.DeansOfficeComments = (String.IsNullOrEmpty(DeansOfficeComments) ? null : DeansOfficeComments);
            }
            else
            {
                record.DepartmentComments = (String.IsNullOrEmpty(DepartmentComments) ? null : DepartmentComments);
            }

            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref record);
                ts.CommittTransaction();
            }
        }
    }
}
