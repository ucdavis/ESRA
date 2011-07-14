using System;
using System.Linq;
using System.Linq.Expressions;
using Esra.Core.Domain;
using Esra.Web.Controllers;
using UCDArch.Core.PersistanceSupport;

namespace Esra.Web.Models
{
    public class SalaryReviewAnalysisSearchParamsModel
    {
        public Expression<Func<SalaryReviewAnalysis, bool>> SalaryReviewAnalysisSearchExpression { get; set; }

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

        public bool HasEmployeeId { get; set; }

        public User SelectedUser { get; set; }

        public int? SelectedUserId { get; set; }

        public bool HasUser { get; set; }

        public bool HasUserId { get; set; }

        public string SelectedEmployeeId { get; set; }

        public SalaryReviewAnalysisSearchParamsModel() { }

        public static SalaryReviewAnalysisSearchParamsModel Create(IRepository repository, SalaryReviewAnalysisSearchParamsModel salaryReviewAnalysisSearchParamsModel)
        {
            var viewModel = new SalaryReviewAnalysisSearchParamsModel
                                {
                                    CreationDateString = DateTime.Now.ToShortDateString(),
                                    SelectedEmployee = new Employee(),
                                    SelectedUser = new User(),
                                    SelectedReferenceNumber = String.Empty,
                                    SalaryReviewAnalysisSearchExpression = null, // Initially set to null to get all records; don't add a where clause.
                                    HasCreateDateOnly = true,   // assume only today's date present in parameters.
                                    HasCreateDate = false,
                                    HasEmployee = false,
                                    HasEmployeeId = false,
                                    HasUser = false,
                                    HasUserId = false,
                                    HasReferenceNumber = false
                                };

            if (salaryReviewAnalysisSearchParamsModel != null)
            {
                viewModel.SalaryReviewAnalysisSearchExpression = PredicateBuilder.True<SalaryReviewAnalysis>();

                if (salaryReviewAnalysisSearchParamsModel.SelectedEmployee != null && String.IsNullOrEmpty(salaryReviewAnalysisSearchParamsModel.SelectedEmployee.id) == false)
                {
                    viewModel.SelectedEmployee = salaryReviewAnalysisSearchParamsModel.SelectedEmployee;
                    viewModel.HasEmployee = true;
                    viewModel.HasCreateDateOnly = false;

                    viewModel.SalaryReviewAnalysisSearchExpression =
                            viewModel.SalaryReviewAnalysisSearchExpression.And(
                                p => p.Employee.PkEmployee.Equals(viewModel.SelectedEmployee.id));
                }

                if (String.IsNullOrEmpty(salaryReviewAnalysisSearchParamsModel.SelectedEmployeeId) == false)
                {
                    viewModel.SelectedEmployeeId = salaryReviewAnalysisSearchParamsModel.SelectedEmployeeId;
                    viewModel.HasEmployeeId = true;
                    viewModel.HasCreateDateOnly = false;

                    viewModel.SelectedEmployee = repository.OfType<Employee>()
                            .Queryable.Where(r => r.id == viewModel.SelectedEmployeeId)
                            .FirstOrDefault();

                    viewModel.SalaryReviewAnalysisSearchExpression =
                        viewModel.SalaryReviewAnalysisSearchExpression.And(
                            p => p.Employee.PkEmployee.Equals(viewModel.SelectedEmployeeId));
                }

                if (salaryReviewAnalysisSearchParamsModel.SelectedUser != null && salaryReviewAnalysisSearchParamsModel.SelectedUser.Id != 0)
                {
                    viewModel.SelectedUser = salaryReviewAnalysisSearchParamsModel.SelectedUser;
                    viewModel.HasUser = true;
                    viewModel.HasCreateDateOnly = false;

                    viewModel.SalaryReviewAnalysisSearchExpression =
                           viewModel.SalaryReviewAnalysisSearchExpression.And(
                               p => p.InitiatedByReviewerName.Equals(viewModel.SelectedUser.FullName));
                }

                if (salaryReviewAnalysisSearchParamsModel.SelectedUserId != null && salaryReviewAnalysisSearchParamsModel.SelectedUserId != 0)
                {
                    viewModel.SelectedUserId = salaryReviewAnalysisSearchParamsModel.SelectedUserId;
                    viewModel.HasUserId = true;
                    viewModel.HasCreateDateOnly = false;

                    viewModel.SelectedUser = repository.OfType<User>()
                            .Queryable.Where(r => r.Id == viewModel.SelectedUserId)
                            .FirstOrDefault();

                    viewModel.SalaryReviewAnalysisSearchExpression =
                           viewModel.SalaryReviewAnalysisSearchExpression.And(
                               p => p.InitiatedByReviewerName.Equals(viewModel.SelectedUser.FullName));
                }

                if (!String.IsNullOrEmpty(salaryReviewAnalysisSearchParamsModel.SelectedReferenceNumber))
                {
                    viewModel.SelectedReferenceNumber = salaryReviewAnalysisSearchParamsModel.SelectedReferenceNumber;
                    viewModel.HasReferenceNumber = true;
                    viewModel.HasCreateDateOnly = false;

                    viewModel.SalaryReviewAnalysisSearchExpression =
                          viewModel.SalaryReviewAnalysisSearchExpression.And(
                              p => p.ReferenceNumber.Equals(viewModel.SelectedReferenceNumber));
                }

                if (!String.IsNullOrEmpty(salaryReviewAnalysisSearchParamsModel.CreationDateString))
                {
                    // if createDate != today then true
                    var createDate = new DateTime();

                    if (DateTime.TryParse(salaryReviewAnalysisSearchParamsModel.CreationDateString, out createDate))
                    {
                        viewModel.CreationDateString = createDate.ToString("MM/dd/yyyy");
                    }

                    if (String.IsNullOrEmpty(viewModel.CreationDateString) == false && DateTime.Now.ToString("MM/dd/yyyy").Equals(viewModel.CreationDateString) == false)
                    {
                        viewModel.HasCreateDate = true;

                        createDate = Convert.ToDateTime(viewModel.CreationDateString);

                        viewModel.SalaryReviewAnalysisSearchExpression = viewModel.SalaryReviewAnalysisSearchExpression.And(p => p.DateInitiated == createDate);
                    }
                }
            }

            return viewModel;
        }
    }
}