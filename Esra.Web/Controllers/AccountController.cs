using System.Web.Mvc;
using System.Web.Security;
using Esra.Web.Helpers;
using UCDArch.Web.Authentication;

namespace Esra.Web.Controllers
{
    /// <summary>
    /// Controller for the Account class
    /// </summary>
    public class AccountController : Controller
    {
        public string Message
        {
            set { TempData["Message"] = value; }
        }

        public ActionResult LogOn(string returnUrl)
        {
            //string resultUrl = CASHelper.Login(); //Do the CAS Login

            //if (resultUrl != null)
            //{
            //    return Redirect(resultUrl);
            //}

            //TempData["URL"] = returnUrl;

            //return View();

            return CasMvc.LoginAndRedirect();
        }

        public ActionResult LogOut()
        {
            FormsAuthentication.SignOut();
            Session.Abandon();
            var myLogoutPage = "LoggedOut";
            var postBackUrl = "https://cas.ucdavis.edu/cas/logout?service=" + Request.Url.ToString().Substring(0, Request.Url.ToString().LastIndexOf("/") + 1) + myLogoutPage;

            return Redirect(postBackUrl);
        }

        public ActionResult LoggedOut()
        {
            return View();
        }

        public RedirectToRouteResult Emulate(string id /* Login ID*/)
        {
            if (User.IsInRole("EmulationUser"))
            {
                if (!string.IsNullOrEmpty(id))
                {
                    Message = "Emulating " + id;
                    FormsAuthentication.RedirectFromLoginPage(id, false);
                }
                else
                {
                    Message = "Login ID not provided.  Use /Emulate/login";
                }
            }
            else
            {
                Message = "You do not have permission to perform this action";
            }

            return RedirectToAction("Index", "Home");
        }
    }
}