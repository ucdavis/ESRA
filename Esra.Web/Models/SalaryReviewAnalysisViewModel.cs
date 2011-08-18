using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
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

        public Expression<Func<SalaryReviewAnalysis, bool>> SalaryReviewAnalysisSearchExpression { get; set; }

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
                                    SalaryReviewAnalysisSearchExpression =
                                        salaryReviewAnalysisSearchParamsModel.SalaryReviewAnalysisSearchExpression,

                                    SalaryReviewAnalysis = new SalaryReviewAnalysis(),

                                    IsDepartmentUser = isDepartmentUser,

                                    FilteredEmployees = new List<Employee>(),

                                    FilteredUsers = User.GetAll(repository, user, isDepartmentUser),

                                    ProposedTitles = repository.OfType<Title>()
                                    .Queryable
                                    .OrderBy(t => t.TitleCode)
                                    .ToList()
                                };

            var allSchoolDepartments = Department.GetAllForUser(repository, user, false, "Name", true);
            IList<Department> usersDepartmentsList;
            if (isDepartmentUser)
            {
                var usersUnits = user.Units.Select(u => u.PPSCode).ToArray();

                usersDepartmentsList = allSchoolDepartments
                    .Where(x => usersUnits.Contains(x.Id))
                    .ToList();
            }
            else
            {
                usersDepartmentsList = allSchoolDepartments;
            }

            // This will return a list of employees with their IsDepartmentEmployee set appropriately if isDepartmentUser == true.
            var allSchoolEmployees = Employee.GetAllForEmployeeTable(repository, user, isDepartmentUser, "FullName", true, null, null, allSchoolDepartments.Select(x => x.Id).ToArray());

            // Assign only those with IsDepartmentEmployee == true to Employees select list or ALL school employees is non-department user, i.e. deans office.
            viewModel.FilteredEmployees = isDepartmentUser ? allSchoolEmployees.Where(x => x.IsDepartmentEmployee == true).ToList() : allSchoolEmployees;

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
            var searchParamsModel = viewModel.SalaryReviewAnalysisSearchParamsModel;

            if (searchParamsModel.SalaryReviewAnalysisSearchExpression == null
               || (searchParamsModel.HasCreateDateOnly && !searchParamsModel.HasCreateDate))
            {
                // Load all based on viewModel.FilteredSalaryReviewAnalysis reference numbers:
                var referenceNumbers = viewModel.FilteredSalaryReviewAnalysis.Select(x => x.ReferenceNumber).ToArray();

                //TODO: Figure out how to make this a Linq query that does an inner join instead calling the db SELECT N+1 times:  FIXED by adding .Fetch(y => y.Employee) and container.Register(Component.For<IQueryExtensionProvider>().ImplementedBy<NHibernateQueryExtensionProvider>().Named("queryExtensions")); to the ComponentRegstrar class.

                viewModel.SalaryReviewAnalysisResults = repository.OfType<SalaryReviewAnalysis>()
                    .Queryable.Fetch(y => y.Employee)
                    .Where(x => referenceNumbers.Contains(x.ReferenceNumber))
                    .OrderBy(t => t.Employee.FullName)
                    .ToList();

                //// This does an inner join with SRAEmployee and does NOT call the database N+1 times:
                //var criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(typeof(SalaryReviewAnalysis));
                //var conjunction = Restrictions.Conjunction();
                //criteria.CreateAlias("Employee", "Employee")
                //    .AddOrder(Order.Asc("Employee.LastName")).AddOrder(Order.Asc("Employee.FirstName"))
                //    .SetFetchMode("Employee", FetchMode.Eager);
                //conjunction.Add(Restrictions.In("ReferenceNumber", referenceNumbers));

                //viewModel.SalaryReviewAnalysisResults = criteria.List<SalaryReviewAnalysis>().ToList();
            }
            else
            {
                // Load all based on search criteria:
                // This one call the database N+1 times, once for each analysis returned.
                //viewModel.SalaryReviewAnalysisResults = repository.OfType<SalaryReviewAnalysis>()
                //    .Queryable
                //    .Where(viewModel.SalaryReviewAnalysisSearchParamsModel.SalaryReviewAnalysisSearchExpression)
                //    .OrderBy(t => t.Employee.FullName)
                //    .ToList();

                viewModel.SalaryReviewAnalysisResults = repository.OfType<SalaryReviewAnalysis>()
                                                            .Queryable.Fetch(x => x.Employee)
                                                            .Where(viewModel.SalaryReviewAnalysisSearchParamsModel.SalaryReviewAnalysisSearchExpression)
                                                            .OrderBy(t => t.Employee.FullName)
                                                            .ToList();
            }

            return viewModel;
        }
    }
}