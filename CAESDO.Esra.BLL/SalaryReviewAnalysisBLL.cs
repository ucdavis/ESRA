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
    }
}
