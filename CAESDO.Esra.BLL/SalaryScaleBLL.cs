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
        public static bool CanBeDeleted(SalaryScale record)
        {
            bool retval = false;
            if (record != null)
            {
                //TODO: business rules for deleting a SalaryScale go here:
                // Perhaps check if any salary review analysis is using this salary scale?
                retval = true;
            }
            return retval;
        }

        public static bool DeleteRecord(SalaryScale record, bool forceDelete)
        {
            bool retval = false;
            if (record != null)
            {
                if (forceDelete || CanBeDeleted(record))
                {
                    // delete record from database:
                    using (var ts = new TransactionScope())
                    {
                        SalaryGradeQuartiles sgq = GetSalaryGradeQuartiles(record);

                        if (sgq != null)
                        {
                            if (sgq.SalaryGrade.Equals(record.TitleCode))
                            {
                                // This is a special SalaryGradeQuartiles, whose SalaryGrade
                                // equals the SalaryScale.TitleCode, that we need to delete.
                                SalaryGradeQuartilesBLL.Remove(sgq);
                            }
                            else
                            {
                                // This Quartile is shared across SalaryScales and 
                                // we just need to remove the relationship.
                                sgq.SalaryScales.Remove(record);
                                SalaryGradeQuartilesBLL.EnsurePersistent(ref sgq);
                            }
                        }

                        Remove(record);
                        ts.CommittTransaction();
                        retval = true;
                    }
                }
            }

            return retval;
        }

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

        public static void InsertRecord(SalaryScale record)
        {
            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref record);
                ts.CommittTransaction();
            }
        }

        public static bool Exists(SalaryScale record) { return daoFactory.GetSalaryScaleDao().Exists(record);  }
        public static bool HasSalaryGradeQuartiles(SalaryScale record) { return daoFactory.GetSalaryScaleDao().HasSalaryGradeQuartiles(record); }
        public static SalaryGradeQuartiles GetSalaryGradeQuartiles(SalaryScale record) { return daoFactory.GetSalaryScaleDao().GetSalaryGradeQuartiles(record); }
    }
}
