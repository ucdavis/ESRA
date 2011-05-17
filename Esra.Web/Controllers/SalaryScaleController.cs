using System;
using System.Linq;
using System.Web.Mvc;
using Esra.Core.Domain;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Core.Utils;

namespace Esra.Web.Controllers
{
    /// <summary>
    /// Controller for the SalaryScale class
    /// </summary>
    public class SalaryScaleController : ApplicationController
    {
        private readonly IRepository<SalaryScale> _salaryScaleRepository;

        public SalaryScaleController(IRepository<SalaryScale> salaryScaleRepository)
        {
            _salaryScaleRepository = salaryScaleRepository;
        }

        //
        // GET: /SalaryScale/
        public ActionResult Index()
        {
            var salaryScaleList = _salaryScaleRepository.Queryable;

            return View(salaryScaleList.ToList());
        }

        //
        // GET: /SalaryScale/Details/5
        //public ActionResult SalaryScaleDetails(int id)
        //{
        //    var salaryScale = _salaryScaleRepository.GetNullableById(id);

        //    if (salaryScale == null) return RedirectToAction("Index");

        //    return View(salaryScale);
        //}

        //
        // GET: /SalaryScale/Details?TitleCode=4001
        public ActionResult Details(string titleCode)
        {
            //var salaryScale = _salaryScaleRepository.Queryable
            //    .Where(r => r.TitleCode == titleCode)
            //    .FirstOrDefault();

            var salaryScale = _salaryScaleRepository.Queryable.FirstOrDefault();

            if (salaryScale == null) return RedirectToAction("Index");

            return View(salaryScale);
        }

        //
        // GET: /SalaryScale/Create
        public ActionResult Create()
        {
            var viewModel = SalaryScaleViewModel.Create(Repository);

            return View(viewModel);
        }

        //
        // POST: /SalaryScale/Create
        [HttpPost]
        public ActionResult Create(SalaryScale salaryScale)
        {
            var salaryScaleToCreate = new SalaryScale();

            TransferValues(salaryScale, salaryScaleToCreate);

            if (ModelState.IsValid)
            {
                _salaryScaleRepository.EnsurePersistent(salaryScaleToCreate);

                Message = "SalaryScale Created Successfully";

                return RedirectToAction("Index");
            }
            else
            {
                var viewModel = SalaryScaleViewModel.Create(Repository);
                viewModel.SalaryScale = salaryScale;

                return View(viewModel);
            }
        }

        //
        // GET: /SalaryScale/Edit/5
        public ActionResult Edit(int id)
        {
            var salaryScale = _salaryScaleRepository.GetNullableById(id);

            if (salaryScale == null) return RedirectToAction("Index");

            var viewModel = SalaryScaleViewModel.Create(Repository);
            viewModel.SalaryScale = salaryScale;

            return View(viewModel);
        }

        //
        // POST: /SalaryScale/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, SalaryScale salaryScale)
        {
            var salaryScaleToEdit = _salaryScaleRepository.GetNullableById(id);

            if (salaryScaleToEdit == null) return RedirectToAction("Index");

            TransferValues(salaryScale, salaryScaleToEdit);

            if (ModelState.IsValid)
            {
                _salaryScaleRepository.EnsurePersistent(salaryScaleToEdit);

                Message = "SalaryScale Edited Successfully";

                return RedirectToAction("Index");
            }
            else
            {
                var viewModel = SalaryScaleViewModel.Create(Repository);
                viewModel.SalaryScale = salaryScale;

                return View(viewModel);
            }
        }

        //
        // GET: /SalaryScale/Delete/5
        public ActionResult Delete(int id)
        {
            var salaryScale = _salaryScaleRepository.GetNullableById(id);

            if (salaryScale == null) return RedirectToAction("Index");

            return View(salaryScale);
        }

        //
        // POST: /SalaryScale/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, SalaryScale salaryScale)
        {
            var salaryScaleToDelete = _salaryScaleRepository.GetNullableById(id);

            if (salaryScaleToDelete == null) return RedirectToAction("Index");

            _salaryScaleRepository.Remove(salaryScaleToDelete);

            Message = "SalaryScale Removed Successfully";

            return RedirectToAction("Index");
        }

        /// <summary>
        /// Transfer editable values from source to destination
        /// </summary>
        private static void TransferValues(SalaryScale source, SalaryScale destination)
        {
            //Recommendation: Use AutoMapper
            //Mapper.Map(source, destination)
            throw new NotImplementedException();
        }
    }

    /// <summary>
    /// ViewModel for the SalaryScale class
    /// </summary>
    public class SalaryScaleViewModel
    {
        public SalaryScale SalaryScale { get; set; }

        public static SalaryScaleViewModel Create(IRepository repository)
        {
            Check.Require(repository != null, "Repository must be supplied");

            var viewModel = new SalaryScaleViewModel { SalaryScale = new SalaryScale() };

            return viewModel;
        }
    }
}