using UCDArch.Core.PersistanceSupport;
using UCDArch.Core.Utils;

namespace Esra.Web.Models
{
    public class HomeViewModel
    {
        public static HomeViewModel Create(IRepository repository)
        {
            Check.Require(repository != null, "Repository must be supplied");

            var viewModel = new HomeViewModel { };

            return viewModel;
        }
    }
}