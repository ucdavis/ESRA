using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Linq.Expressions;
using System.Web.Mvc;
using CAESOps;
using Esra.Core.Domain;
using Esra.Web.Models;
using Esra.Web.Resources;
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

        public EmployeeSalaryComparisonController(IRepositoryWithTypedId<Employee, string> employeeRepository, IRepository<SalaryScale> salayScaleRepository)
        {
            _employeeRepository = employeeRepository;
            _salaryScaleRepository = salayScaleRepository;
        }

        //
        // GET: /EmployeeSalaryComparison/
        public ActionResult Index()
        {
            var employeeSalaryComparisonModel = Models.EmployeeSalaryComparisonViewModel.Create(Repository, null);

            //employeeSalaryComparisonModel.User = Repository.OfType<User>().Queryable.Where(u => u.LoginID == CurrentUser.Identity.Name).FirstOrDefault();
            var user = Core.Domain.User.GetByLoginId(Repository, CurrentUser.Identity.Name);
            employeeSalaryComparisonModel.User = user;
            employeeSalaryComparisonModel.DepartmentsList = Department.GetAllForUser(Repository, user.EmployeeID, null, true);
            employeeSalaryComparisonModel.EmployeesList = Employee.GetAllForUser(Repository, user, "FullName", true);

            return View(employeeSalaryComparisonModel);
        }

        //
        // GET: /EmployeeSalaryComparison/Details
        public ActionResult Details(string[] selectedTitleCodes, string[] selectedDepartmentCodes, string selectedEmployeeId)
        {
            var employeeSalaryComparisonModel = EmployeeSalaryComparisonViewModel.Create(Repository, SalaryScaleViewModel.Create(Repository));

            var user = Core.Domain.User.GetByLoginId(Repository, CurrentUser.Identity.Name);
            employeeSalaryComparisonModel.User = user;
            employeeSalaryComparisonModel.DepartmentsList = Department.GetAllForUser(Repository, user.EmployeeID, null, true);
            employeeSalaryComparisonModel.EmployeesList = Employee.GetAllForUser(Repository, user, "FullName", true);

            bool isAnyTitle = true;
            bool isAnyDepartment = true;
            bool isAnyEmployee = true;

            var hasSelectedTitleCodes = selectedTitleCodes == null || selectedTitleCodes.Length == 0 ||
                                    selectedTitleCodes[0].Equals("0") || selectedTitleCodes[0].Equals(String.Empty)
                                        ? false
                                        : true;
            var hasSelectedDepartmentCodes = selectedDepartmentCodes == null || selectedDepartmentCodes.Length == 0 ||
                                    selectedDepartmentCodes[0].Equals("0") || selectedDepartmentCodes[0].Equals(String.Empty)
                                        ? false
                                        : true;
            var hasSelectedEmployeeId = String.IsNullOrEmpty(selectedEmployeeId) ||
                                     selectedEmployeeId.Equals("0") || selectedEmployeeId.Equals(String.Empty)
                                         ? false
                                         : true;

            employeeSalaryComparisonModel.Employees = Employee.GetAllForUser(Repository, user.EmployeeID, IsDepartmentUser, "FullName", true,
                                       selectedTitleCodes, selectedEmployeeId, selectedDepartmentCodes);

            if (hasSelectedEmployeeId)
            {
                // get the employee by employee ID:
                //employeeSalaryComparisonModel.Employees = _employeeRepository.Queryable.Where(r => selectedEmployeeId.Equals(r.EmployeeID))
                //   .OrderBy(r => r.FullName).ThenBy(r => r.HomeDepartment.Name).ToList();
                //selectedTitleCodes, string[] selectedDepartmentCodes, string selectedEmployeeId
                //employeeSalaryComparisonModel.Employees = Employee.GetAllForUser(Repository, user.EmployeeID, IsDepartmentUser, "FullName", true,
                //                       selectedTitleCodes, selectedEmployeeId, selectedDepartmentCodes);
                isAnyEmployee = false;
            }
            else
            {
                // if both are null; get them all
                if (!hasSelectedDepartmentCodes && !hasSelectedTitleCodes)
                {
                    // get all records:
                    //employeeSalaryComparisonModel.Employees = _employeeRepository.Queryable
                    //    .OrderBy(r => r.FullName).ThenBy(r => r.HomeDepartment.Name).ToList();
                    //employeeSalaryComparisonModel.Employees = Employee.GetAllForUser(Repository, user.EmployeeID, IsDepartmentUser, "FullName", true,
                    //                   selectedTitleCodes, selectedEmployeeId, selectedDepartmentCodes);
                }
                else if (hasSelectedDepartmentCodes && !hasSelectedTitleCodes)
                {
                    // get those with matching department codes:
                    //employeeSalaryComparisonModel.Employees =
                    //    _employeeRepository.Queryable.Where(r => selectedDepartmentCodes.Contains(r.HomeDepartmentID))
                    //        .OrderBy(r => r.FullName).ThenBy(r => r.HomeDepartment.Name).ToList();
                    //employeeSalaryComparisonModel.Employees = Employee.GetAllForUser(Repository, user.EmployeeID, IsDepartmentUser, "FullName", true,
                    //                   selectedTitleCodes, selectedEmployeeId, selectedDepartmentCodes);

                    employeeSalaryComparisonModel.SelectedDepartmentCodesString =
                        PipeDelimittedString.ArrayToPipeDelimittedString(selectedDepartmentCodes);

                    isAnyDepartment = false;
                }
                else if (!hasSelectedDepartmentCodes && hasSelectedTitleCodes)
                {
                    // get those with matching title codes:
                    //employeeSalaryComparisonModel.Employees =
                    //    _employeeRepository.Queryable.Where(r => selectedTitleCodes.Contains(r.TitleCode))
                    //        .OrderBy(r => r.FullName).ThenBy(r => r.HomeDepartment.Name).ToList();

                    //employeeSalaryComparisonModel.Employees = Employee.GetAllForUser(Repository, user.EmployeeID, IsDepartmentUser, "FullName", true,
                    //                   selectedTitleCodes, selectedEmployeeId, selectedDepartmentCodes);

                    var salaryScales = _salaryScaleRepository
                        .Queryable.Where(r => selectedTitleCodes.Contains(r.TitleCode)).ToList();

                    if (salaryScales.Count == 1)
                    {
                        var salaryScale = salaryScales[0];
                        salaryScale.SalarySteps = Repository.OfType<SalaryStep>()
                            .Queryable
                            .Where(
                                s =>
                                s.TitleCode == salaryScale.TitleCode && s.EffectiveDate == salaryScale.EffectiveDate)
                            .ToList();

                        employeeSalaryComparisonModel.SalaryScaleViewModel.SalaryScale = salaryScale;
                    }

                    employeeSalaryComparisonModel.SelectedTitleCodesString =
                        PipeDelimittedString.ArrayToPipeDelimittedString(selectedTitleCodes);

                    isAnyTitle = false;
                }
                else
                {
                    // get those with matching department and title codes:
                    //employeeSalaryComparisonModel.Employees =
                    //    _employeeRepository.Queryable.Where(
                    //        r => selectedTitleCodes.Contains(r.TitleCode) &&
                    //             selectedDepartmentCodes.Contains(r.HomeDepartmentID))
                    //        .OrderBy(r => r.FullName).ThenBy(r => r.HomeDepartment.Name).ToList();
                    //employeeSalaryComparisonModel.Employees = Employee.GetAllForUser(Repository, user.EmployeeID, IsDepartmentUser, "FullName", true,
                    //                   selectedTitleCodes, selectedEmployeeId, selectedDepartmentCodes);

                    var salaryScales = _salaryScaleRepository
                        .Queryable.Where(r => selectedTitleCodes.Contains(r.TitleCode)).ToList();

                    if (salaryScales.Count == 1)
                    {
                        var salaryScale = salaryScales[0];
                        salaryScale.SalarySteps = Repository.OfType<SalaryStep>()
                            .Queryable
                            .Where(
                                s =>
                                s.TitleCode == salaryScale.TitleCode && s.EffectiveDate == salaryScale.EffectiveDate)
                            .ToList();

                        employeeSalaryComparisonModel.SalaryScaleViewModel.SalaryScale = salaryScale;
                    }
                    employeeSalaryComparisonModel.SelectedDepartmentCodesString =
                        PipeDelimittedString.ArrayToPipeDelimittedString(selectedDepartmentCodes);
                    employeeSalaryComparisonModel.SelectedTitleCodesString =
                        PipeDelimittedString.ArrayToPipeDelimittedString(selectedTitleCodes);

                    isAnyDepartment = false;
                    isAnyTitle = false;
                }
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

            //if (employee == null) return RedirectToAction("Index");

            return View(employeeSalaryComparisonModel);
        }

        #region ExcelOps

        public ActionResult ExportToExcel(string sortPropertyName, string isAscending, string selectedTitleCodesString, string selectedEmployeeId, string selectedDepartmentCodesString)
        {
            var employee =
                Repository.OfType<Employee>().Queryable.Where(x => x.EmployeeID == selectedEmployeeId).FirstOrDefault();
            var pkEmployee = (employee != null && String.IsNullOrEmpty(employee.EmployeeID) == false ? employee.Id : String.Empty);

            User user = Esra.Core.Domain.User.GetByLoginId(Repository, User.Identity.Name);
            string userId = user.EmployeeID;

            string[] titleStrings = selectedTitleCodesString.Split('|');

            string[] departmentStrings = selectedDepartmentCodesString.Split('|');

            IList<Employee> employees = Employee.GetAllForUser(Repository,
                userId,
                IsDepartmentUser,
                sortPropertyName,
                Convert.ToBoolean(isAscending),
                titleStrings,
                pkEmployee,
                departmentStrings);

            // Convert the employees list to a datatable

            ExcelOps eops = new ExcelOps();
            List<CAESOps.ExcelBorder> borders = new List<CAESOps.ExcelBorder>();

            string tempString = "";
            Type stringType = tempString.GetType();

            Decimal tempDecimal = new Decimal();
            Type decimalType = tempDecimal.GetType();

            Double tempDouble = new Double();
            Type doubleType = tempDouble.GetType();

            DataTable dt = new DataTable();

            // Add the data headers:
            dt.Columns.Add("Department Name", stringType);
            dt.Columns.Add("Title Code", stringType);
            dt.Columns.Add("Salary Grade", stringType);
            dt.Columns.Add("Bargaining Unit", stringType);
            dt.Columns.Add("Employee Name", stringType);
            dt.Columns.Add("Hire Date", stringType);
            dt.Columns.Add("Years Of Service", doubleType);
            dt.Columns.Add("Begin Date (In Title)", stringType);
            dt.Columns.Add("Time In Title", doubleType);
            dt.Columns.Add("Experience Begin Date", stringType);
            dt.Columns.Add("Years Of Experience", doubleType);
            dt.Columns.Add("Pay Rate", doubleType);
            dt.Columns.Add("Department Comments", stringType);
            dt.Columns.Add("Deans Office Comments", stringType);

            DataRow row;

            foreach (Employee emp in employees)
            {
                row = dt.NewRow();

                row["Department Name"] = emp.HomeDepartment.Name;
                row["Employee Name"] = emp.FullName;
                row["Department Comments"] = emp.DepartmentComments;
                row["Deans Office Comments"] = emp.DeansOfficeComments;
                row["Title Code"] = emp.TitleCode;
                row["Salary Grade"] = emp.SalaryGrade;
                row["Bargaining Unit"] = emp.BargainingUnitCode;
                row["Hire Date"] = String.Format("{0:MM/dd/yyyy}", emp.AdjustedCareerHireDate);
                row["Years Of Service"] = (emp.YearsOfService ?? 0d);
                row["Begin Date (In Title)"] = String.Format("{0:MM/dd/yyyy}", emp.AdjustedApptHireDate);
                row["Time In Title"] = (emp.TimeInTitle ?? 0d);
                row["Experience Begin Date"] = String.Format("{0:MM/dd/yyyy}", emp.ExperienceBeginDate);
                row["Years Of Experience"] = (emp.YearsOfExperience ?? 0d);
                //row["Years Of Experience"] = emp.YearsOfExperience;
                row["Pay Rate"] = emp.PayRate;

                if (IsDepartmentUser)
                {
                    // Check if is department employee and blank out field if not:
                    //if (!Employee.IsDepartmentEmployee(user, emp))
                    if (!emp.IsDepartmentEmployee)
                    {
                        row["Department Name"] = null;
                        row["Employee Name"] = null;
                        row["Department Comments"] = null;
                        row["Deans Office Comments"] = null;
                    }
                }

                dt.Rows.Add(row);
            }

            eops.HorizontalFreeze = 1;
            ExcelStyle numberTwoDecimalStyle = new ExcelStyle();
            numberTwoDecimalStyle.Format = PredefinedExcelStyles.NumberTwoDecimal;
            eops.AddColumnStyle("Years Of Service", numberTwoDecimalStyle);
            eops.AddColumnStyle("Time In Title", numberTwoDecimalStyle);
            eops.AddColumnStyle("Years Of Experience", numberTwoDecimalStyle);
            ExcelStyle currencyStyle = new ExcelStyle();
            currencyStyle.Format = PredefinedExcelStyles.CurrencyTwoDecimal;
            eops.AddColumnStyle("Pay Rate", currencyStyle);

            byte[] byteArray = eops.ExportToExcel(dt);

            Session["ExportExcel"] = byteArray;

            return File(byteArray, "application/vnd.ms-excel", "MyExportedFile.xml");
        }

        #endregion ExcelOps

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
            var isDepartmentUser = Session[GlobalConstants.KEY_IS_DEPARTMENT_USER] as bool? ?? false;

            var employee = _employeeRepository.GetById(id);

            if (editModel.HireDate.HasValue) employee.SetCareerHireDate(editModel.HireDate.Value);
            if (editModel.TitleDate.HasValue) employee.SetApptHireDate(editModel.TitleDate.Value);
            if (editModel.ExperienceDate.HasValue) employee.SetExperienceBeginDate(editModel.ExperienceDate.Value);

            employee.SetPPSCareerHireDateChecked(editModel.HireChecked);
            employee.SetPPSApptHireDateChecked(editModel.TitleChecked);

            employee.SetDepartmentComments(editModel.DeptComments, isDepartmentUser);
            employee.SetDeansOfficeComments(editModel.DeansComments, isDepartmentUser);

            _employeeRepository.EnsurePersistent(employee);

            var result = new { hireAdjusted = employee.CareerDateHasBeenAdjusted, titleAdjusted = employee.ApptDateHasBeenAdjusted, success = true };

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

    public static class PipeDelimittedString
    {
        public static string ArrayToPipeDelimittedString(string[] values)
        {
            var retval = String.Empty;

            if (values != null && values.Count() > 0)
            {
                for (var i = 0; i < values.Count(); i++)
                {
                    retval += values[i];
                    if (i < values.Count() - 1)
                    {
                        retval += "|";
                    }
                }
            }
            return retval;
        }
    }
}