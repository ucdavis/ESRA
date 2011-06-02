using System;
using FluentNHibernate.Mapping;
using UCDArch.Core.DomainModel;

namespace Esra.Core.Domain
{
    [Serializable]
    public class Scenario : DomainObject
    {
        private SalaryReviewAnalysis _SalaryReviewAnalysis;

        // Corresponding SAR to which this scenario is associated with.
        public virtual SalaryReviewAnalysis SalaryReviewAnalysis
        {
            get { return _SalaryReviewAnalysis; }
            set { _SalaryReviewAnalysis = value; }
        }

        private int _SalaryReviewAnalysisID;

        public virtual int SalaryReviewAnalysisID
        {
            get { return _SalaryReviewAnalysisID; }
            set { _SalaryReviewAnalysisID = value; }
        }

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

    public class ScenarioMap : ClassMap<Scenario>
    {
        public ScenarioMap()
        {
            Table("Scenario");
            Id(x => x.Id, "ScenarioID")
               .UnsavedValue("0")
               .GeneratedBy.Identity();

            Map(x => x.ScenarioNumber);
            Map(x => x.PercentIncrease);
            Map(x => x.SalaryAmount);
            Map(x => x.Approved);
            Map(x => x.SalaryReviewAnalysisID).Not.Update().Not.Insert();
            Map(x => x.SelectionType);
            References(x => x.SalaryReviewAnalysis, "SalaryReviewAnalysisID");
        }
    }
}