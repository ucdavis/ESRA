using System;
using System.Web.Mvc;
using Esra.Core.Domain;
using Esra.Web.Models;
using UCDArch.Core.PersistanceSupport;

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
            var salaryScaleModel = SalaryScaleViewModel.Create(Repository);

            // Example:
            // Note that setting salaryScaleModel.Titles is now handled directly in the model
            //salaryScaleModel.Titles = Repository.OfType<Title>()
            //                      .Queryable
            //                      .OrderBy(t => t.AbbreviatedName)
            //    // .ThenBy(t => t.TitleCode)
            //                      .ToList();

            //salaryScaleModel.TitleCodes = salaryScaleModel.Titles
            //    .OrderBy(t => t.TitleCode)
            //    .ToList();

            return View(salaryScaleModel);
        }

        // Example
        // GET: /SalaryScale/Details/5
        //public ActionResult SalaryScaleDetails(int id)
        //{
        //    var salaryScale = _salaryScaleRepository.GetNullableById(id);

        //    if (salaryScale == null) return RedirectToAction("Index");

        //    return View(salaryScale);
        //}

        //
        // GET: /SalaryScale/Details?TitleCode=4001, (EffectiveDate=09-20-2011 optional; otherwise, uses today's date.)
        public ActionResult Details(string titleCode, string effectiveDate)
        {
            //ICriteria criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(TypeOf(SalaryScale))
            //    .SetFetchMode("SalarySteps", FetchMode.Eager);

            //var searchDate = DateTime.Now;
            //DateTime.TryParse(effectiveDate,  out searchDate);

            // DateTime  searchDate = String.IsNullOrEmpty(effectiveDate) ? DateTime.Now : bool validDate = DateTime.TryParse(effectiveDate, out searchDate);

            var user = Esra.Core.Domain.User.GetByLoginId(Repository, User.Identity.Name);
            var salaryScaleModel = SalaryScaleViewModel.Create(Repository, titleCode, effectiveDate, user);

            //salaryScaleModel.TitleCode = titleCode;

            // Example:
            // Note setting salaryScaleModel.Titles is now handled directly in the model
            //salaryScaleModel.Titles = Repository.OfType<Title>()
            //                      .Queryable
            //                      .OrderBy(t => t.AbbreviatedName)
            //    // .ThenBy(t => t.TitleCode)
            //                      .ToList();

            //salaryScaleModel.TitleCodes = salaryScaleModel.Titles
            //           .OrderBy(t => t.TitleCode)
            //           .ToList();

            // Example 1:
            //var salaryScale = _salaryScaleRepository.Queryable
            //    .Where(r => r.TitleCode == titleCode)
            //    .FirstOrDefault();

            // Example 2:
            //var salaryScale = Repository.OfType<SalaryScale>()
            //    .Queryable
            //    .Where(r => r.TitleCode == titleCode)
            //    .FirstOrDefault();)

            // Note that an "effectiveDate" is also required in order to fetch the salary scale in effect on the date provided.
            //var salaryScale = SalaryScale.GetEffectiveSalaryScale(Repository, titleCode, searchDate);
            //salaryScaleModel.SalaryScale = SalaryScale.GetEffectiveSalaryScale(Repository, titleCode, searchDate);

            //if (salaryScale != null)
            //{
            //    salaryScale.SalarySteps = Repository.OfType<SalaryStep>()
            //        .Queryable
            //        .Where(s => s.TitleCode == salaryScale.TitleCode && s.EffectiveDate == salaryScale.EffectiveDate)
            //        .OrderBy(x => x.Annual)
            //        .ToList();

            //    salaryScaleModel.SalaryScale = salaryScale;
            //}

            // Examples:
            //var titles = Repository.OfType<Title>()
            //                      .Queryable
            //                      .Select(t => new { t.TitleCode, t.PayrollTitle })
            //                      .OrderBy(t => t.PayrollTitle)
            //                      .ToList() as IDictionary<string, string>;

            //salaryScaleModel.Titles = Repository.OfType<Title>()
            //                      .Queryable

            //                      .OrderBy(t => t.PayrollTitle)
            //                      .ToList();

            //salaryScaleModel.TitleCodes = Repository.OfType<Title>()
            //           .Queryable

            //           .OrderBy(t => t.TitleCode)
            //           .ToList();

            //if (salaryScale == null) return RedirectToAction("Index");
            //if (salaryScale == null)
            //{
            //    return RedirectToAction("Index");
            //}
            return View(salaryScaleModel);
        }

        // GET: /SalaryScale/_SalaryScale?TitleCode=4001, , (EffectiveDate=09-20-2011 optional; otherwise, uses today's date.)
        public ActionResult _SalaryScale(string titleCode, string effectiveDate)
        {
            //ICriteria criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(TypeOf(SalaryScale))
            //    .SetFetchMode("SalarySteps", FetchMode.Eager);

            var user = Esra.Core.Domain.User.GetByLoginId(Repository, User.Identity.Name);
            var salaryScaleModel = SalaryScaleViewModel.Create(Repository, titleCode, effectiveDate, user);

            // Example 1
            //var salaryScale = _salaryScaleRepository.Queryable
            //    .Where(r => r.TitleCode == titleCode)
            //    .FirstOrDefault();

            //var salaryScale = SalaryScale.GetEffectiveSalaryScale(Repository, titleCode, DateTime.Now);

            // Example 2
            //var salaryScale = Repository.OfType<SalaryScale>()
            //    .Queryable
            //    .Where(r => r.TitleCode == titleCode)
            //    .FirstOrDefault();

            //if (salaryScale != null)
            //{
            //    salaryScale.SalarySteps = Repository.OfType<SalaryStep>()
            //        .Queryable
            //        .Where(s => s.TitleCode == salaryScale.TitleCode && s.EffectiveDate == salaryScale.EffectiveDate)
            //        .OrderBy(x => x.Annual)
            //        .ToList();

            //    salaryScaleModel.SalaryScale = salaryScale;
            //}

            // Other examples:
            // Note that this is now handled in the model directly.
            //var titles = Repository.OfType<Title>()
            //                      .Queryable
            //                      .Select(t => new { t.TitleCode, t.PayrollTitle })
            //                      .OrderBy(t => t.PayrollTitle)
            //                      .ToList() as IDictionary<string, string>;

            //salaryScaleModel.Titles = Repository.OfType<Title>()
            //                      .Queryable

            //                      .OrderBy(t => t.PayrollTitle)
            //                      .ToList();

            //salaryScaleModel.TitleCodes = Repository.OfType<Title>()
            //           .Queryable

            //           .OrderBy(t => t.TitleCode)
            //           .ToList();

            return PartialView(salaryScaleModel);
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

    ///// <summary>
    ///// ViewModel for the SalaryScale class
    ///// </summary>
    //public class SalaryScaleViewModel
    //{
    //    public string TitleCode { get; set; }

    //    public Title Title { get; set; }

    //    public IList<Title> Titles { get; set; }

    //    public IList<Title> TitleCodes { get; set; }

    //    public SalaryScale SalaryScale { get; set; }

    //    public static SalaryScaleViewModel Create(IRepository repository)
    //    {
    //        Check.Require(repository != null, "Repository must be supplied");

    //        var viewModel = new SalaryScaleViewModel { SalaryScale = new SalaryScale() };

    //        return viewModel;
    //    }
    //}
}