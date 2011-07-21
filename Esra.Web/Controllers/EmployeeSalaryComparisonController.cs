using System;
using System.Linq;
using System.Linq.Expressions;
using System.Web.Mvc;
using Esra.Core.Domain;
using Esra.Web.Models;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Web.Attributes;

namespace Esra.Web.Controllers
{
    /// <summary>
    /// Controller for the Employee Comparison class
    /// </summary>
    public class EmployeeSalaryComparisonController : ApplicationController
    {
        private readonly IRepositoryWithTypedId<Employee, string> _employeeRepository;
        private readonly IRepository<SalaryScale> _salaryScaleRepository;

        public static readonly string Any = "Any";

        public EmployeeSalaryComparisonController(IRepositoryWithTypedId<Employee,string> employeeRepository, IRepository<SalaryScale> salayScaleRepository)
        {
            _employeeRepository = employeeRepository;
            _salaryScaleRepository = salayScaleRepository;
        }

        //
        // GET: /EmployeeSalaryComparison/
        public ActionResult Index()
        {
            var employeeSalaryComparisonModel = Models.EmployeeSalaryComparisonViewModel.Create(Repository, null);
            employeeSalaryComparisonModel.User =
                Repository.OfType<User>().Queryable
                .Where(u => u.LoginID == CurrentUser.Identity.Name).FirstOrDefault();

            return View(employeeSalaryComparisonModel);
        }

        //
        // GET: /EmployeeSalaryComparison/Details
        public ActionResult Details(string[] selectedTitleCodes, string[] selectedDepartmentCodes, string selectedEmployeeId)
        {
            // var salaryScaleViewModel = SalaryScaleViewModel.Create(Repository);
            var employeeSalaryComparisonModel = EmployeeSalaryComparisonViewModel.Create(Repository, SalaryScaleViewModel.Create(Repository));

            bool isAnyTitle = true;
            bool isAnyDepartment = true;
            bool isAnyEmployee = true;

            //employeeModel.SelectedTitleCodes = selectedTitleCodes;
            //employeeModel.SelectedDepartmentCodes = selectedDepartmentCodes;
            // employeeModel.SelectedEmployeeId = selectedEmployeeId;

            //employeeModel.Employees = _employeeRepository.Queryable
            //    .Where(r => selectedTitleCodes.Contains(r.TitleCode) && selectedDepartmentCodes.Contains(r.HomeDepartmentID))
            //    .OrderBy(r => r.FullName).ThenBy(r => r.HomeDepartment)
            //    .ToList();

            if (selectedEmployeeId != null && !selectedEmployeeId.Equals(String.Empty))
            {
                // get the employee by employee ID:
                employeeSalaryComparisonModel.Employees = _employeeRepository.Queryable.Where(r => selectedEmployeeId.Equals(r.EmployeeID))
                   .OrderBy(r => r.FullName).ThenBy(r => r.HomeDepartment.Name).ToList();
                isAnyEmployee = false;
            }
            // if both are null; get them all
            else if ((selectedDepartmentCodes == null || selectedDepartmentCodes.Count() == 0 || (selectedDepartmentCodes.Count() == 1 && selectedDepartmentCodes[0].Equals(String.Empty))) && (selectedTitleCodes == null || selectedTitleCodes.Count() == 0 || (selectedTitleCodes.Count() == 1 && selectedTitleCodes[0].Equals(String.Empty))))
            {
                // get all records:
                employeeSalaryComparisonModel.Employees = _employeeRepository.Queryable
                    .OrderBy(r => r.FullName).ThenBy(r => r.HomeDepartment.Name).ToList();
            }
            else if ((selectedDepartmentCodes != null && selectedDepartmentCodes.Count() > 0 && !selectedDepartmentCodes[0].Equals(String.Empty)) &&
                (selectedTitleCodes == null || selectedTitleCodes.Count() == 0 || (selectedTitleCodes.Count() == 1 && selectedTitleCodes[0].Equals(String.Empty))))
            {
                // get those with matching department codes:
                employeeSalaryComparisonModel.Employees = _employeeRepository.Queryable.Where(r => selectedDepartmentCodes.Contains(r.HomeDepartmentID))
                   .OrderBy(r => r.FullName).ThenBy(r => r.HomeDepartment.Name).ToList();
                isAnyDepartment = false;
            }
            else if ((selectedTitleCodes != null && selectedTitleCodes.Count() > 0 && !selectedTitleCodes[0].Equals(String.Empty)) &&
            (selectedDepartmentCodes == null || selectedDepartmentCodes.Count() == 0 || (selectedDepartmentCodes.Count() == 1 && selectedDepartmentCodes[0].Equals(String.Empty))))
            {
                // get those with matching title codes:
                employeeSalaryComparisonModel.Employees =
                    _employeeRepository.Queryable.Where(r => selectedTitleCodes.Contains(r.TitleCode))
                        .OrderBy(r => r.FullName).ThenBy(r => r.HomeDepartment.Name).ToList();

                var salaryScales = _salaryScaleRepository
                    .Queryable.Where(r => selectedTitleCodes.Contains(r.TitleCode)).ToList();

                if (salaryScales.Count == 1)
                {
                    var salaryScale = salaryScales[0];
                    salaryScale.SalarySteps = Repository.OfType<SalaryStep>()
                        .Queryable
                        .Where(s => s.TitleCode == salaryScale.TitleCode && s.EffectiveDate == salaryScale.EffectiveDate)
                        .ToList();

                    employeeSalaryComparisonModel.SalaryScaleViewModel.SalaryScale = salaryScale;
                }
                isAnyTitle = false;
            }
            else
            {
                // get those with matching department and title codes:
                employeeSalaryComparisonModel.Employees =
                    _employeeRepository.Queryable.Where(
                    r => selectedTitleCodes.Contains(r.TitleCode) &&
                    selectedDepartmentCodes.Contains(r.HomeDepartmentID))
                        .OrderBy(r => r.FullName).ThenBy(r => r.HomeDepartment.Name).ToList();

                var salaryScales = _salaryScaleRepository
                    .Queryable.Where(r => selectedTitleCodes.Contains(r.TitleCode)).ToList();

                if (salaryScales.Count == 1)
                {
                    var salaryScale = salaryScales[0];
                    salaryScale.SalarySteps = Repository.OfType<SalaryStep>()
                        .Queryable
                        .Where(s => s.TitleCode == salaryScale.TitleCode && s.EffectiveDate == salaryScale.EffectiveDate)
                        .ToList();

                    employeeSalaryComparisonModel.SalaryScaleViewModel.SalaryScale = salaryScale;
                }
                isAnyDepartment = false;
                isAnyTitle = false;
            }

            // Logic for initializing ESR Search Parameters:
            employeeSalaryComparisonModel.EsrSearchParameters = new ESRSearchParameters()
            {
                SearchEmployee = employeeSalaryComparisonModel.SelectedEmployee,
                SearchTitles = employeeSalaryComparisonModel.SelectedTitles.ToList(),
                SearchDepartments = employeeSalaryComparisonModel.SelectedDepartments.ToList()
            };
            if (!isAnyEmployee)
            {
                employeeSalaryComparisonModel.SelectedEmployee = employeeSalaryComparisonModel.EmployeesList.Where(
                    r => selectedEmployeeId.Equals(r.EmployeeID)).FirstOrDefault();
                employeeSalaryComparisonModel.EsrSearchParameters.SearchEmployee =
                    employeeSalaryComparisonModel.SelectedEmployee;
            }
            if (!isAnyDepartment)
            {
                employeeSalaryComparisonModel.SelectedDepartments =
                    employeeSalaryComparisonModel.DepartmentsList.Where(
                        r => selectedDepartmentCodes.Contains(r.DepartmentNumber)).OrderBy(r => r.Name).ToList();
                employeeSalaryComparisonModel.EsrSearchParameters.SearchDepartments =
                    employeeSalaryComparisonModel.SelectedDepartments.ToList();
            }
            if (!isAnyTitle)
            {
                employeeSalaryComparisonModel.SelectedTitles =
                    employeeSalaryComparisonModel.TitlesList.Where(
                        r => selectedTitleCodes.Contains(r.TitleCode)).OrderBy(r => r.AbbreviatedName).ToList();
                employeeSalaryComparisonModel.EsrSearchParameters.SearchTitles =
                    employeeSalaryComparisonModel.SelectedTitles.ToList();
            }

            //employeeSalaryComparisonModel.EsrSearchParameters = new ESRSearchParameters();
            //{
            //    SearchEmployee =
            //        employeeSalaryComparisonModel.
            //        SelectedEmployee,
            //    SearchTitles =
            //        employeeSalaryComparisonModel.SelectedTitles.ToList(),
            //    SearchDepartments =
            //        employeeSalaryComparisonModel.
            //        SelectedDepartments.ToList()
            //};

            //if (isAnyTitleCode == false && isAnyDepartmentCode == false)
            //{
            //    employeeModel.Employees = _employeeRepository.Queryable.Where(r => selectedTitleCodes.Contains(r.TitleCode) && selectedDepartmentCodes.Contains(r.HomeDepartmentID))
            //        .OrderBy(r => r.FullName).ThenBy(r => r.HomeDepartment).ToList();
            //}
            //else if (isAnyTitleCode == false)
            //{
            //    employeeModel.Employees = _employeeRepository.Queryable.Where(r => selectedTitleCodes.Contains(r.TitleCode))
            //        .OrderBy(r => r.FullName).ThenBy(r => r.HomeDepartment).ToList();
            //}
            //else if (isAnyDepartmentCode == false)
            //{
            //    employeeModel.Employees = _employeeRepository.Queryable.Where(r => selectedDepartmentCodes.Contains(r.HomeDepartmentID))
            //        .OrderBy(r => r.FullName).ThenBy(r => r.HomeDepartment).ToList();
            //}

            //if (employee == null) return RedirectToAction("Index");

            return View(employeeSalaryComparisonModel);
        }

        ////
        //// GET: /Employee/Create
        //public ActionResult Create()
        //{
        //    var viewModel = EmployeeSalaryComparisonViewModel.Create(Repository);

        //    return View(viewModel);
        //}

        ////
        //// POST: /Employee/Create
        //[HttpPost]
        //public ActionResult Create(Employee employee)
        //{
        //    var employeeToCreate = new Employee();

        //    TransferValues(employee, employeeToCreate);

        //    if (ModelState.IsValid)
        //    {
        //        _employeeRepository.EnsurePersistent(employeeToCreate);

        //        Message = "Employee Created Successfully";

        //        return RedirectToAction("Index");
        //    }
        //    else
        //    {
        //        var viewModel = EmployeeSalaryComparisonViewModel.Create(Repository);
        //        viewModel.Employee = employee;

        //        return View(viewModel);
        //    }
        //}

        ////
        //// GET: /Employee/Edit/5
        //public ActionResult Edit(int id)
        //{
        //    var employee = _employeeRepository.GetNullableById(id);

        //    if (employee == null) return RedirectToAction("Index");

        //    var viewModel = EmployeeSalaryComparisonViewModel.Create(Repository);
        //    viewModel.Employee = employee;

        //    return View(viewModel);
        //}

        ////
        //// POST: /Employee/Edit/5
        //[HttpPost]
        //public ActionResult Edit(int id, Employee employee)
        //{
        //    var employeeToEdit = _employeeRepository.GetNullableById(id);

        //    if (employeeToEdit == null) return RedirectToAction("Index");

        //    TransferValues(employee, employeeToEdit);

        //    if (ModelState.IsValid)
        //    {
        //        _employeeRepository.EnsurePersistent(employeeToEdit);

        //        Message = "Employee Edited Successfully";

        //        return RedirectToAction("Index");
        //    }
        //    else
        //    {
        //        var viewModel = EmployeeSalaryComparisonViewModel.Create(Repository);
        //        viewModel.Employee = employee;

        //        return View(viewModel);
        //    }
        //}

        //
        // GET: /Employee/Delete/5
        public ActionResult Delete(string id)
        {
            var employee = _employeeRepository.GetNullableById(id);

            if (employee == null) return RedirectToAction("Index");

            return View(employee);
        }

        //
        // POST: /Employee/Delete/5
        [HttpPost]
        public ActionResult Delete(string id, Employee employee)
        {
            var employeeToDelete = _employeeRepository.GetNullableById(id);

            if (employeeToDelete == null) return RedirectToAction("Index");

            _employeeRepository.Remove(employeeToDelete);

            Message = "Employee Removed Successfully";

            return RedirectToAction("Index");
        }

        [HttpPost]
        [BypassAntiForgeryToken]
        public ActionResult Edit(EmployeeEditModel editModel)
        {
            var id = editModel.Id.Substring(2);

            //TODO: Check permissions
            var employee = _employeeRepository.GetById(id);

            if (editModel.HireDate.HasValue) employee.AdjustedCareerHireDate = editModel.HireDate.Value;
            if (editModel.TitleDate.HasValue) employee.AdjustedApptHireDate = editModel.TitleDate.Value;
            if (editModel.ExperienceDate.HasValue) employee.ExperienceBeginDate = editModel.ExperienceDate.Value;

            employee.PPSCareerHireDateChecked = editModel.HireChecked;
            employee.PPSApptHireDateChecked = editModel.TitleChecked;

            employee.DepartmentComments = editModel.DeptComments;
            employee.DeansOfficeComments = editModel.DeansComments;

            _employeeRepository.EnsurePersistent(employee);
            
            var result = new {hireAdjusted = employee.CareerDateHasBeenAdjusted, titleAdjusted = employee.ApptDateHasBeenAdjusted, success = true};
            
            return Json(result);
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

    public class EmployeeEditModel
    {
        public string Id { get; set; } /*e-id*/
        public DateTime? HireDate { get; set; }
        public DateTime? TitleDate { get; set; }
        public DateTime? ExperienceDate { get; set; }
        public bool HireChecked { get; set; }
        public bool TitleChecked { get; set; }
        public string DeptComments { get; set; }
        public string DeansComments { get; set; }
    }

    ///// <summary>
    ///// ViewModel for the Employee class
    ///// </summary>
    //public class EmployeeViewModel
    //{
    //    public IList<SalaryScale> SelectedSalaryScales { get; set; }

    //    public string[] SelectedTitleCodes { get; set; }

    //    public string[] SelectedDepartmentCodes { get; set; }

    //    public IList<Department> SelectedDepartments { get; set; }

    //    public IList<Title> SelectedTitles { get; set; }

    //    public Employee Employee { get; set; }

    //    public string SelectedEmployeeId { get; set; }

    //    public Employee SelectedEmployee { get; set; }

    //    public IList<Employee> Employees { get; set; }

    //    public IList<Employee> EmployeesList { get; set; }

    //    public IList<Department> DepartmentsList { get; set; }

    //    //public IList<Department> DepartmentCodesList { get; set; }

    //    public IList<Title> TitlesList { get; set; }

    //    //public IList<Title> TitleCodesList { get; set; }

    //    public static EmployeeViewModel Create(IRepository repository)
    //    {
    //        Check.Require(repository != null, "Repository must be supplied");

    //        var allDepartment = new Department() { Name = "--Any Department--", DepartmentNumber = "--Any--" };
    //        var allTitle = new Title() { AbbreviatedName = "--Any Title--", PayrollTitle = "--Any Payroll Title--", TitleCode = "--Any--" };

    //        var viewModel = new EmployeeViewModel
    //        {
    //            Employee = new Employee(),
    //            EmployeesList = repository.OfType<Employee>()
    //            .Queryable
    //            .OrderBy(t => t.FullName)
    //            .ToList(),
    //            DepartmentsList = repository.OfType<Department>()
    //                .Queryable
    //                .OrderBy(t => t.Name)
    //                .ThenBy(t => t.SchoolCode)
    //                .ToList(),

    //            //DepartmentCodesList = repository.OfType<Department>()
    //            //    .Queryable
    //            //    .OrderBy(t => t.DepartmentNumber)
    //            //    .ThenBy(t => t.SchoolCode)
    //            //    .ToList(),
    //            TitlesList = repository.OfType<Title>()
    //                 .Queryable
    //                 .OrderBy(t => t.AbbreviatedName)
    //                 .ToList(),
    //            //TitleCodesList = repository.OfType<Title>()
    //            //    .Queryable
    //            //    .OrderBy(t => t.TitleCode)
    //            //    .ToList()
    //            //employeeModel.SelectedDepartments = new List<Department>()
    //        };

    //        //viewModel.SelectedDepartmentCodes = new string[] { allDepartment.DepartmentNumber };
    //        //viewModel.DepartmentsList.Insert(0, allDepartment);
    //        ////viewModel.DepartmentCodesList.Insert(0, allDepartment);

    //        //viewModel.SelectedTitleCodes = new string[] { allTitle.TitleCode };
    //        //viewModel.TitlesList.Insert(0, allTitle);
    //        ////viewModel.TitleCodesList.Insert(0, allTitle);

    //        return viewModel;
    //    }
    //}

    public static class QueryBuilderHelper
    {
        public static readonly string Any = "Any";

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