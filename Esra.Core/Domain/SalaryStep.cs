﻿using System;
using FluentNHibernate.Mapping;
using UCDArch.Core.DomainModel;

//using CAESArch.Core.Domain;

namespace Esra.Core.Domain
{
    [Serializable]
    public class SalaryStep : DomainObject, IComparable<SalaryStep>
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

        private string _TitleCode;

        public virtual string TitleCode
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

        public virtual int CompareTo(SalaryStep item)
        {
            return this.StepNumber.CompareTo(item.StepNumber);
        }

        public override int GetHashCode()
        {
            int retval = base.GetHashCode() / (Convert.ToInt32(_TitleCode) + Convert.ToInt32(String.Format("{0:yyyyMMdd}", _EffectiveDate)));
            return retval;
        }

        public virtual SalaryStep InitializedCopy(SalaryScale salaryScale)
        {
            SalaryStep ss = new SalaryStep()
            {
                _EffectiveDate = DateTime.Today,
                _StepNumber = this._StepNumber,
                _Title = this._Title,
                _TitleCode = this.TitleCode,
                _SalaryScale = salaryScale
            };
            return ss;
        }

        public SalaryStep(SalaryScale salaryScale)
        {
            _EffectiveDate = salaryScale.EffectiveDate;
            _Title = salaryScale.Title;
            _TitleCode = salaryScale.TitleCode;
            _SalaryScale = salaryScale;
        }

        public SalaryStep()
        {
        }
    }

    public class SalaryStepMap : ClassMap<SalaryStep>
    {
        public SalaryStepMap()
        {
            Table("SalarySteps");
            CompositeId()
                .KeyProperty(x => x.TitleCode)
                .KeyProperty(x => x.EffectiveDate)
                .KeyProperty(x => x.StepNumber, "Step")
                .UnsavedValue("any");

            Map(x => x.TitleCode).Not.Update().Not.Insert();
            Map(x => x.EffectiveDate).Not.Update().Not.Insert();
            Map(x => x.StepNumber).Column("Step").Not.Update().Not.Insert();
            Map(x => x.Annual);
            Map(x => x.Monthly);
            Map(x => x.Hourly);

            References(x => x.SalaryScale)
                .Not.Insert()
                .Not.Update()
                .Cascade.None()
                .Unique()
                .Columns("TitleCode", "EffectiveDate");

            References(x => x.Title, "TitleCode")
                .Not.Insert()
                .Not.Update()
                .Cascade.None();
        }
    }
}