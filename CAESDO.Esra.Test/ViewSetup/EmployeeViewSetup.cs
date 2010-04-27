using CAESArch.Data.NHibernate;
using System.Data.SqlClient;
using System;

namespace CAESDO.Esra.Test.ViewSetup
{
    public class EmployeeViewSetup
    {
        public static void InsertEmployees()
        {
            //Insert 20 base employees
            for (int i = 0; i < 20; i++)
            {
                string employeeId = i.ToString();
                employeeId = employeeId.PadLeft(9, '9');

                string titleCode = "4722";
                string dept = "030000";
                
                var cmdInsertUCDEmployee = NHibernateSessionManager.Instance.GetSession().Connection.CreateCommand();
                cmdInsertUCDEmployee.CommandText = 
                    string.Format("INSERT INTO UCDEmployee (PkEmployee, EmployeeID, HomeDept, WorkDept, FirstName, LastName, TC, SalaryGrade, BargainingUnit)"
                                + "VALUES ('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}')", employeeId + titleCode, employeeId, dept, dept, "First", "Last", titleCode, "1", "99");

                cmdInsertUCDEmployee.ExecuteNonQuery();

                var cmdInsertEmployee = NHibernateSessionManager.Instance.GetSession().Connection.CreateCommand();
                cmdInsertEmployee.CommandText = string.Format("INSERT INTO Employee (PkEmployee) VALUES ('{0}')", employeeId + titleCode);

                cmdInsertEmployee.ExecuteNonQuery();   
            }
        }

        public static string GetCurrentConnectionString()
        {
            return NHibernateSessionManager.Instance.GetSession().Connection.ConnectionString;
        }
    }
}
