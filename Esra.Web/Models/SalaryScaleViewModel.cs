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

        public static SalaryScaleViewModel Create(IRepository repository)
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

            return viewModel;
        }
    }
}