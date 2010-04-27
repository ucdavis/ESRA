using System.Collections.Generic;
using System.ComponentModel;
using CAESArch.BLL;
using CAESDO.Esra.Core.DataInterfaces;
using CAESDO.Esra.Core.Domain;

namespace CAESDO.Esra.BLL
{
    [DataObject]
    public class EmployeeChangesBLL : GenericBLL<EmployeeChanges, int>
    {
       public static EmployeeChanges GetLatestChange(string employeeID)
       {
           return GetLatestChangeOfType(employeeID, null);
       }

       public static EmployeeChanges GetLatestChangeOfType(string employeeID, int? changeTypeID)
       {
           EmployeeChanges retval = null;

           IList<EmployeeChanges> changes = daoFactory.GetEmployeeChangesDao().GetLatestChanges(employeeID, changeTypeID, 1);

           if (changes != null && changes.Count == 1)
               retval = changes[0];

           return retval;
       }

       public static IList<EmployeeChanges> GetLatestChanges(string employeeID, int? maxNumChanges)
       {
           return GetLatestChangesOfType(employeeID, null, maxNumChanges);
       }

       public static IList<EmployeeChanges> GetLatestChangesOfType(string employeeID, int? changeTypeID, int? maxNumChanges)
       {
           return daoFactory.GetEmployeeChangesDao().GetLatestChanges(employeeID, changeTypeID, maxNumChanges);
       }  
    }
}
