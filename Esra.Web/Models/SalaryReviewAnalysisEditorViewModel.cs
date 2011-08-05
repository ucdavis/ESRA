using System;
using System.Collections.Generic;
using System.Linq;
using Esra.Core.Domain;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Core.Utils;

namespace Esra.Web.Models
{
    /// <summary>
    /// View model for use with creation of a new SalaryReviewAnalysis.
    /// </summary>
    public class SalaryReviewAnalysisEditorViewModel : EsraBaseViewModel
    {
        public DateTime ReportDate { get; set; }

        public SalaryScaleViewModel SalaryScaleViewModel { get; set; }

        /// <summary>
        /// This is the list of all the possible scenario types available.
        /// </summary>
        //public IList<SelectionType> SelectionTypes { get; set; }

        /// <summary>
        /// This is the actual criteria list populated for a specific title code.
        /// </summary>
        public Dictionary<string, decimal?> CriteriaList { get; set; }

        // This is the new salary review analysis that will be created
        public SalaryReviewAnalysis SalaryReviewAnalysis { get; set; }

        /// <summary>
        /// This is the SRA Employee for that will be associated with the new salary review analysis once it is to be created.
        /// </summary>
        public SRAEmployee SraEmployee { get; set; }

        /// <summary>
        /// This is the employee for which a new salary review analysis is to be created.
        /// It is where the employee name and title code will be populated from.
        /// </summary>
        public Employee SelectedEmployee { get; set; }

        /// <summary>
        /// This is a select list of titles that can be used for reclassification.
        /// It is used to populate the Reclassification titles drop-down list.
        /// </summary>
        public IList<Title> ProposedTitles { get; set; }

        /// <summary>
        /// This is the proposed title associated with a reclassification.
        /// </summary>
        public Title ProposedTitle { get; set; }

        public static SalaryReviewAnalysisEditorViewModel Create(IRepository repository, string selectedEmployeeId)
        {
            return Create(repository, selectedEmployeeId, null, null);
        }

        public static SalaryReviewAnalysisEditorViewModel Create(IRepository repository, string selectedEmployeeId, string proposedTitle, string referenceNumber)
        {
            Check.Require(repository != null, "Repository must be supplied");

            var viewModel = new SalaryReviewAnalysisEditorViewModel
                                {
                                    ProposedTitles = repository.OfType<Title>()
                                        .Queryable
                                        .OrderBy(t => t.TitleCode)
                                        // .ThenBy(t => t.TitleCode)
                                        .ToList(),

                                    //SelectionTypes = repository.OfType<SelectionType>()
                                    //.Queryable
                                    //.Where(x => x.ShortType != "Step")
                                    //.OrderBy(s => s.SortOrder)
                                    //.ToList(),

                                    ReportDate = DateTime.Today
                                };

            var salaryScaleViewModel = new SalaryScaleViewModel();

            SalaryReviewAnalysis salaryReviewAnalysis = null;
            SalaryScale salaryScale = null;

            if (String.IsNullOrEmpty(referenceNumber))
            {
                viewModel.ReportDate = DateTime.Today;
                viewModel.SelectedEmployee = repository.OfType<Employee>()
                    .Queryable
                    .Where(e => e.id.Equals(selectedEmployeeId))
                    .FirstOrDefault();

                salaryReviewAnalysis = new SalaryReviewAnalysis();
                salaryReviewAnalysis.DateInitiated = DateTime.Today;
                var scenarios = new List<Scenario>();
                var scenario = new Scenario
                                   {
                                       SalaryReviewAnalysis = salaryReviewAnalysis,
                                       ScenarioNumber = 1,
                                       Approved = false,
                                       SalaryAmount = viewModel.SelectedEmployee.PayRate
                                   };
                scenarios.Add(scenario);
                salaryReviewAnalysis.Scenarios = scenarios;
                viewModel.SalaryReviewAnalysis = salaryReviewAnalysis;

                viewModel.SraEmployee = new SRAEmployee(viewModel.SelectedEmployee);

                salaryScale = new SalaryScale();

                if (string.IsNullOrEmpty(proposedTitle) == false)
                {
                    viewModel.SalaryReviewAnalysis.IsReclass = true;

                    viewModel.ProposedTitle = repository.OfType<Title>()
                        .Queryable
                        .Where(p => p.TitleCode.Equals(proposedTitle))
                        .FirstOrDefault();

                    salaryScale = repository.OfType<SalaryScale>()
                        .Queryable
                        .Where(r => r.TitleCode == proposedTitle)
                        .FirstOrDefault();
                }
                else
                {
                    salaryScale = repository.OfType<SalaryScale>()
                        .Queryable
                        .Where(r => r.TitleCode == viewModel.SelectedEmployee.TitleCode)
                        .FirstOrDefault();
                }
            }
            else
            {
                // Reference number is present so get by reference number:
                viewModel.SalaryReviewAnalysis = repository.OfType<SalaryReviewAnalysis>()
                    .Queryable
                    .Where(x => x.ReferenceNumber.Equals(referenceNumber))
                    .FirstOrDefault();

                viewModel.SraEmployee = viewModel.SalaryReviewAnalysis.Employee;

                viewModel.ProposedTitle = (viewModel.SalaryReviewAnalysis.IsReclass ? viewModel.SalaryReviewAnalysis.Title : null);

                salaryScale = viewModel.SalaryReviewAnalysis.SalaryScale;
            }

            var cl = new Dictionary<string, decimal?>();
            if (salaryScale != null)
            {
                salaryScale.SalarySteps = repository.OfType<SalaryStep>()
                    .Queryable
                    .Where(s => s.TitleCode == salaryScale.TitleCode && s.EffectiveDate == salaryScale.EffectiveDate)
                    .ToList();

                salaryScaleViewModel.SalaryScale = salaryScale;

                List<SelectionType> selectionTypes = repository.OfType<SelectionType>()
                    .Queryable
                    //.Where(x => x.ShortType != "Step")
                    .OrderBy(s => s.SortOrder)
                    .ToList();

                if (salaryScale.SalarySteps.Count == 0)
                {
                    cl.Add(selectionTypes[(int)SelectionType.Types.MIN].ShortType, salaryScale.SalaryGradeQuartiles.MinAnnual); // "Min"
                    cl.Add(selectionTypes[(int)SelectionType.Types.FIRST].ShortType, salaryScale.SalaryGradeQuartiles.FirstQrtleAnnual); // "1st"
                    cl.Add(selectionTypes[(int)SelectionType.Types.MID].ShortType, salaryScale.SalaryGradeQuartiles.MidAnnual); // "Mid"
                    cl.Add(selectionTypes[(int)SelectionType.Types.THIRD].ShortType, salaryScale.SalaryGradeQuartiles.ThirdQrtleAnnual); // "3rd"
                    cl.Add(selectionTypes[(int)SelectionType.Types.MAX].ShortType, salaryScale.SalaryGradeQuartiles.MaxAnnual); // "Max"
                }
                cl.Add(selectionTypes[(int)SelectionType.Types.LM_WAS].ShortType, Convert.ToDecimal(salaryScale.LaborMarketWAS)); // "Labor Mkt WAS"
                cl.Add(selectionTypes[(int)SelectionType.Types.LM_MID].ShortType, Convert.ToDecimal(salaryScale.LaborMarketMidAnnual)); // "Labor Mkt Mid"
                cl.Add(selectionTypes[(int)SelectionType.Types.COLLEGE_AVG].ShortType, Convert.ToDecimal(salaryScale.CollegeAverageAnnual)); // "College AVG"
                cl.Add(selectionTypes[(int)SelectionType.Types.CAMPUS_AVG].ShortType, Convert.ToDecimal(salaryScale.CampusAverageAnnual)); // "Campus AVG"

                foreach (SalaryStep step in salaryScale.SalarySteps)
                {
                    cl.Add(selectionTypes[(int)SelectionType.Types.STEP].ShortType + " " + step.StepNumber, Convert.ToDecimal(step.Annual)); // "Step"
                }
            }
            viewModel.CriteriaList = cl;

            viewModel.SalaryScaleViewModel = salaryScaleViewModel;

            return viewModel;
        }
    }
}