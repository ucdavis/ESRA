using System;
using System.Collections.Generic;
using System.Text;

namespace CAESDO.Esra.Core.Domain
{
    public class SalaryScale : DomainObject<SalaryScale, int>
    {
        private Title _Title;

        public virtual Title Title
        {
            get { return _Title; }
            set { _Title = value; }
        }

        private DateTime _EffeciveDate;

        public virtual DateTime EffeciveDate
        {
            get { return _EffeciveDate; }
            set { _EffeciveDate = value; }
        }

        private string _BargainingCode;

        public virtual string BargainingCode
        {
            get { return _BargainingCode; }
            set { _BargainingCode = value; }
        }

        private SalaryGradeQuartiles _SalaryGradeQuartiles;

        public virtual SalaryGradeQuartiles SalaryGradeQuartiles
        {
            get { return _SalaryGradeQuartiles; }
            set { _SalaryGradeQuartiles = value; }
        }

        private List<SalaryStep> _SalarySteps;

        public virtual List<SalaryStep> SalarySteps
        {
            get { return _SalarySteps; }
            set { _SalarySteps = value; }
        }

        private double _LaborMarketWAS;

        public virtual double LaborMarketWAS
        {
            get { return _LaborMarketWAS; }
            set { _LaborMarketWAS = value; }
        }

        private double _LaborMarketMid;

        public virtual double LaborMarketMid
        {
            get { return _LaborMarketMid; }
            set { _LaborMarketMid = value; }
        }

        private double _CollegeAverage;

        public virtual double CollegeAverage
        {
            get { return _CollegeAverage; }
            set { _CollegeAverage = value; }
        }

        private double _CampusAverage;

        public virtual double CampusAverage
        {
            get { return _CampusAverage; }
            set { _CampusAverage = value; }
        }

        public SalaryScale()
        {

        }
    }
}
