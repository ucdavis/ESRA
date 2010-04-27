using System;
using System.Collections.Generic;
using CAESArch.Core.Domain;
using Microsoft.Practices.EnterpriseLibrary.Validation.Validators;

namespace CAESDO.Esra.Core.Domain
{
    [Serializable]
    public class SalaryGradeQuartiles : DomainObject<SalaryGradeQuartiles, int>
    {
        private string _SalaryGrade;

        [NotNullValidator]
        [StringLengthValidator(1, 4)]
        public virtual string SalaryGrade
        {
            get { return _SalaryGrade; }
            set { _SalaryGrade = value; }
        }

        private decimal _MinAnnual;
        [NotNullValidator]
        public virtual decimal MinAnnual
        {
            get { return _MinAnnual; }
            set { _MinAnnual = value; }
        }

        private decimal _FirstQrtleAnnual;
        [NotNullValidator]
        public virtual decimal FirstQrtleAnnual
        {
            get { return _FirstQrtleAnnual; }
            set { _FirstQrtleAnnual = value; }
        }

        private decimal _MidAnnual;
        [NotNullValidator]
        public virtual decimal MidAnnual
        {
            get { return _MidAnnual; }
            set { _MidAnnual = value; }
        }

        private decimal _ThirdQrtleAnnual;
        [NotNullValidator]
        public virtual decimal ThirdQrtleAnnual
        {
            get { return _ThirdQrtleAnnual; }
            set { _ThirdQrtleAnnual = value; }
        }

        private decimal _MaxAnnual;
        [NotNullValidator]
        public virtual decimal MaxAnnual
        {
            get { return _MaxAnnual; }
            set { _MaxAnnual = value; }
        }

        private decimal _MinMonthly;

        public virtual decimal MinMonthly
        {
            get { return _MinAnnual / 12; }
            set { _MinMonthly = value; }
        }

        private decimal _FirstQrtleMonthly;

        public virtual decimal FirstQrtleMonthly
        {
            get { return _FirstQrtleAnnual / 12; }
            set { _FirstQrtleMonthly = value; }
        }

        private decimal _MidMonthly;

        public virtual decimal MidMonthly
        {
            get { return _MidAnnual / 12; }
            set { _MidMonthly = value; }
        }

        private decimal _ThirdQrtleMonthly;

        public virtual decimal ThirdQrtleMonthly
        {
            get { return _ThirdQrtleAnnual / 12; }
            set { _ThirdQrtleMonthly = value; }
        }

        private decimal _MaxMonthly;

        public virtual decimal MaxMonthly
        {
            get { return _MaxAnnual / 12; }
            set { _MaxMonthly = value; }
        }

        private decimal _MinHourly;

        public virtual decimal MinHourly
        {
            get { return _MinAnnual / Convert.ToDecimal(52.2) / 40; }
            set { _MinHourly = value; }
        }

        private decimal _FirstQrtleHourly;

        public virtual decimal FirstQrtleHourly
        {
            get { return _FirstQrtleAnnual / Convert.ToDecimal(52.2) / 40; }
            set { _FirstQrtleHourly = value; }
        }

        private decimal _MidHourly;

        public virtual decimal MidHourly
        {
            get { return _MidAnnual / Convert.ToDecimal(52.2) / 40; }
            set { _MidHourly = value; }
        }

        private decimal _ThirdQrtleHourly;

        public virtual decimal ThirdQrtleHourly
        {
            get { return _ThirdQrtleAnnual / Convert.ToDecimal(52.2) / 40; }
            set { _ThirdQrtleHourly = value; }
        }

        private decimal _MaxHourly;
        public virtual decimal MaxHourly
        {
            get { return _MaxAnnual / Convert.ToDecimal(52.2) / 40; }
            set { _MaxHourly = value; }
        }

        private DateTime _EffectiveDate;

        [NotNullValidator]
        public virtual DateTime EffectiveDate
        {
            get { return _EffectiveDate; }
            set { _EffectiveDate = value; }
        }

        private IList<SalaryScale> _SalaryScales;

        public virtual IList<SalaryScale> SalaryScales
        {
            get { return _SalaryScales; }
            set { _SalaryScales = value; }
        }

        public override bool Equals(object obj)
        {
            bool retval = false;
            if ((this.EffectiveDate.ToShortDateString()).Equals(((SalaryGradeQuartiles)obj).EffectiveDate.ToShortDateString()) && this.SalaryGrade.Equals(((SalaryGradeQuartiles)obj).SalaryGrade))
            {
                retval = true;
            }
            return retval;
        }

        public override int GetHashCode()
        {
            int retval = base.GetHashCode() / (_SalaryGrade.GetHashCode() + Convert.ToInt32(String.Format("{0:yyyyMMdd}", _EffectiveDate)));
            return retval;
        }

        public SalaryGradeQuartiles()
        {
      
        }
    }
}
