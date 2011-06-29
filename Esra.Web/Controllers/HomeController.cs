using System.Web.Mvc;

namespace Esra.Web.Controllers
{
    public class HomeController : ApplicationController
    {
        public ActionResult Index()
        {
            ViewBag.Message = "Welcome to ASP.NET MVC!";

            return View();
        }

        public ActionResult About()
        {
            return View();
        }

        public ActionResult UserAdmin()
        {
            return View();
        }

        public ActionResult Sample()
        {
            return View();
        }
    }
}