using System;
using System.Collections.Generic;
using CAESDO.Esra.Core.Domain;

namespace CAESDO.Esra.BLL
{
    public class TitleBLL : GenericBLL<Title, string>
    {

        public static Title GetByTitleCode(string id)
        {
            Title retval = null;

            if (String.IsNullOrEmpty(id) == false && id.Equals("0") == false)
            {
                retval = GetByID(id);
            }

            return retval;
        }

        public IList<string> GetDistinctTitleCodesWithSalarySteps()
        {
            return GetDistinctTitleCodesWithSalarySteps("TitleCode", true) as List<string>;
        }

        public static IList<string> GetDistinctTitleCodesWithSalarySteps(string propertyName, bool ascending)
        {
            return daoFactory.GetTitleDao().GetDistinctTitleCodesWithSalarySteps(propertyName, ascending);
        }

        public static IList<Title> GetDistinctPayrollTitlesWithSalarySteps(string propertyName, bool ascending)
        {
            return daoFactory.GetTitleDao().GetDistinctPayrollTitlesWithSalarySteps(propertyName, ascending);
        }
    }
}
