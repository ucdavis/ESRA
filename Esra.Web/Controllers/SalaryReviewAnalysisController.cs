using System;
using System.Linq;
using System.Web.Mvc;
using Esra.Core.Domain;
using Esra.Web.Models;
using Esra.Web.Services;
using MvcContrib;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Web.Attributes;

namespace Esra.Web.Controllers
{
    /// <summary>
    /// Controller for the SalaryReviewAnalysis class
    /// </summary>
    public class SalaryReviewAnalysisController : ApplicationController
    {
        private readonly IRepository<SalaryReviewAnalysis> _salaryReviewAnalysisRepository;
        private readonly IRepository<Scenario> _scenarioRepository;
        private readonly IDirectorySearchService _directorySearchService;

        public SalaryReviewAnalysisController(IRepository<SalaryReviewAnalysis> salaryReviewAnalysisRepository, IRepository<Scenario> scenarioRepository, IDirectorySearchService directorySearchService)
        {
            _salaryReviewAnalysisRepository = salaryReviewAnalysisRepository;
            _scenarioRepository = scenarioRepository;
            _directorySearchService = directorySearchService;
        }

        //
        // GET: /SalaryReviewAnalysis/
        public ActionResult Index(string selectedReferenceNumber, string selectedEmployee, int? selectedUser, string creationDateString)
        {
            var salaryReviewAnalysisSearchParamsModel = new SalaryReviewAnalysisSearchParamsModel
                                                            {
                                                                SelectedReferenceNumber = selectedReferenceNumber,
                                                                SelectedEmployeeId = selectedEmployee,
                                                                SelectedUserId = selectedUser,
                                                                CreationDateString =
                                                                    (String.IsNullOrEmpty(creationDateString)
                                                                         ? DateTime.Now.ToString("MM/dd/yyyy")
                                                                         : creationDateString)
                                                            };
            var salaryReviewAnalysisModel = SalaryReviewAnalysisViewModel.Create(Repository, IsDepartmentUser, Esra.Core.Domain.User.GetByLoginId(Repository, CurrentUser.Identity.Name), salaryReviewAnalysisSearchParamsModel);

            return View(salaryReviewAnalysisModel);
        }

        //
        // GET: /SalaryReviewAnalysis/Details/5
        public ActionResult Details(string referenceNumber)
        {
            var viewModel = SalaryReviewAnalysisEditorViewModel.Create(Repository, null, null, referenceNumber);

            if (viewModel == null) return RedirectToAction("Index");

            return View(viewModel);
        }

        //
        // GET: /SalaryReviewAnalysis/Create?NewSraEmployee=2749660017247
        public ActionResult Create(string newSraEmployee)
        {
            var viewModel = SalaryReviewAnalysisEditorViewModel.Create(Repository, newSraEmployee);
            //viewModel.NewSraEmployee = Repository.OfType<Employee>()
            //    .Queryable
            //    .Where(e => e.id.Equals(newSraEmployee))
            //        .FirstOrDefault();

            return View(viewModel);
        }

        ////
        //// GET: /SalaryReviewAnalysis/Create
        //public ActionResult Create(string newSraEmployee, string proposedTitle)
        //{
        //    var viewModel = SalaryReviewAnalysisEditorViewModel.Create(Repository, newSraEmployee, proposedTitle, null);
        //    //viewModel.NewSraEmployee = Repository.OfType<Employee>()
        //    //    .Queryable
        //    //    .Where(e => e.id.Equals(newSraEmployee))
        //    //        .FirstOrDefault();)

        //    return View(viewModel);
        //}

        //
        // POST: /SalaryReviewAnalysis/Create
        [HttpPost]
        public ActionResult Create(SalaryReviewAnalysis salaryReviewAnalysis)
        {
            var salaryReviewAnalysisToCreate = new SalaryReviewAnalysis();

            TransferValues(salaryReviewAnalysis, salaryReviewAnalysisToCreate);

            if (ModelState.IsValid)
            {
                _salaryReviewAnalysisRepository.EnsurePersistent(salaryReviewAnalysisToCreate);

                Message = "SalaryReviewAnalysis Created Successfully";

                return RedirectToAction("Index");
            }
            else
            {
                var viewModel = SalaryReviewAnalysisViewModel.Create(Repository);
                viewModel.SalaryReviewAnalysis = salaryReviewAnalysis;

                return View(viewModel);
            }
        }

        //
        // GET: /SalaryReviewAnalysis/Edit?ReferenceNumber=20100323147
        //public ActionResult CreateEdit(string referenceNumber)
        public ActionResult CreateEdit(string newSraEmployee, string proposedTitle, string referenceNumber)
        {
            //var viewModel = SalaryReviewAnalysisEditorViewModel.Create(Repository, null, null, referenceNumber);
            var viewModel = SalaryReviewAnalysisEditorViewModel.Create(Repository, newSraEmployee, proposedTitle, referenceNumber);

            if (viewModel.SalaryReviewAnalysis == null) return RedirectToAction("Index");

            viewModel.IsDepartmentUser = IsDepartmentUser;

            // Logic to set possible OriginatingDepartments
            var user = Esra.Core.Domain.User.GetByLoginId(Repository, CurrentUser.Identity.Name);
            if (user != null && String.IsNullOrEmpty(user.EmployeeID))
            {
                // try getting employee ID from LDAP:
                var tempUser = _directorySearchService.FindUser(CurrentUser.Identity.Name);
                if (tempUser != null)
                    user.EmployeeID = tempUser.EmployeeId;
            }

            var allSchoolDepartments = Department.GetAllForUser(Repository, user, false, "Name", true);

            if (IsDepartmentUser)
            {
                var usersUnits = user.Units.Select(u => u.PPSCode).ToArray();

                viewModel.PossibleOriginatingDepartments = allSchoolDepartments
                    .Where(x => usersUnits.Contains(x.Id))
                    .ToList();
            }
            else
            {
                // All school departments for Dean's Office User:
                viewModel.PossibleOriginatingDepartments = allSchoolDepartments;
            }

            if (String.IsNullOrEmpty(viewModel.SalaryReviewAnalysis.ReferenceNumber))
            {
                if (user != null)
                {
                    viewModel.SalaryReviewAnalysis.OriginatingDepartment = Department.GetOriginatingDepartmentForUser(Repository, user.EmployeeID);
                    viewModel.SalaryReviewAnalysis.InitiatedByReviewerName = user.FullName;
                }
            }

            //var salaryReviewAnalysis = _salaryReviewAnalysisRepository.GetNullableById(id);

            //if (viewModel.SalaryReviewAnalysis == null) return RedirectToAction("Index");

            //var viewModel = SalaryReviewAnalysisViewModel.Create(Repository);
            //viewModel.SalaryReviewAnalysis = salaryReviewAnalysis;

            return View(viewModel);
        }

        private Scenario UpdateScenarioValues(Scenario item)
        {
            Scenario scenario = null;

            var id = item.Id;
            // Logic to force a restore of a non-saved scenario:
            scenario = id == 0 ? new Scenario() : _scenarioRepository.GetNullableById(id);

            // Update scenario values with any changes from UI:
            scenario.ScenarioNumber = item.ScenarioNumber;

            scenario.Approved = item.Approved;

            scenario.SelectionType = item.SelectionType;

            scenario.PercentIncrease = item.PercentIncrease;

            scenario.SalaryAmount = item.SalaryAmount;

            return scenario;
        }

        //
        // POST: /SalaryReviewAnalysis/CreateEdit?SalaryReviewAnalysis
        [HttpPost]
        [HandleTransactionsManually]
        public ActionResult CreateEdit(SalaryReviewAnalysis salaryReviewAnalysis, SRAEmployee sraEmployee)
        {
            const string MESSAGE_RECORD_UPDATED_SUCCESS = "Salary Review Analysis Successfully Updated ";
            const string MESSAGE_RECORD_SAVED_SUCCESS = "Salary Review Analysis Successfully Saved ";
            var message = MESSAGE_RECORD_SAVED_SUCCESS;

            var scenarios = salaryReviewAnalysis.Scenarios.Select(item => UpdateScenarioValues(item)).ToList();

            var dateApproved = salaryReviewAnalysis.DateApproved;
            //if (gvSalaryReviewAnaysis.Rows.Count == 1)
            //{
            //    // Get date approved:
            //    TextBox tbDateApproved = gvSalaryReviewAnaysis.Rows[0].FindControl("tbDateApproved") as TextBox;
            //    if (tbDateApproved != null)
            //    {
            //        dateApproved = tbDateApproved.Text;
            //    }
            //}
            //dateApproved = salaryReviewAnalysis.DateApproved;

            var user = Esra.Core.Domain.User.GetByLoginId(Repository, CurrentUser.Identity.Name);

            //var sra = (String.IsNullOrEmpty(ReferenceNum) == false ? SalaryReviewAnalysisBLL.GetByReferenceNumber(ReferenceNum) : null);
            var salaryReviewAnalysisToEdit = (String.IsNullOrEmpty(salaryReviewAnalysis.ReferenceNumber) == false ? _salaryReviewAnalysisRepository
                .Queryable
                .Where(x => x.ReferenceNumber.Equals(salaryReviewAnalysis.ReferenceNumber))
                .FirstOrDefault() : null);

            var emp = (salaryReviewAnalysisToEdit != null ? salaryReviewAnalysisToEdit.Employee : new SRAEmployee(Repository.OfType<Employee>().Queryable.Where(x => x.Id.Equals(sraEmployee.PkEmployee)).FirstOrDefault()));

            //bool isReclass = (ProposedTitleCode != null && ProposedTitleCode.Equals(emp.TitleCode) == false ? true : false);
            var isReclass = salaryReviewAnalysis.IsReclass;

            //string titleCode = (isReclass ? ProposedTitleCode : emp.TitleCode);
            var titleCode = salaryReviewAnalysis.Title.TitleCode;

            if (salaryReviewAnalysisToEdit != null)
            {
                // Then this is an existing analysis:

                // Record exists --> Update
                message = MESSAGE_RECORD_UPDATED_SUCCESS;
            }
            else
            {
                // Else this is a new analysis:

                salaryReviewAnalysisToEdit = new SalaryReviewAnalysis()
                                                 {
                                                     DateInitiated = DateTime.Today,
                                                     //InitiatedByReviewerName = user.FullName,
                                                     //OriginatingDepartment = Department.GetOriginatingDepartmentForUser(Repository, user.EmployeeID),
                                                     Title = Repository.OfType<Title>()
                                                     .Queryable
                                                     .Where(t => t.TitleCode.Equals(titleCode))
                                                     .FirstOrDefault(),
                                                     Employee = emp,
                                                     SalaryScale = SalaryScale.GetEffectiveSalaryScale(Repository, titleCode, DateTime.Today),
                                                     CurrentTitleCode = emp.TitleCode,
                                                     IsReclass = isReclass
                                                 };
            }

            salaryReviewAnalysisToEdit.InitiatedByReviewerName = salaryReviewAnalysis.InitiatedByReviewerName;
            salaryReviewAnalysisToEdit.OriginatingDepartment = salaryReviewAnalysis.OriginatingDepartment;

            //if (String.IsNullOrEmpty(dateApproved) == false)
            salaryReviewAnalysisToEdit.DateApproved = dateApproved ?? null;

            salaryReviewAnalysisToEdit.DeansOfficeComments = salaryReviewAnalysis.DeansOfficeComments;
            salaryReviewAnalysisToEdit.DepartmentComments = salaryReviewAnalysis.DepartmentComments;

            salaryReviewAnalysisToEdit.Scenarios = scenarios;

            //TransferValues(salaryReviewAnalysis, salaryReviewAnalysisToEdit);

            if (ModelState.IsValid)
            {
                //_salaryReviewAnalysisRepository.EnsurePersistent(salaryReviewAnalysisToEdit);
                SalaryReviewAnalysis.UpdateRecord(Repository, salaryReviewAnalysisToEdit);
                // At this point the reference number has been if a newly created analysis!
                //Session["Message"] = message;
                var referenceNumber = salaryReviewAnalysisToEdit.ReferenceNumber;

                Message = Message = "Salary Review Analysis (ref #: " + referenceNumber + ") Successfully Saved"; ;

                //var values = new System.Web.Routing.RouteValueDictionary { { "referenceNumber", referenceNumber } };
                //return RedirectToAction("Details", values);
                // -- or --
                //return RedirectToAction("Details", new { referenceNumber });
                // -- or --
                return this.RedirectToAction<SalaryReviewAnalysisController>(a => a.Details(referenceNumber));
            }
            else
            {
                var viewModel = SalaryReviewAnalysisViewModel.Create(Repository);
                viewModel.SalaryReviewAnalysis = salaryReviewAnalysis;

                return View(viewModel);
            }
        }

        //
        // GET: /SalaryReviewAnalysis/Delete/5
        //public ActionResult Delete(string referenceNumber, Employee selectedEmployee)
        //{
        //    var salaryReviewAnalysisToDelete = _salaryReviewAnalysisRepository.Queryable
        //        .Where(x => x.ReferenceNumber == referenceNumber)
        //        .FirstOrDefault();

        //    if (salaryReviewAnalysisToDelete == null) return RedirectToAction("Index");

        //    // _salaryReviewAnalysisRepository.Remove(salaryReviewAnalysisToDelete);

        //    Message = "Salary Review AnalysisSuccessfully Removed";

        //    return RedirectToAction("Index");
        //}

        //
        // POST: /SalaryReviewAnalysis/Delete/5
        //[HttpPost]
        //public ActionResult Delete(int id)
        //{
        //    var salaryReviewAnalysis = _salaryReviewAnalysisRepository.GetNullableById(id);

        //    if (salaryReviewAnalysis == null) return RedirectToAction("Index");

        //    return View(salaryReviewAnalysis);
        //}

        //
        // POST: /SalaryReviewAnalysis/Delete/5
        [HttpPost]
        public ActionResult Delete(SalaryReviewAnalysis a, SalaryReviewAnalysisSearchParamsModel salaryReviewAnalysisSearchParamsModel)
        {
            var referenceNumber = a.ReferenceNumber;
            var salaryReviewAnalysisToDelete = _salaryReviewAnalysisRepository.Queryable
               .Where(x => x.ReferenceNumber == referenceNumber)
               .FirstOrDefault();

            if (salaryReviewAnalysisToDelete == null) return RedirectToAction("Index");

            _salaryReviewAnalysisRepository.Remove(salaryReviewAnalysisToDelete);

            Message = "Salary Review Analysis (ref #: " + referenceNumber + ") Successfully Removed";

            // This will return to the main Salary Review Analysis index page displaying the default search and sort order,
            // meaning display the page in the "newly visited" state as if the user was visiting it for the first time.
            return RedirectToAction("Index");

            // This will return to the main Salary Review Analysis index page displaying the
            // same search and TODO: add sort order and sort property
            // as the user selected prior to the delete:
            // Note that if the user deleted the only analysis listed in the search results, that the page will now display the "No Results Found" message.
            //return
            //    this.RedirectToAction<SalaryReviewAnalysisController>(
            //        b =>
            //        b.Index(salaryReviewAnalysisSearchParamsModel.SelectedReferenceNumber,
            //                salaryReviewAnalysisSearchParamsModel.SelectedEmployee.Id,
            //                salaryReviewAnalysisSearchParamsModel.SelectedUser.Id,
            //                salaryReviewAnalysisSearchParamsModel.CreationDateString));
        }

        /// <summary>
        /// Transfer editable values from source to destination
        /// </summary>
        private static void TransferValues(SalaryReviewAnalysis source, SalaryReviewAnalysis destination)
        {
            //Recommendation: Use AutoMapper
            //Mapper.Map(source, destination)
            destination.Scenarios = source.Scenarios;
            destination.ApprovedScenario = source.ApprovedScenario;
            destination.DateApproved = source.DateApproved;
            destination.DepartmentComments = source.DepartmentComments;
            destination.DeansOfficeComments = source.DeansOfficeComments;

            //throw new NotImplementedException();
        }
    }
}