using System;
using System.Collections.Generic;
using System.Linq;
using FluentNHibernate.Mapping;
using NHibernate.Validator.Constraints;
using UCDArch.Core.DomainModel;
using UCDArch.Core.NHibernateValidator.Extensions;
using UCDArch.Core.PersistanceSupport;

//using CAESArch.Core.Domain;

namespace Esra.Core.Domain
{
    [Serializable]
    public class SalaryScale : DomainObject
    {
        private Title _Title;

        public virtual Title Title
        {
            get { return _Title; }
            set { _Title = value; }
        }

        private string _TitleCode;

        [Length(4)]
        [Required]
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

        private int _NumSalarySteps;

        public virtual int NumSalarySteps
        {
            get { return _NumSalarySteps; }
            set { _NumSalarySteps = value; }
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

        public override bool Equals(object obj)
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

        public virtual SalaryScale InitializedCopy()
        {
            SalaryScale retval = new SalaryScale()
            {
                _BargainingCode = this._BargainingCode,
                _EffectiveDate = DateTime.Today,
                _NumSalarySteps = this._NumSalarySteps,
                _Title = this._Title,
                _TitleCode = this._TitleCode,
                SalaryGrade = this.SalaryGrade
            };

            // Create a new SalaryGradeQuartiles and add it to the SalaryScale:
            /*
            retval.SalaryGradeQuartiles = new SalaryGradeQuartiles()
            {
                EffectiveDate = DateTime.Today,
                SalaryGrade = this.SalaryGrade
            };
             * */
            // Not sure if I need this or NHibernate will take care of this for me.
            //retval.SalaryGradeQuartiles.SalaryScales.Add(retval);

            // Take care of creating initialized copies of the salary steps:
            List<SalaryStep> ss = new List<SalaryStep>();
            foreach (SalaryStep step in this.SalarySteps)
            {
                ss.Add(step.InitializedCopy(retval));
            }
            retval.SalarySteps = ss; // Assign the newly copied salary steps.

            return retval;
        }

        public SalaryScale()
        {
        }

        public static SalaryScale GetEffectiveSalaryScale(IRepository repository, string titleCode, DateTime effectiveDate)
        {
            // get salary scale whose effective date is equal to or less than the effectiveDate provided:
            SalaryScale retval = null;

            var queryable = repository.OfType<SalaryScale>().Queryable;

            var count = queryable.Where(x => x.TitleCode.Equals(titleCode)).Count();

            // Get the corresponding salary scale only if there's salary data available; otherwise, return null
            // and let the view handle displaying the "No Data Found" message.
            if (count > 0)
            {
                if (count == 1)
                {
                    // Then there's only 1 salary scale so return it:
                    retval = queryable.Where(x => x.TitleCode.Equals(titleCode)).SingleOrDefault();
                }
                else
                {
                    // There's multiple salary scales for the same title code, so get the one
                    // whose effective date is equal to or less than the effectiveDate:

                    // Find the max effective date for the given title code that is equal to or less than the effectiveDate provided:
                    var maxEffectiveDateForDate =
                        queryable.Where(x => x.TitleCode.Equals(titleCode) && x.EffectiveDate <= effectiveDate).Max(x => x.EffectiveDate);

                    retval =
                        queryable.Where(x => x.TitleCode.Equals(titleCode) && x.EffectiveDate == maxEffectiveDateForDate).
                            FirstOrDefault();
                }
            }
            return retval;
        }
    }

    public class SalaryScaleMap : ClassMap<SalaryScale>
    {
        public SalaryScaleMap()
        {
            Table("SalaryScale");
            CompositeId()
               .KeyProperty(x => x.TitleCode)
               .KeyProperty(x => x.EffectiveDate)
               .UnsavedValue("any");

            References(x => x.Title, "TitleCode")
                .Cascade.None()
                .Not.Insert()
                .Not.Update();

            Map(x => x.TitleCode).Not.Update().Not.Insert();
            Map(x => x.EffectiveDate).Not.Update().Not.Insert();
            Map(x => x.SalaryGrade);
            Map(x => x.BargainingCode);
            Map(x => x.NumSalarySteps);
            Map(x => x.LaborMarketWAS);
            Map(x => x.LaborMarketMidAnnual);
            Map(x => x.CollegeAverageAnnual, "CollegeAvgAnnual");
            Map(x => x.CampusAverageAnnual, "CampusAvgAnnual");

            References(x => x.SalaryGradeQuartiles)
                .Columns("SalaryGrade", "EffectiveDate")
                .Not.Insert()
                .Not.Update()
                .Cascade.None();

            HasMany(x => x.SalarySteps)
                .KeyColumns.Add("TitleCode", "EffectiveDate")
                .Inverse()
                .Cascade.AllDeleteOrphan()
                .OrderBy("Annual");
        }
    }
}