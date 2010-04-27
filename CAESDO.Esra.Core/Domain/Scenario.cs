using System;
using System.Collections.Generic;
using System.Text;

namespace CAESDO.Esra.Core.Domain
{
    public class Scenario : DomainObject<Scenario, int>
    {
        private SalaryReviewAnalysis _SalaryReviewAnalysis;
        // Corresponding SAR to which this scenario is associated with.
        public virtual SalaryReviewAnalysis SalaryReviewAnalysis
        {
            get { return _SalaryReviewAnalysis; }
            set { _SalaryReviewAnalysis = value; }
        }

        //public virtual int SalaryReviewAnalysisID
        //{
        //    get { return SalaryReviewAnalysisID; }
        //    set { SalaryReviewAnalysisID = value; }
        //}

        private int _ScenarioNumber;
        // i.e. 1-7.
        public virtual int ScenarioNumber
        {
            get { return _ScenarioNumber; }
            set { _ScenarioNumber = value; }
        }

        private string _SelectionType;
        // Valid only if selection was choosen from drop-down list.
        public virtual string SelectionType
        {
            get { return _SelectionType; }
            set { _SelectionType = value; }
        }

        private double? _PercentIncrease;
        // Valid only a percent increase was entered.
        public virtual double? PercentIncrease
        {
            get { return _PercentIncrease; }
            set { _PercentIncrease = value; }
        }

        private double? _SalaryAmount;
        // Valid only if a salary amount was entered.
        public virtual double? SalaryAmount
        {
            get { return _SalaryAmount; }
            set { _SalaryAmount = value; }
        }

        private bool? _Approved;
        // Set if this is the "approved" salary scenario.
        public virtual bool? Approved
        {
            get { return _Approved; }
            set { _Approved = value; }
        }

        public Scenario()
        {

        }
    }
}
