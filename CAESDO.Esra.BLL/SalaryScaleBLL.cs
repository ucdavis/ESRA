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
        public static List<KeyValuePair<string, decimal?>> GetCriteriaListItems(string titleCode)
        {
            List<KeyValuePair<string, decimal?>> cl = new List<KeyValuePair<string, decimal?>>();
            int titleCodeInt = 0;
            if (String.IsNullOrEmpty(titleCode) == false && titleCode.Length == 4 && Int32.TryParse(titleCode, out titleCodeInt))
            {
                Title title = TitleBLL.GetByID(titleCode);
                SalaryScale ss = GetEffectiveSalaryScale(titleCode, DateTime.Today);
                cl.Add(new KeyValuePair<string, decimal?>("None", null));
                cl.Add(new KeyValuePair<string, decimal?>("Min", ss.SalaryGradeQuartiles.MinAnnual));
                cl.Add(new KeyValuePair<string, decimal?>("1st", ss.SalaryGradeQuartiles.FirstQrtleAnnual));
                cl.Add(new KeyValuePair<string, decimal?>("Mid", ss.SalaryGradeQuartiles.MidAnnual));
                cl.Add(new KeyValuePair<string, decimal?>("3rd", ss.SalaryGradeQuartiles.ThirdQrtleAnnual));
                cl.Add(new KeyValuePair<string, decimal?>("Max", ss.SalaryGradeQuartiles.MaxAnnual));
                cl.Add(new KeyValuePair<string, decimal?>("Labor Mkt WAS", Convert.ToDecimal(ss.LaborMarketWAS)));
                cl.Add(new KeyValuePair<string, decimal?>("Labor Mkt Mid", Convert.ToDecimal(ss.LaborMarketMidAnnual)));
                cl.Add(new KeyValuePair<string, decimal?>("College AVG", Convert.ToDecimal(ss.CollegeAverageAnnual)));
                cl.Add(new KeyValuePair<string, decimal?>("Campus AVG", Convert.ToDecimal(ss.CampusAverageAnnual)));

                foreach (SalaryStep step in ss.SalarySteps)
                {
                    cl.Add(new KeyValuePair<string, decimal?>("Step " + step.StepNumber, Convert.ToDecimal(step.Annual)));
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

        public static IList<SalaryScale> GetAllSalaryScale(string propertyName, bool ascending)
        {
            return daoFactory.GetSalaryScaleDao().GetAllSalaryScale(propertyName, ascending);
        }

        public static void UpdateRecord(SalaryScale record)
        {
            SalaryScale _record = new SalaryScale() { EffectiveDate = record.EffectiveDate, TitleCode = record.TitleCode };
            _record = GetByInclusionExample(_record, "EffectiveDate", "TitleCode")[0];
            if ((record.LaborMarketWAS == 0 && _record.LaborMarketWAS > 0) || (record.LaborMarketWAS > 0)) { _record.LaborMarketWAS = Convert.ToDouble(record.LaborMarketWAS); }
            if ((record.LaborMarketMidAnnual == 0 && _record.LaborMarketMidAnnual > 0) || (record.LaborMarketMidAnnual > 0)) { _record.LaborMarketMidAnnual = Convert.ToDouble(record.LaborMarketMidAnnual); }
            if ((record.CampusAverageAnnual == 0 && _record.CampusAverageAnnual > 0) || (record.CampusAverageAnnual > 0)) { _record.CampusAverageAnnual = Convert.ToDouble(record.CampusAverageAnnual); }
                 
            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref _record);
                ts.CommittTransaction();
            }
        }
    }
}
