using CAESArch.BLL;
using CAESDO.Esra.Core.Domain;

namespace CAESDO.Esra.BLL
{
    public class SRAEmployeeBLL : GenericBLL<SRAEmployee, int>
    {
        public static void UpdateRecord(SRAEmployee record)
        {
            using (var ts = new TransactionScope())
            {
                EnsurePersistent(record);
                ts.CommitTransaction();
            }
        }

        public static bool IsDepartmentEmployee(User user, SRAEmployee employee)
        {
            // Business rules for determining whether or not a employee is visible to a user:
            bool retval = false;

            if (user != null && employee != null)
            {
                // Check if the employee's home or work department is in the user's list of departments:
                foreach (Unit unit in user.Units)
                {
                    if ((employee.HomeDepartmentID != null && employee.HomeDepartmentID.Equals(unit.PPSCode)) ||
                        (employee.WorkDepartmentID != null && employee.WorkDepartmentID.Equals(unit.PPSCode)))
                    {
                        retval = true;
                        break;
                    }
                }
            }
            return retval;
        }

        public static SRAEmployee GetBySalaryReviewAnalysisID(int id)
        {
            return GetByProperty("CorrespondingAnalysisID", id);
        }
    }
}
