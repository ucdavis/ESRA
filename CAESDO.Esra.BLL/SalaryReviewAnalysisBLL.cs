using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using CAESDO.Esra.Core.DataInterfaces;
using CAESDO.Esra.Core.Domain;
using CAESDO.Esra.Data;

namespace CAESDO.Esra.BLL
{
    public class SalaryReviewAnalysisBLL : GenericBLL<SalaryReviewAnalysis, int>
    {
        public static void DeleteRecord(int id)
        {
            using (var ts = new TransactionScope())
            {  
                Remove(GetByID(id));
                
                ts.CommittTransaction();
            }
        }

        public static void DeleteRecord(string referenceNumber)
        {
            using (var ts = new TransactionScope())
            {
                Remove(GetByProperty("ReferenceNumber", referenceNumber));

                ts.CommittTransaction();
            }
        }

        /// <summary>
        /// This is the new method, which returns a list of analyses,
        /// according to the user's department and role.
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="isDepartmentUser"></param>
        /// <param name="employeeID"></param>
        /// <param name="reviewerLogin"></param>
        /// <param name="creationDate"></param>
        /// <param name="propertyName"></param>
        /// <param name="ascending"></param>
        /// <returns>List of filtered analyses, according to user's department and role.</returns>
        public static IList<SalaryReviewAnalysis> GetAll(string userId,
            bool isDepartmentUser,
            string employeeID,
            string reviewerLogin,
            string creationDate,
            string propertyName,
            bool ascending)
        {
            IList<SalaryReviewAnalysis> retval = null;

            if (String.IsNullOrEmpty(employeeID)
                && String.IsNullOrEmpty(reviewerLogin)
                && (String.IsNullOrEmpty(creationDate)
                    || creationDate.Equals(String.Format("{0:MM/dd/yyyy}", DateTime.Today))))
            {
                // The underlying method takes care of the user/department filtering.
                retval = GetAllSalaryReviewAnalysis(userId, isDepartmentUser, propertyName, ascending);
            }
            else
            {
                string reviewerFullName = reviewerLogin;
                if (String.IsNullOrEmpty(reviewerLogin) == false)
                {
                    User user = UserBLL.GetByLogin(reviewerLogin);
                    reviewerFullName = user.FullName;
                }
                retval = GetListFilteredByUser(userId, isDepartmentUser,
                    daoFactory.GetSalaryReviewAnalysisDao().GetAll(employeeID, reviewerFullName, creationDate, propertyName, ascending));
            }

            return retval;
        }

        /*
        public static IList<SalaryReviewAnalysis> GetAll(string employeeID, string reviewerLogin, string creationDate, string propertyName, bool ascending)
        {
            IList<SalaryReviewAnalysis> retval = null;

            if (String.IsNullOrEmpty(employeeID)
                && String.IsNullOrEmpty(reviewerLogin)
                && (String.IsNullOrEmpty(creationDate)
                    || creationDate.Equals(String.Format("{0:MM/dd/yyyy}", DateTime.Today))))
            {
                retval = GetAllSalaryReviewAnalysis(propertyName, ascending);
            }
            else
            {
                string reviewerFullName = reviewerLogin;
                if (String.IsNullOrEmpty(reviewerLogin) == false)
                {
                    User user = UserBLL.GetByLogin(reviewerLogin);
                    reviewerFullName = user.FullName;
                }

                retval = daoFactory.GetSalaryReviewAnalysisDao().GetAll(employeeID, reviewerFullName, creationDate, propertyName, ascending);
            }
            return retval;
        }
         * */

        /// <summary>
        /// Given a List of SalaryReviewAnalysis,
        /// filter the list according to the user's department and role.
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="isDepartmentUser"></param>
        /// <returns>List of SalaryReviewAnalysis filtered according to the user's department and role.</returns>
        private static IList<SalaryReviewAnalysis> GetListFilteredByUser(string userId, bool isDepartmentUser, IList<SalaryReviewAnalysis> analyses)
        {
            IList<SalaryReviewAnalysis> retval = analyses;
            if (isDepartmentUser)
            {
                if (analyses != null && analyses.Count > 0)
                {
                    UCDEmployee user = EmployeeBLL.GetByProperty("EmployeeID", userId);
           
                    IList<SalaryReviewAnalysis> tempList = new List<SalaryReviewAnalysis>();
                    foreach (SalaryReviewAnalysis sra in analyses)
                    {
                        if (EmployeeBLL.IsDepartmentEmployee(user, sra.Employee))
                        {
                            tempList.Add(sra);
                        }
                    }
                    retval = tempList;
                }
            }
            return retval;
        }

        /// <summary>
        /// The purpose for this method is to filter the results based on the user and the analysis' employee.
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="isDepartmentUser"></param>
        /// <param name="propertyName"></param>
        /// <param name="ascending"></param>
        /// <returns>List of employees filtered by user</returns>
        public static IList<SalaryReviewAnalysis> GetAllSalaryReviewAnalysis(string userId, bool isDepartmentUser, string propertyName, bool ascending)
        {
            IList<SalaryReviewAnalysis> retval = GetAllSalaryReviewAnalysis(propertyName, ascending);

            if (isDepartmentUser)
            {
                // Only return the analyses to which the user has permission to see.
                // The current business rules are users with a matching home and work department.
                if (retval.Count > 0)
                {
                    retval = GetListFilteredByUser(userId, isDepartmentUser, retval);
                }
            }

            return retval;
        }

        public static SalaryReviewAnalysis GetByReferenceNumber(string referenceNumber)
        {
            return GetByProperty("ReferenceNumber", referenceNumber);
        }

        public static IList<SalaryReviewAnalysis> GetAllSalaryReviewAnalysis(string propertyName, bool ascending)
        {
            return daoFactory.GetSalaryReviewAnalysisDao().GetAllSalaryReviewAnalysis(propertyName, ascending);
        }

        public static void UpdateRecord(SalaryReviewAnalysis record)
        {
            Scenario approvedScenario = null;

            // Logic for adding any new scenarios, updating existing scenarios
            // and deleting unwanted scenarios:

            /* Delete any scenario in the old, but not in the new.
             * Update any scenario that exists in both the old and new.
             * Add any scenario not in the old, but in the new.
             */

            foreach (Scenario scenario in record.Scenarios)
            {
                if (scenario.SalaryReviewAnalysis == null)
                {
                    scenario.SalaryReviewAnalysis = record;
                }

                // Logic for setting the approved scenario.
                if (scenario.Approved != null && (bool)scenario.Approved)
                {
                    approvedScenario = scenario;
                }
            }

            record.ApprovedScenario = approvedScenario;

            // TODO: Add logic for figuring out originating department.
            // Is this the user's home department if it's the same as their
            // work department; otherwise their work department or what?
            // or perhaps we just leave this blank?

            using (var ts = new TransactionScope())
            {
                IList<Scenario> oldScenarios = ScenarioBLL.GetBySalaryReviewAnalysisID(record.ID);
                foreach (Scenario oldScenario in oldScenarios)
                {
                    bool found = false;
                    foreach (Scenario scenario in record.Scenarios)
                    {
                        if (oldScenario.ID == scenario.ID)
                        {
                            // keep.
                            found = true;
                            continue;
                        }
                    }
                    if (!found)
                    {
                        // delete.
                        ScenarioBLL.Remove(oldScenario);
                    }
                }
                
                EnsurePersistent(ref record);

                if (String.IsNullOrEmpty(record.ReferenceNumber))
                {
                    record.ReferenceNumber = String.Format("{0:yyyyMMdd}", DateTime.Today) + record.ID;
                }

                ts.CommittTransaction();
            }
        }
    }
}
