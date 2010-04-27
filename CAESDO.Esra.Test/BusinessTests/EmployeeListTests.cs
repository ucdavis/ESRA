using System.Collections.Generic;
using CAESDO.Esra.BLL;
using CAESDO.Esra.Core.Domain;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace CAESDO.Esra.Test.BusinessTests
{
    [TestClass]
    public class EmployeeListTests : DatabaseTestBase
    {
        [TestMethod]
        public void GetAllEmployees()
        {
            List<Employee> allEmployees = EmployeeBLL.GetAll();

            Assert.IsNotNull(allEmployees);
            Assert.AreEqual(20, allEmployees.Count);
        }
    }
}
