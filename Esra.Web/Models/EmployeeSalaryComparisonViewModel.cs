using System.Collections.Generic;
using System.Linq;
using Esra.Core.Domain;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Core.Utils;

namespace Esra.Web.Models
{
    public class EmployeeSalaryComparisonViewModel : EsraBaseViewModel
    {
        public User User { get; set; }

        public SalaryScaleViewModel SalaryScaleViewModel { get; set; }

        public ESRSearchParameters EsrSearchParameters { get; set; }

        public IList<SalaryScale> SelectedSalaryScales { get; set; }

        public string[] SelectedTitleCodes { get; set; }

        public string[] SelectedDepartmentCodes { get; set; }

        public IList<Department> SelectedDepartments { get; set; }

        public IList<Title> SelectedTitles { get; set; }

        public Employee Employee { get; set; }

        public string SelectedEmployeeId { get; set; }

        public Employee SelectedEmployee { get; set; }

        public IList<Employee> Employees { get; set; }

        public IList<Employee> EmployeesList { get; set; }

        public IList<Department> DepartmentsList { get; set; }

        //public IList<Department> DepartmentCodesList { get; set; }

        public IList<Title> TitlesList { get; set; }

        //public IList<Title> TitleCodesList { get; set; }

        //public static EmployeeSalaryComparisonViewModel Create(IRepository repository)
        //{
        //    return EmployeeSalaryComparisonViewModel.Create(repository, null);
        //}

        public static EmployeeSalaryComparisonViewModel Create(IRepository repository, SalaryScaleViewModel salaryScaleViewModel)
        {
            Check.Require(repository != null, "Repository must be supplied");

            var anyDepartment = new Department() { Name = "Any", DepartmentNumber = "Any" };
            var anyTitle = new Title() { AbbreviatedName = "Any", PayrollTitle = "Any", TitleCode = "Any" };
            var anyEmployee = new Employee() { FullName = "Any", EmployeeID = "0" };

            var viewModel = new EmployeeSalaryComparisonViewModel
                                {
                                    SalaryScaleViewModel = salaryScaleViewModel,

                                    Employee = new Employee(),
                                    EmployeesList = repository.OfType<Employee>()
                                        .Queryable
                                        .OrderBy(t => t.FullName)
                                        .ToList(),

                                    DepartmentsList = repository.OfType<Department>()
                                        .Queryable
                                        .OrderBy(t => t.Name)
                                        .ThenBy(t => t.SchoolCode)
                                        .ToList(),
                                    SelectedDepartments = new List<Department>(),
                                    //DepartmentCodesList = repository.OfType<Department>()
                                    //    .Queryable
                                    //    .OrderBy(t => t.DepartmentNumber)
                                    //    .ThenBy(t => t.SchoolCode)
                                    //    .ToList(),
                                    TitlesList = repository.OfType<Title>()
                                         .Queryable
                                         .OrderBy(t => t.AbbreviatedName)
                                         .ToList(),
                                    SelectedTitles = new List<Title>()
                                    //TitleCodesList = repository.OfType<Title>()
                                    //    .Queryable
                                    //    .OrderBy(t => t.TitleCode)
                                    //    .ToList()
                                    //employeeModel.SelectedDepartments = new List<Department>()
                                };
            viewModel.SelectedEmployee = anyEmployee;
            viewModel.SelectedDepartments.Add(anyDepartment);
            viewModel.SelectedTitles.Add(anyTitle);

            //viewModel.SelectedDepartmentCodes = new string[] { allDepartment.DepartmentNumber };
            //viewModel.DepartmentsList.Insert(0, allDepartment);
            ////viewModel.DepartmentCodesList.Insert(0, allDepartment);

            //viewModel.SelectedTitleCodes = new string[] { allTitle.TitleCode };
            //viewModel.TitlesList.Insert(0, allTitle);
            ////viewModel.TitleCodesList.Insert(0, allTitle););

            return viewModel;
        }
    }
}