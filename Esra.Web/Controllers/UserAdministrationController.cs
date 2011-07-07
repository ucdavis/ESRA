using System.Web.Mvc;
using Esra.Web.Controllers.Filters;

namespace Esra.Web.Controllers
{
    /// <summary>
    /// Controller for the UserAdmin class
    /// </summary>
    [AdminOnly]
    public class UserAdministrationController : ApplicationController
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}