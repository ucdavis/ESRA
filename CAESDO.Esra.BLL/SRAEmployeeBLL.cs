using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using CAESDO.Esra.Core.DataInterfaces;
using CAESDO.Esra.Core.Domain;
using CAESDO.Esra.Data;

namespace CAESDO.Esra.BLL
{
    public class SRAEmployeeBLL : GenericBLL<SRAEmployee, int>
    {
        public static void UpdateRecord(SRAEmployee record)
        {
            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref record);
                ts.CommittTransaction();
            }
        }

        public static bool IsDepartmentEmployee(UCDEmployee user, SRAEmployee employee)
        {
            // Business rules for determining whether or not a employee is visible to a user:
            bool retval = false;

            if (user != null && employee != null)
            {
                if ((employee.HomeDepartmentID != null && employee.HomeDepartmentID.Equals(user.HomeDepartmentID)) ||
                    (employee.WorkDepartmentID != null && employee.WorkDepartmentID.Equals(user.HomeDepartmentID)))
                {
                    retval = true;
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
