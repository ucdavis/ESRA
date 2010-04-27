using CAESArch.Data.NHibernate;

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

                const string titleCode = "4722";
                const string dept = "030000";
                
                var cmdInsertUCDEmployee = NHibernateSessionManager.Instance.GetSession().Connection.CreateCommand();
                cmdInsertUCDEmployee.CommandText = 
                    string.Format("INSERT INTO UCDEmployee (PkEmployee, EmployeeID, HomeDept, WorkDept, FirstName, LastName, TC, SalaryGrade, BargainingUnit, HireDate)"
                                + "VALUES ('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', '{9}')", employeeId + titleCode, employeeId, dept, dept, "First", "Last", titleCode, "1", "99", "2009-07-07");

                cmdInsertUCDEmployee.ExecuteNonQuery();

                /*
                cmdInsertUCDEmployee.CommandText =
                    "UPDATE UCDEmployee SET BeginDate = '2009-07-07' WHERE PkEmployee = '9999999914722'";

                cmdInsertUCDEmployee.ExecuteNonQuery();
                */

                var cmdInsertEmployee = NHibernateSessionManager.Instance.GetSession().Connection.CreateCommand();
                cmdInsertEmployee.CommandText = string.Format("INSERT INTO Employee (PkEmployee) VALUES ('{0}')", employeeId + titleCode);

                cmdInsertEmployee.ExecuteNonQuery();   
            }
        }

        private static string GetCurrentConnectionString()
        {
            return NHibernateSessionManager.Instance.GetSession().Connection.ConnectionString;
        }
    }
}
