using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web.Mvc;
using Esra.Core.Domain;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Core.Utils;

namespace Esra.Web.Controllers
{
    /// <summary>
    /// Controller for the Employee class
    /// </summary>
    public class EmployeeController : ApplicationController
    {
        private readonly IRepository<Employee> _employeeRepository;

        public static readonly string Any = "--Any--";

        public EmployeeController(IRepository<Employee> employeeRepository)
        {
            _employeeRepository = employeeRepository;
        }

        //
        // GET: /Employee/
        public ActionResult Index()
        {
            var employeeModel = EmployeeViewModel.Create(Repository);

            //employeeModel.EmployeesList = Repository.OfType<Employee>()
            //    .Queryable
            //    .OrderBy(t => t.FullName)
            //    .ToList();
            //employeeModel.DepartmentsList = Repository.OfType<Department>()
            //    .Queryable
            //    .OrderBy(t => t.Name)
            //    .ThenBy(t => t.SchoolCode)
            //    .ToList();
            //employeeModel.DepartmentCodesList = Repository.OfType<Department>()
            //    .Queryable
            //    .OrderBy(t => t.DepartmentNumber)
            //    .ThenBy(t => t.SchoolCode)
            //    .ToList();
            //employeeModel.TitlesList = Repository.OfType<Title>()
            //    .Queryable
            //    .OrderBy(t => t.AbbreviatedName)
            //    .ToList();
            //employeeModel.TitleCodesList = Repository.OfType<Title>()
            //    .Queryable
            //    .OrderBy(t => t.TitleCode)
            //    .ToList();
            ////employeeModel.SelectedDepartments = new List<Department>()

            return View(employeeModel);
        }

        //
        // GET: /Employee/Details/5
        public ActionResult Details(string[] selectedTitleCodes, string[] selectedDepartmentCodes)
        {
            var employeeModel = EmployeeViewModel.Create(Repository);

            bool isAnyTitleCode = QueryBuilderHelper.IsAny(selectedTitleCodes);
            bool isAnyDepartmentCode = QueryBuilderHelper.IsAny(selectedDepartmentCodes);

            employeeModel.SelectedTitleCodes = selectedTitleCodes;
            employeeModel.SelectedDepartmentCodes = selectedDepartmentCodes;

            //employeeModel.Employees = _employeeRepository.Queryable
            //    .Where(r => selectedTitleCodes.Contains(r.TitleCode) && selectedDepartmentCodes.Contains(r.HomeDepartmentID))
            //    .OrderBy(r => r.FullName).ThenBy(r => r.HomeDepartment)
            //    .ToList();

            if (isAnyTitleCode == false && isAnyDepartmentCode == false)
            {
                employeeModel.Employees = _employeeRepository.Queryable.Where(r => selectedTitleCodes.Contains(r.TitleCode) && selectedDepartmentCodes.Contains(r.HomeDepartmentID))
                    .OrderBy(r => r.FullName).ThenBy(r => r.HomeDepartment).ToList();
            }
            else if (isAnyTitleCode == false)
            {
                employeeModel.Employees = _employeeRepository.Queryable.Where(r => selectedTitleCodes.Contains(r.TitleCode))
                    .OrderBy(r => r.FullName).ThenBy(r => r.HomeDepartment).ToList();
            }
            else if (isAnyDepartmentCode == false)
            {
                employeeModel.Employees = _employeeRepository.Queryable.Where(r => selectedDepartmentCodes.Contains(r.HomeDepartmentID))
                    .OrderBy(r => r.FullName).ThenBy(r => r.HomeDepartment).ToList();
            }

            //if (employee == null) return RedirectToAction("Index");

            return View(employeeModel);
        }

        //
        // GET: /Employee/Create
        public ActionResult Create()
        {
            var viewModel = EmployeeViewModel.Create(Repository);

            return View(viewModel);
        }

        //
        // POST: /Employee/Create
        [HttpPost]
        public ActionResult Create(Employee employee)
        {
            var employeeToCreate = new Employee();

            TransferValues(employee, employeeToCreate);

            if (ModelState.IsValid)
            {
                _employeeRepository.EnsurePersistent(employeeToCreate);

                Message = "Employee Created Successfully";

                return RedirectToAction("Index");
            }
            else
            {
                var viewModel = EmployeeViewModel.Create(Repository);
                viewModel.Employee = employee;

                return View(viewModel);
            }
        }

        //
        // GET: /Employee/Edit/5
        public ActionResult Edit(int id)
        {
            var employee = _employeeRepository.GetNullableById(id);

            if (employee == null) return RedirectToAction("Index");

            var viewModel = EmployeeViewModel.Create(Repository);
            viewModel.Employee = employee;

            return View(viewModel);
        }

        //
        // POST: /Employee/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, Employee employee)
        {
            var employeeToEdit = _employeeRepository.GetNullableById(id);

            if (employeeToEdit == null) return RedirectToAction("Index");

            TransferValues(employee, employeeToEdit);

            if (ModelState.IsValid)
            {
                _employeeRepository.EnsurePersistent(employeeToEdit);

                Message = "Employee Edited Successfully";

                return RedirectToAction("Index");
            }
            else
            {
                var viewModel = EmployeeViewModel.Create(Repository);
                viewModel.Employee = employee;

                return View(viewModel);
            }
        }

        //
        // GET: /Employee/Delete/5
        public ActionResult Delete(int id)
        {
            var employee = _employeeRepository.GetNullableById(id);

            if (employee == null) return RedirectToAction("Index");

            return View(employee);
        }

        //
        // POST: /Employee/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, Employee employee)
        {
            var employeeToDelete = _employeeRepository.GetNullableById(id);

            if (employeeToDelete == null) return RedirectToAction("Index");

            _employeeRepository.Remove(employeeToDelete);

            Message = "Employee Removed Successfully";

            return RedirectToAction("Index");
        }

        /// <summary>
        /// Transfer editable values from source to destination
        /// </summary>
        private static void TransferValues(Employee source, Employee destination)
        {
            //Recommendation: Use AutoMapper
            //Mapper.Map(source, destination)
            throw new NotImplementedException();
        }
    }

    /// <summary>
    /// ViewModel for the Employee class
    /// </summary>
    public class EmployeeViewModel
    {
        public IList<SalaryScale> SelectedSalaryScales { get; set; }

        public string[] SelectedTitleCodes { get; set; }

        public string[] SelectedDepartmentCodes { get; set; }

        public IList<Department> SelectedDepartments { get; set; }

        public IList<Title> SelectedTitles { get; set; }

        public Employee Employee { get; set; }

        public Employee SelectedEmployee { get; set; }

        public IList<Employee> Employees { get; set; }

        public IList<Employee> EmployeesList { get; set; }

        public IList<Department> DepartmentsList { get; set; }

        public IList<Department> DepartmentCodesList { get; set; }

        public IList<Title> TitlesList { get; set; }

        public IList<Title> TitleCodesList { get; set; }

        public static EmployeeViewModel Create(IRepository repository)
        {
            Check.Require(repository != null, "Repository must be supplied");

            var allDepartment = new Department() { Name = "--Any Department--", DepartmentNumber = "--Any--" };
            var allTitle = new Title() { AbbreviatedName = "--Any Title--", PayrollTitle = "--Any Payroll Title--", TitleCode = "--Any--" };

            var viewModel = new EmployeeViewModel
            {
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

                DepartmentCodesList = repository.OfType<Department>()
                    .Queryable
                    .OrderBy(t => t.DepartmentNumber)
                    .ThenBy(t => t.SchoolCode)
                    .ToList(),
                TitlesList = repository.OfType<Title>()
                     .Queryable
                     .OrderBy(t => t.AbbreviatedName)
                     .ToList(),
                TitleCodesList = repository.OfType<Title>()
                    .Queryable
                    .OrderBy(t => t.TitleCode)
                    .ToList()
                //employeeModel.SelectedDepartments = new List<Department>()
            };

            viewModel.SelectedDepartmentCodes = new string[] { allDepartment.DepartmentNumber };
            viewModel.DepartmentsList.Insert(0, allDepartment);
            //viewModel.DepartmentCodesList.Insert(0, allDepartment);

            viewModel.SelectedTitleCodes = new string[] { allTitle.TitleCode };
            viewModel.TitlesList.Insert(0, allTitle);
            //viewModel.TitleCodesList.Insert(0, allTitle);

            return viewModel;
        }
    }

    public static class QueryBuilderHelper
    {
        public static readonly string Any = "--Any--";

        public static bool IsAny(string[] selections)
        {
            var retval = false;

            if (selections != null)
            {
                if (selections.Count() == 1 && selections.Contains(Any))
                {
                    retval = true;
                }
            }
            return retval;
        }
    }

    public static class PredicateBuilder
    {
        public static Expression<Func<T, bool>> True<T>() { return f => true; }

        public static Expression<Func<T, bool>> False<T>() { return f => false; }

        public static Expression<Func<T, bool>> Or<T>(this Expression<Func<T, bool>> expr1,
                                  Expression<Func<T, bool>> expr2)
        {
            var invokedExpr = Expression.Invoke(expr2, expr1.Parameters.Cast<Expression>());
            return Expression.Lambda<Func<T, bool>>
               (Expression.OrElse(expr1.Body, invokedExpr), expr1.Parameters);
        }

        public static Expression<Func<T, bool>> And<T>(this Expression<Func<T, bool>> expr1,
                                   Expression<Func<T, bool>> expr2)
        {
            var invokedExpr = Expression.Invoke(expr2, expr1.Parameters.Cast<Expression>());
            return Expression.Lambda<Func<T, bool>>
               (Expression.AndAlso(expr1.Body, invokedExpr), expr1.Parameters);
        }
    }
}