using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using CAESDO.Esra.Core.DataInterfaces;
using CAESDO.Esra.Core.Domain;
using CAESDO.Esra.Data;

namespace CAESDO.Esra.BLL
{
    public class SalaryGradeQuartilesBLL : GenericBLL<SalaryGradeQuartiles, int>
    {
        public static bool CanBeDeleted(SalaryGradeQuartiles record)
        {
            bool retval = false;
            if (record != null)
            {
                if (record.SalaryScales != null && record.SalaryScales.Count > 0)
                    retval = false;
                else
                    retval = true;
            }
            return retval;
        }

        public static bool DeleteRecord(SalaryGradeQuartiles record, bool forceDelete)
        {
            bool retval = false;
            if (record != null)
            {
                if (forceDelete || CanBeDeleted(record))
                {
                    // delete record from database:
                    using (var ts = new TransactionScope())
                    {
                        Remove(record);
                        ts.CommittTransaction();
                        retval = true;
                    }
                }
            }
            return retval;
        }

        public static void InsertRecord(SalaryGradeQuartiles record)
        {
            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref record);
                ts.CommittTransaction();
            }
        }

        public static void UpdateRecord(
            string salaryGrade,
            decimal minAnnual,
            decimal firstQrtleAnnual,
            decimal midAnnual,
            decimal thirdQrtleAnnual,
            decimal maxAnnual,
            DateTime effectiveDate)
        {
            SalaryGradeQuartiles example = new SalaryGradeQuartiles()
                {
                    EffectiveDate = effectiveDate,
                    SalaryGrade = salaryGrade
                };

            IList<SalaryGradeQuartiles> items = GetByInclusionExample(example, "SalaryGrade", "EffectiveDate");
            if (items.Count == 1)
            {
                example = items[0];
                example.MinAnnual = minAnnual;
                example.FirstQrtleAnnual = firstQrtleAnnual;
                example.MidAnnual = midAnnual;
                example.ThirdQrtleAnnual = thirdQrtleAnnual;
                example.MaxAnnual = maxAnnual;

                using (var ts = new TransactionScope())
                {
                    EnsurePersistent(ref example);
                    ts.CommittTransaction();
                }
            }
        }

        /// <summary>
        /// Get a single, specific SalaryGradeQuartiles based on the salaryGrade and effectiveDate provided.
        /// </summary>
        /// <param name="salaryGrade"></param>
        /// <param name="effectiveDate"></param>
        /// <returns>SalaryGradeQuartiles</returns>
        public static SalaryGradeQuartiles GetRecord(string salaryGrade, DateTime effectiveDate)
        {
            SalaryGradeQuartiles example = new SalaryGradeQuartiles()
            {
                EffectiveDate = effectiveDate,
                SalaryGrade = salaryGrade
            };
            return GetRecord(example);
        }

        /// <summary>
        /// Get the single SalaryGradeQuartiles, which matches the example provided.
        /// </summary>
        /// <param name="example">Example SalaryGradeQuartiles of the matching one desired.</param>
        /// <returns>SalaryGradeQuartiles</returns>
        public static SalaryGradeQuartiles GetRecord(SalaryGradeQuartiles example)
        {
            SalaryGradeQuartiles retval = null;

            if (example != null)
            {
                IList<SalaryGradeQuartiles> items = GetByInclusionExample(example, "SalaryGrade", "EffectiveDate");

                if (items.Count == 1)
                {
                    retval = items[0];
                }
            }
            return retval;
        }

        /// <summary>
        /// Gets a list of all the SalaryGradeQuartiles matching the salaryGrade provided or all if no
        /// salaryGrade was provided, sorted by, and in the order provided.
        /// </summary>
        /// <param name="salaryGrade">The SalaryGrade string for the Quartile(s) desired.</param>
        /// <param name="propertyName">The "order by" property name.</param>
        /// <param name="ascending">The "sort" order, true for ascending, false for descending.</param>
        /// <returns>IList of SalaryGradeQuartiles</returns>
        public static IList<SalaryGradeQuartiles> GetAll(string salaryGrade, string propertyName, bool ascending)
        {
            IList<SalaryGradeQuartiles> retval = null;

            if (String.IsNullOrEmpty(salaryGrade) || salaryGrade.Equals("0"))
            {
                retval = GetAll(propertyName, ascending);
            }
            else
            {
                SalaryGradeQuartiles example = new SalaryGradeQuartiles()
                {
                    SalaryGrade = salaryGrade
                };
                retval = GetByInclusionExample(example, propertyName, ascending, "SalaryGrade");
            }

            return retval;
        }

        /// <summary>
        /// This method calls the underlying DAO method, which returns a distinct list of
        /// SalaryGradeQuartiles objects, one of each with the earliest EffectiveDate. 
        /// This is because the list is built by taking the first object for each salary grade
        /// from the larger, complete list, which was sorted by EffectiveDate.
        /// </summary>
        /// <returns>A list of SalaryGradeQuartiles objects with distinct SalaryGrades, each
        /// having the earliest EffectiveDate out of all others with the same Salary Grade.</returns>
        public static IList<SalaryGradeQuartiles> GetDistinct()
        {
            return daoFactory.GetSalaryGradeQuartilesDao().GetDistinct();
        }

        /// <summary>
        /// This method calls the underlying DAO method, which returns a list of just the salary grades
        /// that can be used for populating a drop-down list with distinct salary grades.
        /// </summary>
        /// <returns>List of distinct salary grades based on the underlying 
        /// Salary Scales.</returns>
        public static IList<String> GetDistinctSalaryGrades()
        {
            return daoFactory.GetSalaryGradeQuartilesDao().GetDistinctSalaryGrades();
        }

        public static bool Exists(SalaryGradeQuartiles record)
        {
            bool retval = false;

            try
            {
                if (record != null)
                {
                    if (GetRecord(record) != null)
                        retval = true;
                }
            }
            catch (NHibernate.ObjectNotFoundException)
            {
                retval = false;
            }

            return retval;
        }
    }
}
