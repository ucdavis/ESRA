using System;
using System.Linq;
using System.Web.Mvc;
using Esra.Core.Domain;
using Esra.Web.Models;
using UCDArch.Core.PersistanceSupport;

namespace Esra.Web.Controllers
{
    /// <summary>
    /// Controller for the SalaryReviewAnalysis class
    /// </summary>
    public class SalaryReviewAnalysisController : ApplicationController
    {
        private readonly IRepository<SalaryReviewAnalysis> _salaryReviewAnalysisRepository;

        public SalaryReviewAnalysisController(IRepository<SalaryReviewAnalysis> salaryReviewAnalysisRepository)
        {
            _salaryReviewAnalysisRepository = salaryReviewAnalysisRepository;
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
            viewModel.IsDepartmentUser = IsDepartmentUser;
            //var salaryReviewAnalysis = _salaryReviewAnalysisRepository.GetNullableById(id);

            if (viewModel.SalaryReviewAnalysis == null) return RedirectToAction("Index");

            //var viewModel = SalaryReviewAnalysisViewModel.Create(Repository);
            //viewModel.SalaryReviewAnalysis = salaryReviewAnalysis;

            return View(viewModel);
        }

        //
        // POST: /SalaryReviewAnalysis/CreateEdit?SalaryReviewAnalysis
        [HttpPost]
        public ActionResult CreateEdit(SalaryReviewAnalysis salaryReviewAnalysis)
        {
            var salaryReviewAnalysisToEdit = _salaryReviewAnalysisRepository
                .Queryable
                .Where(x => x.ReferenceNumber.Equals(salaryReviewAnalysis.ReferenceNumber))
                .FirstOrDefault();

            if (salaryReviewAnalysisToEdit == null) return RedirectToAction("Index");

            TransferValues(salaryReviewAnalysis, salaryReviewAnalysisToEdit);

            if (ModelState.IsValid)
            {
                //_salaryReviewAnalysisRepository.EnsurePersistent(salaryReviewAnalysisToEdit);

                Message = "SalaryReviewAnalysis Edited Successfully";

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