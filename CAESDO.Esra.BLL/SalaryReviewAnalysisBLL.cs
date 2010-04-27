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
        public static IList<SalaryReviewAnalysis> GetAll(string employeeID, string reviewerLogin, string creationDate, string propertyName, bool ascending)
        {
            IList<SalaryReviewAnalysis> retval = null;

            if (String.IsNullOrEmpty(employeeID)
                && String.IsNullOrEmpty(reviewerLogin)
                && (String.IsNullOrEmpty(creationDate)
                    || creationDate.Equals(String.Format("{0:MM/dd/yyyy}", DateTime.Today))))
            {
                retval = daoFactory.GetSalaryReviewAnalysisDao().GetAllSalaryReviewAnalysis(propertyName, ascending);
            }
            else
            {
                retval = daoFactory.GetSalaryReviewAnalysisDao().GetAll(employeeID, reviewerLogin, creationDate, propertyName, ascending);
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
                ts.CommittTransaction();
            }

            // TODO: Add logic for figuring out originating department.
            // Is this the user's home department if it's the same as their
            // work department; otherwise their work department or what?
            // or perhaps we just leave this blank?
        }
    }
}
