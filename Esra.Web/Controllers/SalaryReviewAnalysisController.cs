using System;
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
        //public ActionResult Index(string isDepartmentUser, string selectedReferenceNumber, string selectedEmployee, string selectedUser, string creationDateString)
        public ActionResult Index(string isDepartmentUser, SalaryReviewAnalysisSearchParamsModel salaryReviewAnalysisSearchParamsModel)
        {
            var salaryReviewAnalysisModel = SalaryReviewAnalysisViewModel.Create(Repository, isDepartmentUser, salaryReviewAnalysisSearchParamsModel);

            return View(salaryReviewAnalysisModel);
        }

        //
        // GET: /SalaryReviewAnalysis/Details/5
        public ActionResult Details(int id)
        {
            var salaryReviewAnalysis = _salaryReviewAnalysisRepository.GetNullableById(id);

            if (salaryReviewAnalysis == null) return RedirectToAction("Index");

            return View(salaryReviewAnalysis);
        }

        //
        // GET: /SalaryReviewAnalysis/Create
        public ActionResult Create()
        {
            var viewModel = SalaryReviewAnalysisViewModel.Create(Repository);

            return View(viewModel);
        }

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
        // GET: /SalaryReviewAnalysis/Edit/5
        public ActionResult Edit(int id)
        {
            var salaryReviewAnalysis = _salaryReviewAnalysisRepository.GetNullableById(id);

            if (salaryReviewAnalysis == null) return RedirectToAction("Index");

            var viewModel = SalaryReviewAnalysisViewModel.Create(Repository);
            viewModel.SalaryReviewAnalysis = salaryReviewAnalysis;

            return View(viewModel);
        }

        //
        // POST: /SalaryReviewAnalysis/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, SalaryReviewAnalysis salaryReviewAnalysis)
        {
            var salaryReviewAnalysisToEdit = _salaryReviewAnalysisRepository.GetNullableById(id);

            if (salaryReviewAnalysisToEdit == null) return RedirectToAction("Index");

            TransferValues(salaryReviewAnalysis, salaryReviewAnalysisToEdit);

            if (ModelState.IsValid)
            {
                _salaryReviewAnalysisRepository.EnsurePersistent(salaryReviewAnalysisToEdit);

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
            throw new NotImplementedException();
        }
    }
}