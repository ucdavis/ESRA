using System.Collections.Generic;
using System.Linq;
using Esra.Core.Domain;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Core.Utils;

namespace Esra.Web.Models
{
    public class EmployeeSalaryComparisonViewModel
    {
        public SalaryScaleViewModel SalaryScaleViewModel { get; set; }

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

            var allDepartment = new Department() { Name = "--Any Department--", DepartmentNumber = "--Any--" };
            var allTitle = new Title() { AbbreviatedName = "--Any Title--", PayrollTitle = "--Any Payroll Title--", TitleCode = "--Any--" };

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

                //DepartmentCodesList = repository.OfType<Department>()
                //    .Queryable
                //    .OrderBy(t => t.DepartmentNumber)
                //    .ThenBy(t => t.SchoolCode)
                //    .ToList(),
                TitlesList = repository.OfType<Title>()
                     .Queryable
                     .OrderBy(t => t.AbbreviatedName)
                     .ToList(),
                //TitleCodesList = repository.OfType<Title>()
                //    .Queryable
                //    .OrderBy(t => t.TitleCode)
                //    .ToList()
                //employeeModel.SelectedDepartments = new List<Department>()
            };

            //viewModel.SelectedDepartmentCodes = new string[] { allDepartment.DepartmentNumber };
            //viewModel.DepartmentsList.Insert(0, allDepartment);
            ////viewModel.DepartmentCodesList.Insert(0, allDepartment);

            //viewModel.SelectedTitleCodes = new string[] { allTitle.TitleCode };
            //viewModel.TitlesList.Insert(0, allTitle);
            ////viewModel.TitleCodesList.Insert(0, allTitle);

            return viewModel;
        }
    }
}