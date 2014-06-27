using UCDArch.Core.PersistanceSupport;
using UCDArch.Core.Utils;

namespace Esra.Web.Models
{
    public class EmployeeComparisonViewModel_bak
    {
        public EmployeeSalaryComparisonViewModel EmployeeViewModel { get; set; }

        public SalaryScaleViewModel SalaryScaleViewModel { get; set; }

        public static EmployeeComparisonViewModel_bak Create(IRepository repository)
        {
            Check.Require(repository != null, "Repository must be supplied");

            var viewModel = new EmployeeComparisonViewModel_bak
                                {
                                };

            return viewModel;
        }
    }
}