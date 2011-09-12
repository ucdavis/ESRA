using System;
using System.Collections.Generic;
using System.Linq;
using UCDArch.Core.DomainModel;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Core.Utils;

namespace Esra.Core.Domain
{
    [Serializable]
    public sealed class SchoolEmployees : DomainObject
    {
        private static volatile SchoolEmployees _instance;

        private static readonly object SyncRoot = new object();

        private SchoolEmployees()
        {
        }

        public static SchoolEmployees Instance
        {
            get
            {
                if (_instance == null)
                {
                    lock (SyncRoot)
                    {
                        if (_instance == null)
                            _instance = new SchoolEmployees();
                    }
                }
                return _instance;
            }
        }

        private static IDictionary<string, IList<Employee>> Employees
        {
            get;
            set;
        }

        // For future use in checking what schools employees have been loaded for.
        public static IList<string> SchoolCodes { get; set; }

        private static DateTime? MaxLastChangeDate { get; set; }  // Not currently used.

        private static DateTime? LastRefreshed { get; set; }

        private static void LoadEmployees(IRepository repository)
        {
            if (Employees == null) Employees = new Dictionary<string, IList<Employee>>();

            var schoolCodes = repository.OfType<Unit>().Queryable.Select(x => x.DeansOfficeSchoolCode).Distinct().ToArray();
            SchoolCodes = schoolCodes;  // For future use in checking what schools employees have been loaded for.

            var deptCodes =
                    repository.OfType<Department>().Queryable.Where(
                        x => schoolCodes.Contains(x.DeansOfficeSchoolCode)).Select(y => y.Id).ToList();

            var allEmployees = repository.OfType<Employee>().GetAll();

            //MaxLastChangeDate = allEmployees.Select(x => x.LastChangeDate).Max();
            //LastRefreshed = DateTime.Now;

            foreach (var code in schoolCodes)
            {
                // Add all employees who have a home department within the school:
                Employees.Add(code, allEmployees.Where(d => deptCodes.Contains(d.HomeDepartmentID)).OrderBy(x => x.FullName).ToList());
            }
        }

        public static IList<Employee> GetAllForSchoolCode(IRepository repository, string schoolCode)
        {
            return GetAllForSchoolCodes(repository, new string[] { schoolCode });
        }

        public static IList<Employee> GetAllForSchoolCodes(IRepository repository, string[] schoolCodes)
        {
            Check.Require(repository != null, "Repository must be supplied");

            var retval = new List<Employee>();

            // if employees is null or refresh date < 4AM of current day
            var nowDate = DateTime.Now.Date;
            var todayAtFourAm = new DateTime(nowDate.Year, nowDate.Month, nowDate.Day, 4, 0, 0);
            if (Employees == null || LastRefreshed == null || todayAtFourAm.CompareTo((DateTime)LastRefreshed) == 1)
            {
                LoadEmployees(repository);
            }

            foreach (var schoolCode in schoolCodes)
            {
                retval.AddRange(Employees[schoolCode]);
            }

            return retval;
        }
    }
}