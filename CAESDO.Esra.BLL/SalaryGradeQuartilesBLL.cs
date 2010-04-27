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
    }
}
