using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using FluentNHibernate.Mapping;
using NHibernate.Validator.Constraints;
using UCDArch.Core.DomainModel;

namespace Esra.Core.Domain
{
    [Serializable]
    public class SalaryReviewAnalysis : DomainObject
    {
        private string _ReferenceNumber;

        public virtual string ReferenceNumber
        {
            get { return _ReferenceNumber; }
            set { _ReferenceNumber = value; }
        }

        private SRAEmployee _Employee;

        public virtual SRAEmployee Employee
        {
            get { return _Employee; }
            set { _Employee = value; }
        }

        /// <summary>
        /// AKA Proposed Title.
        /// This is the Title used to perform the analysis on.
        /// </summary>

        private Title _Title;

        public virtual Title Title
        {
            get { return _Title; }
            set { _Title = value; }
        }

        private SalaryScale _SalaryScale;

        public virtual SalaryScale SalaryScale
        {
            get { return _SalaryScale; }
            set { _SalaryScale = value; }
        }

        private Scenario _ApprovedScenario;

        public virtual Scenario ApprovedScenario
        {
            get { return _ApprovedScenario; }
            set { _ApprovedScenario = value; }
        }

        private IList<Scenario> _Scenarios;

        public virtual IList<Scenario> Scenarios
        {
            get { return _Scenarios; }
            set { _Scenarios = value; }
        }

        private DateTime _DateInitiated;

        public virtual DateTime DateInitiated
        {
            get { return _DateInitiated; }
            set { _DateInitiated = value; }
        }

        private DateTime? _DateApproved;

        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:MM/dd/yyyy}")]
        public virtual DateTime? DateApproved
        {
            get { return _DateApproved; }
            set { _DateApproved = value; }
        }

        private string _DepartmentComments;

        public virtual string DepartmentComments
        {
            get { return _DepartmentComments; }
            set { _DepartmentComments = value; }
        }

        private string _DeansOfficeComments;

        public virtual string DeansOfficeComments
        {
            get { return _DeansOfficeComments; }
            set { _DeansOfficeComments = value; }
        }

        private string _InitiatedByReviewerName;

        // The name of the reviewer who first begin this analysis.
        public virtual string InitiatedByReviewerName
        {
            get { return _InitiatedByReviewerName; }
            set { _InitiatedByReviewerName = value; }
        }

        private Department _OriginatingDepartment;

        // The department whom originated this request, probably the same department as
        // one for which the "InitiatedByReviewerName" works.
        public virtual Department OriginatingDepartment
        {
            get { return _OriginatingDepartment; }
            set { _OriginatingDepartment = value; }
        }

        private bool _IsReclass;

        public virtual bool IsReclass
        {
            get { return _IsReclass; }
            set { _IsReclass = value; }
        }

        /// <summary>
        /// This was the person's title code at the time the
        /// analysis was performed.  Typically the same as the
        /// TitleCode, unless it was a reclass.
        /// </summary>
        private string _CurrentTitleCode;

        [Length(4)]
        [UCDArch.Core.NHibernateValidator.Extensions.Required]
        public virtual string CurrentTitleCode
        {
            get { return _CurrentTitleCode; }
            set { _CurrentTitleCode = value; }
        }

        public SalaryReviewAnalysis()
        {
        }
    }

    public class SalaryReviewAnalysisMap : ClassMap<SalaryReviewAnalysis>
    {
        public SalaryReviewAnalysisMap()
        {
            Table("SalaryReviewAnalysis");

            Id(x => x.Id, "SalaryReviewAnalysisID")
               .UnsavedValue("0")
               .GeneratedBy.Identity();

            Map(x => x.ReferenceNumber);

            References(x => x.Employee, "PkSRAEmployee")
                .Cascade.All();

            References(x => x.Title, "TitleCode").Not.Insert().Not.Update();

            Map(x => x.CurrentTitleCode);
            Map(x => x.DateApproved);
            Map(x => x.DepartmentComments);
            Map(x => x.DeansOfficeComments);
            Map(x => x.InitiatedByReviewerName);

            References(x => x.OriginatingDepartment, "DepartmentNumber");

            References(x => x.ApprovedScenario, "ApprovedScenarioID").ForeignKey("ScenarioID");

            HasMany(x => x.Scenarios)
                .Table("Scenario")
                .AsBag()
                .KeyColumn("SalaryReviewAnalysisID")
                .Inverse()
                .Cascade.All();

            References(x => x.SalaryScale)
                .Columns("TitleCode", "EffectiveDate")
                .Cascade.None()
                .Not.Update();

            Map(x => x.IsReclass);
        }
    }
}