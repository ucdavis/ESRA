using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using FluentNHibernate.Mapping;
using NHibernate.Validator.Constraints;
using UCDArch.Core.DomainModel;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Core.Utils;

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
            _Scenarios = new List<Scenario>();
        }

        /// <summary>
        /// Given a SalaryScale, return a Dictionary containing
        /// the corresponding criteria list of selection types, meaning the name and corresponding
        /// salary amount, i.e. "Step 10.0, 65470.00, etc.
        /// </summary>
        /// <param name="repository"></param>
        /// <param name="salaryScale"></param>
        /// <returns>A key/value pair dictionary containing the selection type criteria</returns>
        /// <modifications>2011-12-08 by kjt: Commented out campus average, and Market selections since we either have little or no data; 2011-12-09 by kjt: Added collegeAverage as a param.</modifications>
        public static Dictionary<string, decimal?> GetCriteriaList(IRepository repository, SalaryScale salaryScale, double collegeAverage)
        {
            Check.Require(repository != null, "Repository must be supplied");

            var cl = new Dictionary<string, decimal?>();

            if (salaryScale != null)
            {
                List<SelectionType> selectionTypes = repository.OfType<SelectionType>()
                    .Queryable
                    //.Where(x => x.ShortType != "Step")
                    .OrderBy(s => s.SortOrder)
                    .ToList();

                cl.Add(selectionTypes[(int)Domain.SelectionType.Types.NONE].ShortType, null); // "None"

                if (salaryScale.SalarySteps.Count == 0)
                {
                    cl.Add(selectionTypes[(int)Domain.SelectionType.Types.MIN].ShortType,
                           salaryScale.SalaryGradeQuartiles.MinAnnual); // "Min"
                    cl.Add(selectionTypes[(int)Domain.SelectionType.Types.FIRST].ShortType,
                           salaryScale.SalaryGradeQuartiles.FirstQrtleAnnual); // "1st"
                    cl.Add(selectionTypes[(int)Domain.SelectionType.Types.MID].ShortType,
                           salaryScale.SalaryGradeQuartiles.MidAnnual); // "Mid"
                    cl.Add(selectionTypes[(int)Domain.SelectionType.Types.THIRD].ShortType,
                           salaryScale.SalaryGradeQuartiles.ThirdQrtleAnnual); // "3rd"
                    cl.Add(selectionTypes[(int)Domain.SelectionType.Types.MAX].ShortType,
                           salaryScale.SalaryGradeQuartiles.MaxAnnual); // "Max"
                }

                //cl.Add(selectionTypes[(int)Domain.SelectionType.Types.LM_WAS].ShortType, Convert.ToDecimal(salaryScale.LaborMarketWAS)); // "Labor Mkt WAS"
                //cl.Add(selectionTypes[(int)Domain.SelectionType.Types.LM_MID].ShortType, Convert.ToDecimal(salaryScale.LaborMarketMidAnnual)); // "Labor Mkt Mid"
                // This needs to be revised to return the college average for the college average of the employee!!!!
                if (collegeAverage != null && collegeAverage > 0)
                {
                    cl.Add(selectionTypes[(int)Domain.SelectionType.Types.COLLEGE_AVG].ShortType,
                           Convert.ToDecimal(collegeAverage)); // "College AVG"
                }

                //cl.Add(selectionTypes[(int)Domain.SelectionType.Types.COLLEGE_AVG].ShortType, Convert.ToDecimal(salaryScale.CollegeAverageAnnual)); // "College AVG"
                //cl.Add(selectionTypes[(int)Domain.SelectionType.Types.CAMPUS_AVG].ShortType, Convert.ToDecimal(salaryScale.CampusAverageAnnual)); // "Campus AVG"

                // This should never get called unless someone called this method with a SalaryScale that was
                // not fetched using SalaryScale.GetEffectiveSalarryScale(...)
                if (salaryScale.NumSalarySteps > 0 && (salaryScale.SalarySteps.Count != salaryScale.NumSalarySteps))
                {
                    // lazy binding work around to fetch all salary steps:
                    salaryScale.SalarySteps = repository.OfType<SalaryStep>()
                        .Queryable
                        .Where(s => s.TitleCode == salaryScale.TitleCode && s.EffectiveDate == salaryScale.EffectiveDate)
                        .OrderBy(x => x.Annual)
                        .ToList();
                }

                foreach (var step in salaryScale.SalarySteps)
                {
                    cl.Add(selectionTypes[(int)Domain.SelectionType.Types.STEP].ShortType + " " + step.StepNumber, Convert.ToDecimal(step.Annual)); // "Step"
                }
            }

            return cl;
        }

        /// <summary>
        /// Given a repository and a salary review analysis, update the database to match the
        /// record provided.
        /// </summary>
        /// <param name="repository">An interface to a database repository</param>
        /// <param name="record">The salary review analysis to update</param>
        public static void UpdateRecord(IRepository repository, SalaryReviewAnalysis record)
        {
            Check.Require(repository != null, "Repository must be supplied");

            Scenario approvedScenario = null;

            // Logic for adding any new scenarios, updating existing scenarios
            // and deleting unwanted scenarios:

            /* Delete any scenario in the old, but not in the new.
             * Update any scenario that exists in both the old and new.
             * Add any scenario not in the old, but in the new.
             */

            foreach (var scenario in record.Scenarios)
            {
                if (scenario.SalaryReviewAnalysis == null)
                {
                    scenario.SalaryReviewAnalysis = record;
                }

                // Logic for setting the approved scenario.
                if (scenario.Approved != null && (bool)scenario.Approved)
                {
                    approvedScenario = scenario;
                }
            }

            record.ApprovedScenario = approvedScenario;

            // TODO: Add logic for figuring out originating department.
            // Is this the user's home department if it's the same as their
            // work department; otherwise their work department or what?
            // or perhaps we just leave this blank?

            using (var ts = new TransactionScope())
            {
                var oldScenarios = repository.OfType<Scenario>()
                    .Queryable.Where(x => x.SalaryReviewAnalysisID == record.Id).ToList();

                foreach (var oldScenario in oldScenarios)
                {
                    var found = false;
                    var scenario1 = oldScenario;
                    foreach (var scenario in record.Scenarios.Where(scenario => scenario1.Id == scenario.Id))
                    {
                        // keep.
                        found = true;
                        continue;
                    }
                    if (!found)
                    {
                        // delete.
                        repository.OfType<Scenario>().Remove(oldScenario);
                    }
                }

                repository.OfType<SalaryReviewAnalysis>().EnsurePersistent(record);

                record.Employee.CorrespondingAnalysisID = record.Id;

                if (String.IsNullOrEmpty(record.ReferenceNumber))
                {
                    record.ReferenceNumber = String.Format("{0:yyyyMMdd}", DateTime.Today) + record.Id;
                }

                repository.OfType<SalaryReviewAnalysis>().EnsurePersistent(record);
                ts.CommitTransaction();
            }
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