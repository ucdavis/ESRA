using CAESArch.BLL;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using CAESDO.Esra.BLL;
using System;

namespace CAESDO.Esra.Test.DomainTests
{
    [TestClass]
    public class EmployeeTests : DatabaseTestBase
    {
        [TestMethod]
        public void Tester()
        {
            var emps = EmployeeBLL.GetAll();
            var employee = emps[0];

            employee.CareerHireDate = DateTime.Now;
            employee.CareerDateHasBeenAdjusted = true;

            using (var ts = new TransactionScope())
            {
                EmployeeBLL.EnsurePersistent(employee);

                ts.CommitTransaction();
            }

        }
    }
}
