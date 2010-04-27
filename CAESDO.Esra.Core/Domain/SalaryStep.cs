using System;
using System.Collections.Generic;
using System.Text;

namespace CAESDO.Esra.Core.Domain
{
    [Serializable]
    public class SalaryStep : DomainObject<SalaryStep, int>
    {
        private SalaryScale _SalaryScale;

        public virtual SalaryScale SalaryScale
        {
            get { return _SalaryScale; }
            set { _SalaryScale = value; }
        }

        private Title _Title;

        public virtual Title Title
        {
            get { return _Title; }
            set { _Title = value; }
        }

        private int _TitleCode;

        public virtual int TitleCode
        {
            get { return _TitleCode; }
            set { _TitleCode = value; }
        }

        private string _StepNumber;

        public virtual string StepNumber
        {
            get { return _StepNumber; }
            set { _StepNumber = value; }
        }

        private double _Annual;

        public virtual double Annual
        {
            get { return _Annual; }
            set { _Annual = value; }
        }

        private double _Monthly;

        public virtual double Monthly
        {
            get { return _Monthly; }
            set { _Monthly = value; }
        }

        private double _Hourly;

        public virtual double Hourly
        {
            get { return _Hourly; }
            set { _Hourly = value; }
        }

        private DateTime _EffectiveDate;

        public virtual DateTime EffectiveDate
        {
            get { return _EffectiveDate; }
            set { _EffectiveDate = value; }
        }

        public override bool Equals(object obj)
        {
            bool retval = false;
            if ((this._EffectiveDate.ToShortDateString()).Equals(((SalaryStep)obj)._EffectiveDate.ToShortDateString()) && this._TitleCode.Equals(((SalaryStep)obj)._TitleCode) && this._StepNumber.Equals(((SalaryStep)obj)._StepNumber))
            {
                retval = true;
            }
            return retval;
        }

        public override int GetHashCode()
        {
            int retval = base.GetHashCode() / (_TitleCode + Convert.ToInt32(String.Format("{0:yyyyMMdd}", _EffectiveDate)));
            return retval;
        }

        public SalaryStep()
        {

        }
    }
}
