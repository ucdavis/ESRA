using System.Collections.Generic;
using CAESDO.Esra.Core.Domain;

namespace CAESDO.Esra.BLL
{
    public class ScenarioBLL : GenericBLL<Scenario, int>
    {
        public static IList<Scenario> GetBySalaryReviewAnalysisID(int sraID)
        {
            IList<Scenario> retval = null;

            Scenario scenario = new Scenario() { SalaryReviewAnalysisID = sraID };
            retval = GetByInclusionExample(scenario, "ScenarioNumber", true, "SalaryReviewAnalysisID");

            return retval;
        }
    }
}
