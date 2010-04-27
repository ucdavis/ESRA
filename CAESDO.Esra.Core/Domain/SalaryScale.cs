using System;
using System.Collections.Generic;
using System.Text;
using CAESArch.Core.Domain;
using Microsoft.Practices.EnterpriseLibrary.Validation.Validators;

namespace CAESDO.Esra.Core.Domain
{
    [Serializable]
    public class SalaryScale : DomainObject<SalaryScale, int>
    {
        private Title _Title;

        public virtual Title Title
        {
            get { return _Title; }
            set { _Title = value; }
        }

        private string _TitleCode;

        [StringLengthValidator(4)]
        [NotNullValidator]
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
    }
}
