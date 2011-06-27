using System.Collections.Generic;
using Esra.Core.Domain;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Core.Utils;

namespace Esra.Web.Models
{
    /// <summary>
    /// ViewModel for the SalaryReviewAnalysis class
    /// </summary>
    public class SalaryReviewAnalysisViewModel
    {
        public IList<Employee> Employees { get; set; }

        public SalaryReviewAnalysis SalaryReviewAnalysis { get; set; }

        public static SalaryReviewAnalysisViewModel Create(IRepository repository)
        {
            Check.Require(repository != null, "Repository must be supplied");

            var viewModel = new SalaryReviewAnalysisViewModel { SalaryReviewAnalysis = new SalaryReviewAnalysis() };

            return viewModel;
        }
    }
}