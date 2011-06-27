using UCDArch.Web.Attributes;
using UCDArch.Web.Controller;
using System.Web.Mvc;

namespace Esra.Web.Controllers
{
    [Version(MajorVersion = 2)]
    [Authorize]
    public class ApplicationController : SuperController { }
}