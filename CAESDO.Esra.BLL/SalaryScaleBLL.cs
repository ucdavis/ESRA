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
                if (HasSalaryReviewAnalysis(record))
                    retval = false;
                else
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
                        SalaryGradeQuartiles sgq = record.SalaryGradeQuartiles;

                        if (sgq != null && SalaryGradeQuartilesBLL.Exists(sgq))
                        {
                            record.SalaryGradeQuartiles = null;

                            if (sgq.SalaryGrade.Equals(record.TitleCode) ||
                                (sgq.SalaryScales.Count == 1))
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

        public static Dictionary<string, decimal?> GetCriteriaListItems(string titleCode, DateTime effectiveDate)
        {
            Dictionary<string, decimal?> cl = new Dictionary<string, decimal?>();
            int titleCodeInt = 0;
            if (String.IsNullOrEmpty(titleCode) == false && titleCode.Length == 4 && Int32.TryParse(titleCode, out titleCodeInt))
            {
                Title title = TitleBLL.GetByID(titleCode);
                SalaryScale ss = GetEffectiveSalaryScale(titleCode, effectiveDate);


                List<SelectionType> selectionTypes = SelectionTypeBLL.GetAll("SortOrder", true);
                cl.Add(selectionTypes[(int)SelectionType.Types.NONE].ShortType, null); // "None"
                if (ss.SalarySteps == null || ss.SalarySteps.Count == 0)
                {
                    cl.Add(selectionTypes[(int)SelectionType.Types.MIN].ShortType, ss.SalaryGradeQuartiles.MinAnnual); // "Min"
                    cl.Add(selectionTypes[(int)SelectionType.Types.FIRST].ShortType, ss.SalaryGradeQuartiles.FirstQrtleAnnual); // "1st"
                    cl.Add(selectionTypes[(int)SelectionType.Types.MID].ShortType, ss.SalaryGradeQuartiles.MidAnnual); // "Mid"
                    cl.Add(selectionTypes[(int)SelectionType.Types.THIRD].ShortType, ss.SalaryGradeQuartiles.ThirdQrtleAnnual); // "3rd"
                    cl.Add(selectionTypes[(int)SelectionType.Types.MAX].ShortType, ss.SalaryGradeQuartiles.MaxAnnual); // "Max"
                }
                cl.Add(selectionTypes[(int)SelectionType.Types.LM_WAS].ShortType, Convert.ToDecimal(ss.LaborMarketWAS)); // "Labor Mkt WAS"
                cl.Add(selectionTypes[(int)SelectionType.Types.LM_MID].ShortType, Convert.ToDecimal(ss.LaborMarketMidAnnual)); // "Labor Mkt Mid"
                cl.Add(selectionTypes[(int)SelectionType.Types.COLLEGE_AVG].ShortType, Convert.ToDecimal(ss.CollegeAverageAnnual)); // "College AVG"
                cl.Add(selectionTypes[(int)SelectionType.Types.CAMPUS_AVG].ShortType, Convert.ToDecimal(ss.CampusAverageAnnual)); // "Campus AVG"

                foreach (SalaryStep step in ss.SalarySteps)
                {
                    cl.Add(selectionTypes[(int)SelectionType.Types.STEP].ShortType + " " + step.StepNumber, Convert.ToDecimal(step.Annual)); // "Step"
                }
            }
            return cl;
        }

        public static Dictionary<string, decimal?> GetCriteriaListItems(string titleCode)
        {
            return GetCriteriaListItems(titleCode, DateTime.Today);
        }

        /// <summary>
        /// Given a title code, return a list of SalaryScales, sorted by the propertyName in the 
        /// order provided.  If the title code is null or "0", all SalaryScales are returned.
        /// </summary>
        /// <param name="titleCode">TitleCode of the SalaryScales desired.</param>
        /// <param name="propertyName">"Sort by" property name.</param>
        /// <param name="ascending">"Sort order", either true for ascending or false for descending.</param>
        /// <returns>IList of SalaryScales with matching TitleCodes.</returns>
        public static IList<SalaryScale> GetSalaryScales(string titleCode, string propertyName, bool ascending)
        {
            IList<SalaryScale> retval = null;
            if (String.IsNullOrEmpty(titleCode) || titleCode.Equals("0"))
            {
                retval = GetAllSalaryScale(propertyName, ascending);
            }
            else
            {
                SalaryScale example = new SalaryScale()
                {
                    TitleCode = titleCode
                };
                retval = GetByInclusionExample(example, propertyName, ascending, "TitleCode");
                example = null;
            }
            return retval;
        }

        // Given a date, return the salary scale with the appropriate effective date if 
        // multiple salary scales are present; otherwise, return the only record present:
        public static SalaryScale GetEffectiveSalaryScale(string titleCode, DateTime effectiveDate)
        {
            return daoFactory.GetSalaryScaleDao().GetEffectiveSalaryScale(titleCode, effectiveDate);
        }

        public static SalaryScale GetSalaryScale(string titleCode, string effectiveDateStr)
        {
            if (String.IsNullOrEmpty(titleCode) || String.IsNullOrEmpty(effectiveDateStr))
                return null;
            else
                return GetSalaryScale(titleCode, Convert.ToDateTime(effectiveDateStr));
        }

        public static SalaryScale GetSalaryScale(string titleCode, DateTime effectiveDate)
        {
            SalaryScale retval = null;

            SalaryScale example = new SalaryScale()
                {
                    TitleCode = titleCode,
                    EffectiveDate = effectiveDate
                };

            IList<SalaryScale> scales = GetByInclusionExample(example, "TitleCode", "EffectiveDate");
            example = null;

            if (scales.Count == 1)
            {
                retval = scales[0];
            }
            
            return retval;
        }

        public static IList<SalaryScale> GetAllSalaryScale(string propertyName, bool ascending)
        {
            return daoFactory.GetSalaryScaleDao().GetAllSalaryScale(propertyName, ascending);
        }

        public static IList<SalaryScale> GetAllSalaryScaleWithSalarySteps(string propertyName, bool ascending)
        {
            return daoFactory.GetSalaryScaleDao().GetAllSalaryScalesWithSalarySteps(propertyName, ascending);
        }

        public static IList<SalaryScale> GetAllSalaryScalesWithSalarySteps(string titleCode, string propertyName, bool ascending)
        {
            return daoFactory.GetSalaryScaleDao().GetAllSalaryScalesWithSalarySteps(titleCode, propertyName, ascending);
        }

        public static void UpdateRecord(SalaryScale record)
        {
            SalaryScale _record = new SalaryScale() { EffectiveDate = record.EffectiveDate, TitleCode = record.TitleCode };
            _record = GetByInclusionExample(_record, "EffectiveDate", "TitleCode")[0];
            if ((record.LaborMarketWAS == 0 && _record.LaborMarketWAS > 0) || (record.LaborMarketWAS > 0)) { _record.LaborMarketWAS = Convert.ToDouble(record.LaborMarketWAS); }
            if ((record.LaborMarketMidAnnual == 0 && _record.LaborMarketMidAnnual > 0) || (record.LaborMarketMidAnnual > 0)) { _record.LaborMarketMidAnnual = Convert.ToDouble(record.LaborMarketMidAnnual); }
            if ((record.CampusAverageAnnual == 0 && _record.CampusAverageAnnual > 0) || (record.CampusAverageAnnual > 0)) { _record.CampusAverageAnnual = Convert.ToDouble(record.CampusAverageAnnual); }
            
            // New logic added 2009-01-07 by KJT: Also update the SalaryGrade and BargainingCode (if changed):
            if ((String.IsNullOrEmpty(record.SalaryGrade) == false) && (record.SalaryGrade.Equals(_record.SalaryGrade) == false))
            {
                _record.SalaryGrade = record.SalaryGrade;
            }
            if ((String.IsNullOrEmpty(record.BargainingCode) == false) && (record.BargainingCode.Equals(_record.BargainingCode) == false))
            {
                _record.BargainingCode = record.BargainingCode;
            }
            // end new logic.

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

                // Logic to update the SalaryGradeQuartiles (if present):
                /*
                SalaryGradeQuartiles sgq = record.SalaryGradeQuartiles as SalaryGradeQuartiles;
                if (sgq != null)
                {
                    SalaryGradeQuartilesBLL.EnsurePersistent(ref sgq);
                }
                 * */
                //-------------------------------------------------------

                ts.CommittTransaction();
            }
        }

        public static bool Exists(SalaryScale record) { return daoFactory.GetSalaryScaleDao().Exists(record);  }
        public static bool HasSalaryGradeQuartiles(SalaryScale record) { return daoFactory.GetSalaryScaleDao().HasSalaryGradeQuartiles(record); }
        public static SalaryGradeQuartiles GetSalaryGradeQuartiles(SalaryScale record) { return daoFactory.GetSalaryScaleDao().GetSalaryGradeQuartiles(record); }
        public static bool HasSalarySteps(SalaryScale record) { return daoFactory.GetSalaryScaleDao().HasSalarySteps(record); }
        public static IList<SalaryStep> GetSalarySteps(SalaryScale record) { return daoFactory.GetSalaryScaleDao().GetSalarySteps(record); }
        public static bool HasSalaryReviewAnalysis(SalaryScale record) { return daoFactory.GetSalaryScaleDao().HasSalaryReviewAnalysis(record); }
    }
}
