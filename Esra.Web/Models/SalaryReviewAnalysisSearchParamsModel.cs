using System;
using Esra.Core.Domain;
using UCDArch.Core.PersistanceSupport;

namespace Esra.Web.Models
{
    public class SalaryReviewAnalysisSearchParamsModel
    {
        public bool HasCreateDateOnly { get; set; }

        // The SalaryReviewAnalysis creation date sought for
        // formerly populated from tbCreationDate
        //[DataType(DataType.Time)]
        //[DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:d}")]
        //public DateTime CreationDateString { get; set; }
        public String CreationDateString { get; set; }

        public bool HasCreateDate { get; set; }

        public String SelectedReferenceNumber { get; set; }

        public bool HasReferenceNumber { get; set; }

        public Employee SelectedEmployee { get; set; }

        public bool HasEmployee { get; set; }

        public User SelectedUser { get; set; }

        public int SelectedUserId
        {
            get { return SelectedUser.Id; }
        }

        public bool HasUser { get; set; }

        public SalaryReviewAnalysisSearchParamsModel() { }

        public static SalaryReviewAnalysisSearchParamsModel Create(IRepository repository, SalaryReviewAnalysisSearchParamsModel salaryReviewAnalysisSearchParamsModel)
        {
            var viewModel = new SalaryReviewAnalysisSearchParamsModel
                                {
                                    CreationDateString = DateTime.Now.ToShortDateString(),
                                    SelectedEmployee = new Employee(),
                                    SelectedUser = new User(),
                                    SelectedReferenceNumber = String.Empty
                                };

            viewModel.HasCreateDate = (salaryReviewAnalysisSearchParamsModel != null && !String.IsNullOrEmpty(salaryReviewAnalysisSearchParamsModel.CreationDateString) ? true : false);
            viewModel.HasEmployee = (salaryReviewAnalysisSearchParamsModel != null && salaryReviewAnalysisSearchParamsModel.SelectedEmployee != null ? true : false);
            viewModel.HasUser = (salaryReviewAnalysisSearchParamsModel != null && salaryReviewAnalysisSearchParamsModel.SelectedUser != null ? true : false);
            viewModel.HasReferenceNumber = (salaryReviewAnalysisSearchParamsModel != null && !String.IsNullOrEmpty(salaryReviewAnalysisSearchParamsModel.SelectedReferenceNumber) ? true : false);
            viewModel.HasCreateDateOnly = (viewModel.HasCreateDate && !viewModel.HasEmployee && !viewModel.HasUser && !viewModel.HasReferenceNumber ? true : false);

            if (salaryReviewAnalysisSearchParamsModel != null)
            {
                if (viewModel.HasCreateDateOnly)
                {
                    // Get all records; don't add a where clause.
                }
                else
                {
                    if (viewModel.HasCreateDate)
                    {
                        viewModel.CreationDateString = salaryReviewAnalysisSearchParamsModel.CreationDateString;
                    }
                    if (viewModel.HasEmployee)
                    {
                        viewModel.SelectedEmployee = salaryReviewAnalysisSearchParamsModel.SelectedEmployee;
                    }
                    if (viewModel.HasUser)
                    {
                        viewModel.SelectedUser = salaryReviewAnalysisSearchParamsModel.SelectedUser;
                    }
                    if (viewModel.HasReferenceNumber)
                    {
                        viewModel.SelectedReferenceNumber = salaryReviewAnalysisSearchParamsModel.SelectedReferenceNumber;
                    }
                }
            }

            return viewModel;
        }
    }
}