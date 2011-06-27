using System;
using System.Collections.Generic;
using Esra.Core.Domain;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Core.Utils;

namespace Esra.Web.Models
{
    /// <summary>
    /// ViewModel for the SalaryReviewAnalysis class
    /// </summary>
    public class SalaryReviewAnalysisViewModel
    {
        public String HiddenUserId { get; set; }

        public bool HiddenIsDepartmentUser { get; set; }

        // The SalaryReviewAnalysis creation date sought for
        // formerly populated from tbCreationDate
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

        public static SalaryReviewAnalysisViewModel Create(IRepository repository)
        {
            Check.Require(repository != null, "Repository must be supplied");

            var viewModel = new SalaryReviewAnalysisViewModel { SalaryReviewAnalysis = new SalaryReviewAnalysis() };

            return viewModel;
        }
    }
}