using System;
using System.Linq;
using System.Web.Mvc;
using Esra.Core.Domain;
using Esra.Web.Resources;
using UCDArch.Core.PersistanceSupport;

namespace Esra.Web.Controllers
{
    public class HomeController : ApplicationController
    {
        private readonly IRepository<Roles> _rolesRepository;

        public HomeController(IRepository<Roles> rolesRepository)
        {
            _rolesRepository = rolesRepository;
        }

        [HttpGet]
        public ActionResult Index()
        {
            return Index(null);
        }

        [HttpPost]
        public ActionResult Index(string[] demoRoles)
        {
            var viewModel = Models.HomeViewModel.Create(Repository);
            var demoRole = "";
            var menuViewName = "";

            ViewBag.Message = (viewModel.IsDemoMode ? "Welcome to ESRA MVC Demo!" : "Welcome to ESRA MVC!");

            if (demoRoles != null && demoRoles.Count() == 1)
            {
                demoRole = demoRoles[0];
            }

            if (!String.IsNullOrEmpty(demoRole) && viewModel.IsDemoMode)
            {
                viewModel.DemoUserRole = demoRole;

                if (demoRole.Equals(GlobalConstants.ROLE_ADMIN))
                {
                    menuViewName = "_AdminMenu";
                }
                else if (demoRole.Equals(GlobalConstants.ROLE_DO_USER))
                {
                    menuViewName = "_DeansOfficeMenu";
                }
                else if (demoRole.Equals(GlobalConstants.ROLE_REVIEWER))
                {
                    menuViewName = "_ReviewerMenu";
                }
                else
                {
                    menuViewName = "_DepartmentsMenu";
                    viewModel.IsDepartmentUser = true;
                    Session.Add(GlobalConstants.KEY_IS_DEPARTMENT_USER, true);
                    ;
                }
            }
            else
            {
                if (User.IsInRole(GlobalConstants.ROLE_ADMIN))
                {
                    menuViewName = "_AdminMenu";
                }
                else if (User.IsInRole(GlobalConstants.ROLE_DO_USER))
                {
                    menuViewName = "_DeansOfficeMenu";
                }
                else if (User.IsInRole(GlobalConstants.ROLE_REVIEWER))
                {
                    menuViewName = "_ReviewerMenu";
                }
                else
                {
                    menuViewName = "_DepartmentsMenu";
                    viewModel.IsDepartmentUser = true;
                    Session.Add(GlobalConstants.KEY_IS_DEPARTMENT_USER, true);
                }
            }

            viewModel.MenuViewName = menuViewName;

            return View(viewModel);
        }

        public ActionResult _DemoMenu(string demoRole)
        {
            var viewModel = Models.HomeViewModel.Create(Repository);
            viewModel.User = Repository.OfType<User>().
                Queryable.
                Where(r => r.LoginID == User.Identity.Name)
                .FirstOrDefault();
            var viewName = "";

            if (!String.IsNullOrEmpty(demoRole) && viewModel.IsDemoMode)
            {
                viewModel.DemoUserRole = demoRole;

                if (demoRole.Equals(GlobalConstants.ROLE_ADMIN))
                {
                    viewName = "_AdminMenu";
                }
                else if (demoRole.Equals(GlobalConstants.ROLE_DO_USER))
                {
                    viewName = "_DeansOfficeMenu";
                }
                else if (demoRole.Equals(GlobalConstants.ROLE_REVIEWER))
                {
                    viewName = "_ReviewerMenu";
                }
                else
                {
                    viewName = "_DepartmentsMenu";
                    viewModel.User.IsDepartmentUser = true;
                    viewModel.IsDepartmentUser = true;
                    Session.Add(GlobalConstants.KEY_IS_DEPARTMENT_USER, true);
                    //TempData.Add("IsDepartmentUser", true);
                }

                viewModel.MenuViewName = viewName;
            }

            return PartialView(viewName, viewModel);
        }

        public ActionResult About()
        {
            return View();
        }

        public ActionResult Sample()
        {
            return View();
        }
    }
}