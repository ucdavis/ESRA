using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using CAESDO.Esra.Core.DataInterfaces;
using CAESDO.Esra.Core.Domain;
using CAESDO.Esra.Data;

namespace CAESDO.Esra.BLL
{
    public class EmployeeBLL : GenericBLL<Employee, int>
    {
        public static IList<Employee> GetByTitleCode(string titleCode, string propertyName, bool ascending)
        {
            return EmployeeBLL.daoFactory.GetEmployeeDao().GetByTitleCode(titleCode, propertyName, ascending);
        }
    }
}
