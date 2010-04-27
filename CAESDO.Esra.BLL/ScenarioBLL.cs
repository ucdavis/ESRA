using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using CAESDO.Esra.Core.DataInterfaces;
using CAESDO.Esra.Core.Domain;
using CAESDO.Esra.Data;

namespace CAESDO.Esra.BLL
{
    public class ScenarioBLL : GenericBLL<Scenario, int>
    {
       public static IList<Scenario> GetBySalaryReviewAnalysisID(int sarID)
       {
           IList<Scenario> retval = null;

           Scenario scenario = new Scenario() { SalaryReviewAnalysisID = sarID };
           retval = GetByInclusionExample(scenario, "ScenarioNumber", true, "SalaryReviewAnalysisID");

           return retval;
       }
    }
}
