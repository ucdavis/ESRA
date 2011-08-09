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

            if (IsDepartmentUser)
            {
                // filter out non-department selections from select lists:
                salaryReviewAnalysisModel.FilteredEmployees = salaryReviewAnalysisModel
                    .FilteredEmployees
                    .AsQueryable()
                    .OfType<Employee>()
                    .Where(x => x.IsDepartmentEmployee == true)
                    .ToList();
            }

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
        public ActionResult Delete(int id)
        {
            var salaryReviewAnalysis = _salaryReviewAnalysisRepository.GetNullableById(id);

            if (salaryReviewAnalysis == null) return RedirectToAction("Index");

            return View(salaryReviewAnalysis);
        }

        //
        // POST: /SalaryReviewAnalysis/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, SalaryReviewAnalysis salaryReviewAnalysis)
        {
            var salaryReviewAnalysisToDelete = _salaryReviewAnalysisRepository.GetNullableById(id);

            if (salaryReviewAnalysisToDelete == null) return RedirectToAction("Index");

            _salaryReviewAnalysisRepository.Remove(salaryReviewAnalysisToDelete);

            Message = "SalaryReviewAnalysis Removed Successfully";

            return RedirectToAction("Index");
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