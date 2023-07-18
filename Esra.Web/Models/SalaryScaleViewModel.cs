using System;
using System.Collections.Generic;
using System.Linq;
using Esra.Core.Domain;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Core.Utils;

namespace Esra.Web.Models
{
    public class SalaryScaleViewModel
    {
        public string TitleCode { get; set; }

        public Title Title { get; set; }

        public IList<Title> Titles { get; set; }

        public IList<Title> TitleCodes { get; set; }

        public SalaryScale SalaryScale { get; set; }

        public IList<CollegeAverage> CollegeAverages { get; set; }

        public double CampusAverage { get; set; }

        public static SalaryScaleViewModel Create(IRepository repository)
        {
            return SalaryScaleViewModel.Create(repository, null, null, null);
        }

        public static SalaryScaleViewModel Create(IRepository repository, string titleCode, string effectiveDate, User user)
        {
            Check.Require(repository != null, "Repository must be supplied");

            var viewModel = new SalaryScaleViewModel
            {
                SalaryScale = new SalaryScale(),
                Titles = repository.OfType<Title>()
                                  .Queryable
                                  .OrderBy(t => t.AbbreviatedName)
                    // .ThenBy(t => t.TitleCode)
                                  .ToList()
            };
            viewModel.TitleCodes = viewModel.Titles
                       .OrderBy(t => t.TitleCode)
                       .ToList();

            if (!String.IsNullOrEmpty(titleCode))
            {
                var searchDate = DateTime.Now;
                if (effectiveDate != null)
                    DateTime.TryParse(effectiveDate, out searchDate);
                var salaryScale = SalaryScale.GetEffectiveSalaryScale(repository, titleCode, searchDate);
                if (salaryScale != null) viewModel.SalaryScale = salaryScale;
                viewModel.TitleCode = titleCode;

                var schoolsForUser = user.Units.Select(x => x.DeansOfficeSchoolCode).Distinct().ToArray();
                viewModel.CollegeAverages =
                    repository.OfType<CollegeAverage>().Queryable.Where(x => schoolsForUser.Contains(x.SchoolCode) && x.TitleCode == viewModel.TitleCode).
                        ToList();
            }

            return viewModel;
        }
    }
}