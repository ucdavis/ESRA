using System;
using FluentNHibernate.Mapping;
using NHibernate.Validator.Constraints;
using UCDArch.Core.DomainModel;
using UCDArch.Core.NHibernateValidator.Extensions;

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
        [Required]
        [Length(4)]
        public virtual string TitleCode
        {
            get { return _TitleCode; }
            set { _TitleCode = value; }
        }

        private string _SalaryAdminPlan;
        [Required]
        [Length(4)]
        public virtual string SalaryAdminPlan
        {
            get { return _SalaryAdminPlan; }
            set { _SalaryAdminPlan = value; }
        }

        [Required]
        [Length(4)]
        private string _SalaryGrade;

        public virtual string SalaryGrade
        {
            get { return _SalaryGrade; }
            set { _SalaryGrade = value; }
        }

        private DateTime _EffectiveDate;
        [Required]
        public virtual DateTime EffectiveDate
        {
            get { return _EffectiveDate; }
            set { _EffectiveDate = value; }
        }

        private string _StepNumber;
        [Required]
        public virtual string StepNumber
        {
            get { return _StepNumber; }
            set { _StepNumber = value; }
        }

        private double _Annual;

        [Required]
        public virtual double Annual
        {
            get { return _Annual; }
            set { _Annual = value; }
        }

        private double _Monthly;
        [Required]
        public virtual double Monthly
        {
            get { return _Monthly; }
            set { _Monthly = value; }
        }

        private double _Hourly;
        [Required]
        public virtual double Hourly
        {
            get { return _Hourly; }
            set { _Hourly = value; }
        }

        public override bool Equals(object obj)
        {
            bool retval = false;
            if (
                (this._EffectiveDate.ToShortDateString()).Equals(((SalaryStep)obj)._EffectiveDate.ToShortDateString()) 
                && this._TitleCode.Equals(((SalaryStep)obj)._TitleCode)
                && this._SalaryAdminPlan.Equals(((SalaryStep)obj)._SalaryAdminPlan)
                && this._SalaryGrade.Equals(((SalaryStep)obj)._SalaryGrade)
                && this._StepNumber.Equals(((SalaryStep)obj)._StepNumber)
                )
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
            int retval = base.GetHashCode() / (
                Convert.ToInt32(TitleCode) +
                SalaryAdminPlan.GetHashCode() +
                SalaryGrade.GetHashCode() +
                StepNumber.GetHashCode() +
                Convert.ToInt32(String.Format("{0:yyyyMMdd}", EffectiveDate))
            );
            return retval;
        }

        public virtual SalaryStep InitializedCopy(SalaryScale salaryScale)
        {
            SalaryStep ss = new SalaryStep()
            {
                _EffectiveDate = DateTime.Today,
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
                .KeyProperty(x => x.SalaryAdminPlan)
                .KeyProperty(x => x.SalaryGrade)
                .KeyProperty(x => x.EffectiveDate)
                .KeyProperty(x => x.StepNumber, "Step")
                .UnsavedValue("any");

            Map(x => x.TitleCode).Not.Update().Not.Insert();
            Map(x => x.SalaryAdminPlan).Not.Update().Not.Insert();
            Map(x => x.SalaryGrade).Not.Update().Not.Insert();
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