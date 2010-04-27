﻿using System;
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
            return GetEmployees("FullName", true, null, null, new string []{ user.HomeDepartment.ID, user.WorkDepartment.ID });
        }

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
            Employee record = GetByID(original_ID);

            // Career Hire Date and Appt Hire Date logic:
            DateTime? careerHireDate = (String.IsNullOrEmpty(AdjustedCareerHireDate) ? null : (DateTime?)Convert.ToDateTime(AdjustedCareerHireDate));
            DateTime? apptHireDate = (String.IsNullOrEmpty(AdjustedApptHireDate) ? null : (DateTime?)Convert.ToDateTime(AdjustedApptHireDate));
            
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

            record.DepartmentComments = (String.IsNullOrEmpty(DepartmentComments) ? null : DepartmentComments);
            record.DeansOfficeComments = (String.IsNullOrEmpty(DeansOfficeComments) ? null : DeansOfficeComments);

            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref record);
                ts.CommittTransaction();
            }
        }
    }
}
