

using System;
using System.Collections;
using System.Linq;
using System.Web.Mvc;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Core.Utils;
using Esra.Core.Domain;
using UCDArch.Web.ActionResults;
using UCDArch.Web.Attributes;

namespace Esra.Web.Controllers
{
    /// <summary>
    /// Controller for the EmployeeAjax class
    /// </summary>
    public class EmployeeAjaxController : ApplicationController
    {
	    private readonly IRepository<Employee> _employeeRepository;

        public EmployeeAjaxController(IRepository<Employee> employeeRepository)
        {
            _employeeRepository = employeeRepository;
        }
    
        //
        // GET: /EmployeeAjax/
        public ActionResult Index(string[] titleCodes)
        {
            ViewBag.SelectedTitles = titleCodes;
            ViewBag.TitlesList = Repository.OfType<Title>()
                .Queryable
                .OrderBy(t => t.AbbreviatedName)
                .ToList();
                
            return View();
        }

        public ActionResult List()
        {
            var employees = from e in _employeeRepository.Queryable
                            select new EmployeeAjaxViewModel {Id = e.Id, FirstName = e.FirstName, LastName = e.LastName};

            var aa = new ArrayList();
            foreach (var employee in employees.Take(10).ToList())
            {
                aa.Add(new object[] { employee.Id, employee.FirstName, employee.LastName });
            }

            var data = new { aaData = aa };

            return Json(data, JsonRequestBehavior.AllowGet);
                
        }
    }

	/// <summary>
    /// ViewModel for the EmployeeAjax class
    /// </summary>
    public class EmployeeAjaxViewModel
	{
	    public string Id { get; set; }
	    
	    public string FirstName { get; set; }

	    public string LastName { get; set; }
	}
}
