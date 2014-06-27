using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Esra.Core.Domain;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Core.Utils;

namespace Esra.Web.Models
{
    public class EmployeeSalaryComparisonViewModel : EsraBaseViewModel
    {
        public System.Linq.Expressions.Expression<Func<Employee, bool>> EmployeeSalaryComparisonSearchExpression { get; set; }

        public string SortPropertyName { get; set; }

        public bool IsAscending { get; set; }

        public User User { get; set; }

        public SalaryScaleViewModel SalaryScaleViewModel { get; set; }

        public ESRSearchParameters EsrSearchParameters { get; set; }

        public IList<SalaryScale> SelectedSalaryScales { get; set; }

        public string SelectedTitleCodesString { get; set; }

        public string SelectedTitleCodes { get; set; }

        public string SelectedDepartmentCodesString { get; set; }

        public string SelectedDepartmentCodes { get; set; }

        public IList<Department> SelectedDepartments { get; set; }

        public IList<Title> SelectedTitles { get; set; }

        public Employee Employee { get; set; }

        public string SelectedEmployeeId { get; set; }

        public Employee SelectedEmployee { get; set; }

        public IList<Employee> Employees { get; set; }

        /// <summary>
        /// A list of ALL employees in the user's school(s).
        /// </summary>
        public IList<Employee> AllSchoolEmployees { get; set; }

        public IList<Employee> EmployeesList { get; set; }

        public IList<Department> DepartmentsList { get; set; }

        //public IList<Department> DepartmentCodesList { get; set; }

        public IList<Title> TitlesList { get; set; }

        //public IList<Title> TitleCodesList { get; set; }

        //public static EmployeeSalaryComparisonViewModel Create(IRepository repository)
        //{
        //    return EmployeeSalaryComparisonViewModel.Create(repository, null);
        //}

        public static EmployeeSalaryComparisonViewModel Create(IRepository repository, User user, bool isDepartmentUser, SalaryScaleViewModel salaryScaleViewModel)
        {
            Check.Require(repository != null, "Repository must be supplied");

            var anyDepartment = new Department() { Name = "Any", DepartmentNumber = "Any" };
            var anyTitle = new Title() { AbbreviatedName = "Any", PayrollTitle = "Any", TitleCode = "Any" };
            var anyEmployee = new Employee() { FullName = "Any", EmployeeID = "0" };

            if (salaryScaleViewModel == null) salaryScaleViewModel = Models.SalaryScaleViewModel.Create(repository);

            var viewModel = new EmployeeSalaryComparisonViewModel
                                {
                                    IsDepartmentUser = isDepartmentUser,
                                    SalaryScaleViewModel = salaryScaleViewModel,
                                    Employee = new Employee(),
                                    Employees = new List<Employee>(),
                                    SelectedDepartments = new List<Department>(),
                                    SelectedTitles = new List<Title>(),
                                    SelectedDepartmentCodesString = string.Empty,
                                    SelectedTitleCodesString = string.Empty,
                                    SelectedEmployee = anyEmployee,
                                    SelectedEmployeeId = string.Empty
                                };

            if (salaryScaleViewModel.Titles.Count == 0)
            {
                viewModel.TitlesList = repository.OfType<Title>()
                    .Queryable
                    .OrderBy(t => t.TitleCode)
                    .ToList();
            }
            else
            {
                viewModel.TitlesList = salaryScaleViewModel.Titles;
            }

            if (user == null) user = Core.Domain.User.GetByLoginId(repository, HttpContext.Current.User.Identity.Name);
            viewModel.User = user;

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
            viewModel.DepartmentsList = usersDepartmentsList;

            // This will return a list of employees with their IsDepartmentEmployee set appropriately if isDepartmentUser == true.
            var allSchoolEmployees = Employee.GetAllForEmployeeTable(repository, user, isDepartmentUser, "FullName", true, null, null, allSchoolDepartments.Select(x => x.Id).ToArray());

            //var allSchoolEmployees = SchoolEmployees.GetAllForSchoolCodes(repository,
            //                                                             allSchoolDepartments.Select(
            //                                                                 x => x.DeansOfficeSchoolCode).Distinct().
            //                                                                 ToArray());
            viewModel.AllSchoolEmployees = allSchoolEmployees;

            // Assign only those with IsDepartmentEmployee == true to Employees select list or ALL school employees is non-department user, i.e. deans office.
            viewModel.EmployeesList = isDepartmentUser ? allSchoolEmployees.Where(x => x.IsDepartmentEmployee == true).ToList() : allSchoolEmployees;

            viewModel.SelectedDepartments.Add(anyDepartment);
            viewModel.SelectedTitles.Add(anyTitle);

            return viewModel;
        }

        //public static EmployeeSalaryComparisonViewModel Create(IRepository repository, SalaryScaleViewModel salaryScaleViewModel)
        //{
        //    Check.Require(repository != null, "Repository must be supplied");

        //    var anyDepartment = new Department() { Name = "Any", DepartmentNumber = "Any" };
        //    var anyTitle = new Title() { AbbreviatedName = "Any", PayrollTitle = "Any", TitleCode = "Any" };
        //    var anyEmployee = new Employee() { FullName = "Any", EmployeeID = "0" };

        //    var viewModel = new EmployeeSalaryComparisonViewModel
        //                        {
        //                            SalaryScaleViewModel = salaryScaleViewModel,
        //                            Employee = new Employee(),
        //                            //EmployeesList = repository.OfType<Employee>()
        //                            //    .Queryable
        //                            //    .OrderBy(t => t.FullName)
        //                            //    .ToList(),

        //                            EmployeesList = new List<Employee>(),
        //                            //DepartmentsList = repository.OfType<Department>()
        //                            //    .Queryable
        //                            //    .OrderBy(t => t.Name)
        //                            //    .ThenBy(t => t.SchoolCode)
        //                            //    .ToList(),
        //                            DepartmentsList = new List<Department>(),
        //                            SelectedDepartments = new List<Department>(),
        //                            //DepartmentCodesList = repository.OfType<Department>()
        //                            //    .Queryable
        //                            //    .OrderBy(t => t.DepartmentNumber)
        //                            //    .ThenBy(t => t.SchoolCode)
        //                            //    .ToList(),
        //                            //TitlesList = repository.OfType<Title>()
        //                            //    .Queryable
        //                            //    .OrderBy(t => t.AbbreviatedName)
        //                            //    .ToList(),
        //                            SelectedTitles = new List<Title>(),
        //                            //TitleCodesList = repository.OfType<Title>()
        //                            //    .Queryable
        //                            //    .OrderBy(t => t.TitleCode)
        //                            //    .ToList()
        //                            //employeeModel.SelectedDepartments = new List<Department>()
        //                            SelectedDepartmentCodesString = string.Empty,
        //                            SelectedTitleCodesString = string.Empty,
        //                            SelectedEmployee = anyEmployee,
        //                            SelectedEmployeeId = string.Empty
        //                        };

        //    if (salaryScaleViewModel == null)
        //    {
        //        viewModel.TitlesList = repository.OfType<Title>()
        //            .Queryable
        //            .OrderBy(t => t.TitleCode)
        //            .ToList();
        //    }
        //    else
        //    {
        //        viewModel.TitlesList = salaryScaleViewModel.Titles;
        //    }

        //    viewModel.SelectedDepartments.Add(anyDepartment);
        //    viewModel.SelectedTitles.Add(anyTitle);

        //    //viewModel.SelectedDepartmentCodes = new string[] { allDepartment.DepartmentNumber };
        //    //viewModel.DepartmentsList.Insert(0, allDepartment);
        //    ////viewModel.DepartmentCodesList.Insert(0, allDepartment);

        //    //viewModel.SelectedTitleCodes = new string[] { allTitle.TitleCode };
        //    //viewModel.TitlesList.Insert(0, allTitle);
        //    ////viewModel.TitleCodesList.Insert(0, allTitle););

        //    return viewModel;
        //}
    }
}