﻿using System;
using System.Collections.Generic;
using System.Linq;
using Esra.Core.Domain;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Core.Utils;

namespace Esra.Web.Models
{
    /// <summary>
    /// ViewModel for the SalaryReviewAnalysis class
    /// </summary>
    public class SalaryReviewAnalysisViewModel : EsraBaseViewModel
    {
        public SalaryReviewAnalysisSearchParamsModel SalaryReviewAnalysisSearchParamsModel { get; set; }

        public String SelectedReferenceNumber { get; set; }

        public Employee SelectedEmployee { get; set; }

        public User SelectedUser { get; set; }

        // The SalaryReviewAnalysis creation date sought for
        // formerly populated from tbCreationDate
        //[DataType(DataType.Time)]
        //[DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:d}")]
        //public DateTime CreationDateString { get; set; }
        public String CreationDateString { get; set; }

        // This is a list of all possible users that can be "seen" based on the logged-in user's unit(s) and role Name
        // Used to populate the "Created By" drop-down search list.
        // formerly ddlCreatedBy: DataTextField: FullName; DataValueField: LoginID
        public IList<User> FilteredUsers { get; set; }

        // List of all possible employees that can be "seen" by the logged-in user
        // Used to populate the "Employee" drop-down search list.
        // formerly ddlEmployee: DataTextField: FullName; DataValueField: ID
        public IList<Employee> FilteredEmployees { get; set; }

        // List of all EmployeeSalaryReviewAnalysis that can be "seen" based on the logged in user's unit(s) and role name
        // Used to populate the Reference Number drop-down search list.
        // formerly ddlReferenceNumber: DataTextField: ReferenceNumber; DavaValueField: ID
        public IList<SalaryReviewAnalysis> FilteredSalaryReviewAnalysis { get; set; }

        //List of all the matching SalaryReviewAnalysis meeting the search criteria
        // Used to populate the SalaryReviewAnalysis results listing
        // formerly gvSalaryReviewAnalysis
        public IList<SalaryReviewAnalysis> SalaryReviewAnalysisResults { get; set; }

        // This is the particular salary review analysis sought, once selected from list
        public SalaryReviewAnalysis SalaryReviewAnalysis { get; set; }

        /// <summary>
        /// This is the employee for which a new salary review analysis is to be created.
        /// </summary>
        public Employee NewSraEmployee { get; set; }

        /// <summary>
        /// This is a list of titles that can be used for reclassification.
        /// </summary>
        public IList<Title> ProposedTitles { get; set; }

        /// <summary>
        /// This is the proposed title code submitted for a reclassification.
        /// </summary>
        public string ProposedTitleCode { get; set; }

        public static SalaryReviewAnalysisViewModel Create(IRepository repository)
        {
            return Create(repository, false, null, null);
        }

        public static SalaryReviewAnalysisViewModel Create(IRepository repository, bool isDepartmentUser, SalaryReviewAnalysisSearchParamsModel salaryReviewAnalysisSearchParamsModel)
        {
            return Create(repository, false, null, salaryReviewAnalysisSearchParamsModel);
        }

        public static SalaryReviewAnalysisViewModel Create(IRepository repository, bool isDepartmentUser, User user, SalaryReviewAnalysisSearchParamsModel salaryReviewAnalysisSearchParamsModel)
        {
            Check.Require(repository != null, "Repository must be supplied");

            //bool isDepartmentUserBool =
            // Boolean.TryParse(isDepartmentUser, out isDepartmentUserBool) ? isDepartmentUserBool : false;

            var viewModel = new SalaryReviewAnalysisViewModel
                                {
                                    SalaryReviewAnalysisSearchParamsModel =
                                        SalaryReviewAnalysisSearchParamsModel.Create(repository,
                                                                                     salaryReviewAnalysisSearchParamsModel),
                                    SelectedEmployee = salaryReviewAnalysisSearchParamsModel.SelectedEmployee,
                                    SelectedUser = salaryReviewAnalysisSearchParamsModel.SelectedUser,
                                    SelectedReferenceNumber =
                                        salaryReviewAnalysisSearchParamsModel.SelectedReferenceNumber,
                                    CreationDateString = salaryReviewAnalysisSearchParamsModel.CreationDateString,

                                    SalaryReviewAnalysis = new SalaryReviewAnalysis(),

                                    IsDepartmentUser = isDepartmentUser,

                                    FilteredEmployees =
                                        Employee.GetAllForUser(repository, user, isDepartmentUser, "FullName", true),

                                    FilteredUsers = User.GetAll(repository, user, isDepartmentUser),

                                    ProposedTitles = repository.OfType<Title>()
                                    .Queryable
                                    .OrderBy(t => t.TitleCode)
                                    .ToList()
                                };

            //------------------------------------------------------------------------------------
            // viewModel.FilteredSalaryReviewAnalysis should only contain reference numbers for
            // Analysis that are visible to the User, meaning created by someone in the user's units:

            var reviewerNames = viewModel.FilteredUsers.Select(x => x.FullName).ToArray();

            viewModel.FilteredSalaryReviewAnalysis = repository.OfType<SalaryReviewAnalysis>()
                .Queryable
                .Where(x => reviewerNames.Contains(x.InitiatedByReviewerName))
                .OrderBy(y => y.ReferenceNumber)
                .ToList();

            //------------------------------------------------------------------------------------

            if (viewModel.SalaryReviewAnalysisSearchParamsModel.SalaryReviewAnalysisSearchExpression != null)
            {
                viewModel.SalaryReviewAnalysisResults = repository.OfType<SalaryReviewAnalysis>()
                    .Queryable
                    .Where(viewModel.SalaryReviewAnalysisSearchParamsModel.SalaryReviewAnalysisSearchExpression)
                    .OrderBy(t => t.Employee.FullName)
                    .ToList();
            }
            else
            {
                viewModel.SalaryReviewAnalysisResults = repository.OfType<SalaryReviewAnalysis>()
                    .Queryable
                    .OrderBy(t => t.Employee.FullName)
                    .ToList();
            }

            return viewModel;
        }
    }
}