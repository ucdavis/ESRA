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

        private string _TitleCode;

        public virtual string TitleCode
        {
            get { return _TitleCode; }
            set { _TitleCode = value; }
        }

        private DateTime _EffectiveDate;

        public virtual DateTime EffectiveDate
        {
            get { return _EffectiveDate; }
            set { _EffectiveDate = value; }
        }

        public virtual string SalaryGrade { get; set; }
        
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

        private IList<SalaryStep> _SalarySteps;

        public virtual IList<SalaryStep> SalarySteps
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

        private double _LaborMarketMidAnnual;

        public virtual double LaborMarketMidAnnual
        {
            get { return _LaborMarketMidAnnual; }
            set { _LaborMarketMidAnnual = value; }
        }

        private double _CollegeAverageAnnual;

        public virtual double CollegeAverageAnnual
        {
            get { return _CollegeAverageAnnual; }
            set { _CollegeAverageAnnual = value; }
        }

        private double _CampusAverageAnnual;

        public virtual double CampusAverageAnnual
        {
            get { return _CampusAverageAnnual; }
            set { _CampusAverageAnnual = value; }
        }

        public override bool  Equals(object obj)
        {
            bool retval = false;
            if ((this.EffectiveDate.ToShortDateString()).Equals(((SalaryScale)obj).EffectiveDate.ToShortDateString()) && this.TitleCode.Equals(((SalaryScale)obj).TitleCode))
            {
                retval = true;
            }
            return retval;
        }

        public override int GetHashCode()
        {
            int retval = base.GetHashCode() / (Convert.ToInt32(_TitleCode) + Convert.ToInt32(String.Format("{0:yyyyMMdd}", _EffectiveDate)));
            return retval;
        }

        public SalaryScale()
        {

        }
    }
}
