using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using CAESDO.Esra.Core.DataInterfaces;
using CAESDO.Esra.Core.Domain;
using CAESDO.Esra.Data;
using System.Data;

namespace CAESDO.Esra.BLL
{
    public class SalaryScaleBLL : GenericBLL<SalaryScale, int>
    {
        public static List<KeyValuePair<string, decimal>> GetCriteriaListItems(string titleCode)
        {
            List<KeyValuePair<string, decimal>> cl = new List<KeyValuePair<string, decimal>>();
            int titleCodeInt = 0;
            if (String.IsNullOrEmpty(titleCode) == false && titleCode.Length == 4 && Int32.TryParse(titleCode, out titleCodeInt))
            {
                Title title = TitleBLL.GetByID(titleCode);
                SalaryScale ss = GetEffectiveSalaryScale(titleCode, DateTime.Today);

                cl.Add(new KeyValuePair<string, decimal>("Min", ss.SalaryGradeQuartiles.MinAnnual));
                cl.Add(new KeyValuePair<string, decimal>("1st", ss.SalaryGradeQuartiles.FirstQrtleAnnual));
                cl.Add(new KeyValuePair<string, decimal>("Mid", ss.SalaryGradeQuartiles.MidAnnual));
                cl.Add(new KeyValuePair<string, decimal>("3rd", ss.SalaryGradeQuartiles.ThirdQrtleAnnual));
                cl.Add(new KeyValuePair<string, decimal>("Max", ss.SalaryGradeQuartiles.MaxAnnual));
                cl.Add(new KeyValuePair<string, decimal>("Labor Mkt WAS", Convert.ToDecimal(ss.LaborMarketWAS)));
                cl.Add(new KeyValuePair<string, decimal>("Labor Mkt Mid", Convert.ToDecimal(ss.LaborMarketMidAnnual)));
                cl.Add(new KeyValuePair<string, decimal>("College AVG", Convert.ToDecimal(ss.CollegeAverageAnnual)));
                cl.Add(new KeyValuePair<string, decimal>("Campus AVG", Convert.ToDecimal(ss.CampusAverageAnnual)));

                foreach (SalaryStep step in ss.SalarySteps)
                {
                    cl.Add(new KeyValuePair<string, decimal>(step.StepNumber, Convert.ToDecimal(step.Annual)));
                }
            }
            return cl;
        }

        // Given a date, return the salary scale with the appropriate effective date if 
        // multiple salary scales are present; otherwise, return the only record present:
        public static SalaryScale GetEffectiveSalaryScale(string titleCode, DateTime effectiveDate)
        {
            return daoFactory.GetSalaryScaleDao().GetEffectiveSalaryScale(titleCode, effectiveDate);
        }
    }
}
