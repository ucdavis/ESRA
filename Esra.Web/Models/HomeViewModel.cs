using System;
using System.Web.Configuration;
using Esra.Core.Domain;
using Esra.Web.Resources;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Core.Utils;

namespace Esra.Web.Models
{
    public class HomeViewModel
    {
        public string DemoUserRole { get; set; }

        public bool IsDemoMode { get; set; }

        public string MenuViewName { get; set; }

        public User User { get; set; }

        public static HomeViewModel Create(IRepository repository)
        {
            Check.Require(repository != null, "Repository must be supplied");

            var viewModel = new HomeViewModel
                                {
                                    DemoUserRole = String.Empty,
                                    MenuViewName = String.Empty,
                                    IsDemoMode = (String.IsNullOrEmpty(WebConfigurationManager.AppSettings["ApplicationMode"]) == false &&
                WebConfigurationManager.AppSettings["ApplicationMode"] == GlobalConstants.MODE_DEMO ? true : false)
                                };

            return viewModel;
        }
    }
}