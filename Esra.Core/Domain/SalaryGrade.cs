using System;
using System.Collections.Generic;
using FluentNHibernate.Mapping;
using NHibernate.Validator.Constraints;
using UCDArch.Core.DomainModel;
using UCDArch.Core.NHibernateValidator.Extensions;

namespace Esra.Core.Domain
{
    [Serializable]
    public class SalaryGrade : DomainObject, IComparable<SalaryGrade>
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

        private string _Grade;
        [Required]
        [Length(4)]
        public virtual string Grade
        {
            get { return _Grade; }
            set { _Grade = value; }
        }

        private DateTime _EffectiveDate;

        [Required]
        public virtual DateTime EffectiveDate
        {
            get { return _EffectiveDate; }
            set { _EffectiveDate = value; }
        }

        private decimal _MinAnnual;

        [Required]
        public virtual decimal MinAnnual
        {
            get { return _MinAnnual; }
            set { _MinAnnual = value; }
        }

        private decimal _FirstQrtleAnnual;

        [Required]
        public virtual decimal FirstQrtleAnnual
        {
            get { return _FirstQrtleAnnual; }
            set { _FirstQrtleAnnual = value; }
        }

        private decimal _MidAnnual;

        [Required]
        public virtual decimal MidAnnual
        {
            get { return _MidAnnual; }
            set { _MidAnnual = value; }
        }

        private decimal _ThirdQrtleAnnual;

        [Required]
        public virtual decimal ThirdQrtleAnnual
        {
            get { return _ThirdQrtleAnnual; }
            set { _ThirdQrtleAnnual = value; }
        }

        private decimal _MaxAnnual;

        [Required]
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

        public override bool Equals(object obj)
        {
            bool retval = false;
            if (
                this.TitleCode.Equals(((SalaryGrade)obj).TitleCode) &&
                this.SalaryAdminPlan.Equals(((SalaryGrade)obj).SalaryAdminPlan) &&
                this.Grade.Equals(((SalaryGrade)obj).Grade) &&
                (this.EffectiveDate.ToShortDateString()).Equals(((SalaryGrade)obj).EffectiveDate.ToShortDateString())
                )
            {
                retval = true;
            }
            return retval;
        }

        public virtual int CompareTo(SalaryGrade item)
        {
            return this.Grade.CompareTo(item.Grade);
        }

        public override int GetHashCode()
        {
            int retval = base.GetHashCode() / (TitleCode.GetHashCode() + 
                                               SalaryAdminPlan.GetHashCode() +
                                               Grade.GetHashCode() + 
                                               Convert.ToInt32(String.Format("{0:yyyyMMdd}", EffectiveDate)) 
                                               );
            return retval;
        }

        public virtual SalaryGrade InitializedCopy(SalaryScale salaryScale)
        {
            SalaryGrade sg = new SalaryGrade()
            {
                _EffectiveDate = DateTime.Today,
                _Title = this._Title,
                _TitleCode = this.TitleCode,
                _SalaryScale = this._SalaryScale
            };
            return sg;
        }

        public SalaryGrade(SalaryScale salaryScale)
        {
            _EffectiveDate = salaryScale.EffectiveDate;
            _Title = salaryScale.Title;
            _TitleCode = salaryScale.TitleCode;
            _SalaryScale = salaryScale;
        }
        public SalaryGrade(SalaryScale salaryScale, string grade, string salaryAdminPlan)
        {
            _EffectiveDate = salaryScale.EffectiveDate;
            _Title = salaryScale.Title;
            _TitleCode = salaryScale.TitleCode;
            _SalaryScale = salaryScale;
            _Grade = grade;
            _SalaryAdminPlan = salaryAdminPlan;
        }


        public SalaryGrade()
        {
        }
    }

    public class SalaryGradeMap : ClassMap<SalaryGrade>
    {
        public SalaryGradeMap()
        {
            Table("SalaryGrades");
            CompositeId()
                .KeyProperty(x => x.TitleCode)
                .KeyProperty(x => x.SalaryAdminPlan)
                .KeyProperty(x => x.Grade, "SalaryGrade")
                .KeyProperty(x => x.EffectiveDate)
                .UnsavedValue("any");

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

            Map(x => x.TitleCode).Not.Update().Not.Insert();
            Map(x => x.SalaryAdminPlan).Not.Update().Not.Insert();
            Map(x => x.Grade).Column("SalaryGrade").Not.Update().Not.Insert();
            Map(x => x.EffectiveDate).Not.Update().Not.Insert();
            Map(x => x.MinAnnual);
            Map(x => x.FirstQrtleAnnual);
            Map(x => x.MidAnnual);
            Map(x => x.ThirdQrtleAnnual);
            Map(x => x.MaxAnnual);
            
        }
    }
}