﻿using System;
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
        public IDictionary<string, decimal?> CriteriaList { get; set; }

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

        /// <summary>
        /// This is a list of possible originating departments of the user
        /// </summary>
        public IList<Department> PossibleOriginatingDepartments { get; set; }

        public static SalaryReviewAnalysisEditorViewModel Create(IRepository repository, string selectedEmployeeId, User user)
        {
            return Create(repository, selectedEmployeeId, null, null, user);
        }

        /// <summary>
        /// Given a repository, employee ID, proposed title (optional) and user
        /// or repository, reference number, and user,
        /// Create a Salary Analysis Editor View model.
        /// </summary>
        /// <param name="repository">Database IRepository context</param>
        /// <param name="selectedEmployeeId">Employee ID of the employee for which to perform a new salary review analysis upon</param>
        /// <param name="proposedTitle">The proposed title to be used in conjunction with performing for a reclassification review; otherwise, null when performing an equity review</param>
        /// <param name="referenceNumber">The Salary Review Analysis reference number to be used for looking up an existing analysis</param>
        /// <param name="user">The logged in user either creating a new or viewing an existing analysis.  Used for determining which college average(s) to display on the associated Salary Scale</param>
        /// <returns>A SalaryReviewAnalysisEditorViewModel populated according to the parameters provided</returns>
        public static SalaryReviewAnalysisEditorViewModel Create(IRepository repository, string selectedEmployeeId, string proposedTitle, string referenceNumber, User user)
        {
            Check.Require(repository != null, "Repository must be supplied");

            var viewModel = new SalaryReviewAnalysisEditorViewModel
                                {
                                    ProposedTitles = repository.OfType<Title>()
                                        .Queryable
                                        .OrderBy(t => t.AbbreviatedName)
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
            string titleCode = null;  // This title code is used in conjunction with determining colleges averages.

            if (!String.IsNullOrEmpty(referenceNumber) || !String.IsNullOrEmpty(selectedEmployeeId))
            {
                // Assumes either an employee ID or reference number was provided.
                // We should always get here unless someone bypassed the menu page and entered a URL directly into
                // a web browser with some or all parameters missing.
                if (String.IsNullOrEmpty(referenceNumber))
                {
                    // Then an employee ID and proposed title for reclassification (optional) was provided
                    viewModel.ReportDate = DateTime.Today;
                    viewModel.SelectedEmployee = repository.OfType<Employee>()
                        .Queryable
                        .Where(e => e.id.Equals(selectedEmployeeId))
                        .FirstOrDefault();

                    salaryReviewAnalysis = new SalaryReviewAnalysis { DateInitiated = DateTime.Today };
                    var scenarios = new List<Scenario>();
                    var scenario = new Scenario
                                       {
                                           SalaryReviewAnalysis = salaryReviewAnalysis,
                                           ScenarioNumber = 1,
                                           SelectionType = "None",
                                           PercentIncrease = 0,
                                           Approved = false,
                                           SalaryAmount = viewModel.SelectedEmployee.PayRate
                                       };
                    scenarios.Add(scenario);
                    salaryReviewAnalysis.Scenarios = scenarios;
                    viewModel.SalaryReviewAnalysis = salaryReviewAnalysis;

                    viewModel.SraEmployee = new SRAEmployee(viewModel.SelectedEmployee);

                    salaryScale = new SalaryScale();

                    if (string.IsNullOrEmpty(proposedTitle) == false && !viewModel.SelectedEmployee.TitleCode.Equals(proposedTitle))
                    {
                        // Then the optional proposed title was provided so this is a reclassification review.
                        titleCode = proposedTitle;

                        viewModel.SalaryReviewAnalysis.IsReclass = true;

                        viewModel.ProposedTitle = repository.OfType<Title>()
                            .Queryable
                            .Where(p => p.TitleCode.Equals(proposedTitle))
                            .FirstOrDefault();

                        //salaryScale = repository.OfType<SalaryScale>()
                        //    .Queryable
                        //    .Where(r => r.TitleCode == proposedTitle)
                        //    .FirstOrDefault();
                        salaryScale = SalaryScale.GetEffectiveSalaryScale(repository, proposedTitle, DateTime.Today);

                        viewModel.SalaryReviewAnalysis.Title = viewModel.ProposedTitle;
                    }
                    else
                    {
                        // Else this is a standard equity review.
                        titleCode = viewModel.SelectedEmployee.TitleCode;

                        //salaryScale = repository.OfType<SalaryScale>()
                        //    .Queryable
                        //    .Where(r => r.TitleCode == viewModel.SelectedEmployee.TitleCode)
                        //    .FirstOrDefault();
                        salaryScale = SalaryScale.GetEffectiveSalaryScale(repository, viewModel.SelectedEmployee.TitleCode, DateTime.Today);

                        viewModel.SalaryReviewAnalysis.Title = viewModel.SelectedEmployee.Title;
                    }
                }
                else if (!String.IsNullOrEmpty(referenceNumber))
                {
                    // Reference number is present so try getting existing review by reference number:
                    viewModel.SalaryReviewAnalysis = repository.OfType<SalaryReviewAnalysis>()
                        .Queryable
                        .Where(x => x.ReferenceNumber.Equals(referenceNumber))
                        .FirstOrDefault();

                    if (viewModel.SalaryReviewAnalysis != null)
                    {
                        titleCode = viewModel.SalaryReviewAnalysis.SalaryScale.TitleCode;

                        viewModel.SraEmployee = viewModel.SalaryReviewAnalysis.Employee;

                        viewModel.ProposedTitle = (viewModel.SalaryReviewAnalysis.IsReclass ? viewModel.SalaryReviewAnalysis.Title : null);

                        salaryScale = SalaryScale.GetEffectiveSalaryScale(repository, viewModel.SalaryReviewAnalysis.SalaryScale.TitleCode, viewModel.SalaryReviewAnalysis.SalaryScale.EffectiveDate);
                    }
                }

                if (salaryScale != null)
                {
                    // Determine the user's school(s)
                    var schoolsForUser = user.Units.Select(x => x.DeansOfficeSchoolCode).Distinct().ToArray();
                    // and populate the corresponding college averages:
                    salaryScaleViewModel.CollegeAverages =
                        repository.OfType<CollegeAverage>().Queryable.Where(x => schoolsForUser.Contains(x.SchoolCode) && x.TitleCode == titleCode).
                            ToList();

                    var employeesSchoolCode = viewModel.SraEmployee.HomeDepartment.SchoolCode;
                    var collegeAverage =
                        salaryScaleViewModel.CollegeAverages.Where(x => x.SchoolCode.Equals(employeesSchoolCode)).Select(x => x.CollegeAverageAnnual).
                            FirstOrDefault();

                    viewModel.CriteriaList = SalaryReviewAnalysis.GetCriteriaList(repository, salaryScale, collegeAverage);
                    salaryScaleViewModel.SalaryScale = salaryScale;
                }
            }
            viewModel.SalaryScaleViewModel = salaryScaleViewModel;

            return viewModel;
        }
    }
}