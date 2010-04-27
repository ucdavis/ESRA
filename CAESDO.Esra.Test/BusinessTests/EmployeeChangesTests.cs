using System;
using System.Collections.Generic;
using CAESArch.BLL;
using CAESDO.Esra.BLL;
using CAESDO.Esra.Core.Domain;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace CAESDO.Esra.Test.BusinessTests
{
    [TestClass]
    public class EmployeeChangesTests : DatabaseTestBase
    {
        private const string TestEmployeeID = "9999999994722";
        private const string TestEmployee2ID = "9999999924722";

        [TestMethod]
        public void GetAllChangesForValidEmployee()
        {
            var changes = EmployeeChangesBLL.GetLatestChanges(TestEmployeeID, null);

            Assert.IsNotNull(changes);
            Assert.AreEqual(5, changes.Count);
        }

        [TestMethod]
        public void GetNChangesForEmployee()
        {
            var changes = EmployeeChangesBLL.GetLatestChanges(TestEmployeeID, 3);

            Assert.IsNotNull(changes);
            Assert.AreEqual(3, changes.Count);
        }

        [TestMethod]
        public void GetNChangesOfTypeForEmployee()
        {
            var changes = EmployeeChangesBLL.GetLatestChangesOfType(TestEmployeeID, 2, 3);

            Assert.IsNotNull(changes);
            Assert.AreEqual(1, changes.Count);
            Assert.AreNotEqual(3, changes[0].ChangeType.ID);
        }

        [TestMethod]
        public void GetNoChangesOfBogusTypeForEmployee()
        {
            var changes = EmployeeChangesBLL.GetLatestChangesOfType(TestEmployeeID, 6, 3);

            Assert.IsNotNull(changes);
            Assert.AreEqual(0, changes.Count);
        }

        [TestMethod]
        public void GetNullForBadEmployee()
        {
            var changes = EmployeeChangesBLL.GetLatestChanges("1111111114722", null);

            Assert.AreEqual(0, changes.Count);
        }

        public override void LoadData()
        {
            base.LoadData();

            using (var ts = new TransactionScope())
            {
                CreateChangeTypes();
                CreateChanges();
   
                ts.CommitTransaction();
            }
        }

        private static void CreateChanges()
        {
            var employee = EmployeeBLL.GetByID(TestEmployeeID);

            for (int i = 0; i < 5; i++)
            {
                var changes = new EmployeeChanges
                {
                    Employee = employee,
                    ChangeType = GenericBLLBase<ChangeType, int>.GetByID(i),
                    DateChanged = DateTime.Now.AddDays(i),
                    Comments = "Something" + i.ToString()
                 };

                EmployeeChangesBLL.EnsurePersistent(changes);   
            }

            employee = EmployeeBLL.GetByID(TestEmployee2ID);

            for (int i = 0; i < 5; i++)
            {
                var changes = new EmployeeChanges
                {
                    Employee = employee,
                    ChangeType = GenericBLLBase<ChangeType, int>.GetByID(i),
                    DateChanged = DateTime.Now.AddDays(i),
                    Comments = "Something" + i.ToString()
                };

                EmployeeChangesBLL.EnsurePersistent(changes);
            }
        }

        private static void CreateChangeTypes()
        {
            ChangeType type = null;

            type = new ChangeType() { Type = "CareerHireDate" };
            GenericBLLBase<ChangeType,int>.EnsurePersistent(type);

            type = new ChangeType() { Type = "ApptHireDate" };
            GenericBLLBase<ChangeType,int>.EnsurePersistent(type);

            type = new ChangeType() { Type = "ExperienceBeginDate" };
            GenericBLLBase<ChangeType,int>.EnsurePersistent(type);

            type = new ChangeType() { Type = "DepartmentComments" };
            GenericBLLBase<ChangeType,int>.EnsurePersistent(type);

            type = new ChangeType() { Type = "DeansOfficeComments" };
            GenericBLLBase<ChangeType,int>.EnsurePersistent(type);
        }
    }
}
