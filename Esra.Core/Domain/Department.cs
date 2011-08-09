using System;
using System.Collections.Generic;
using System.Linq;
using FluentNHibernate.Mapping;
using UCDArch.Core.DomainModel;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Core.Utils;

namespace Esra.Core.Domain
{
    [Serializable]
    public class Department : DomainObjectWithTypedId<string>, IComparable<Department>
    {
        private string _DepartmentNumber;

        public virtual string DepartmentNumber
        {
            get { return _DepartmentNumber; }
            set { _DepartmentNumber = value; }
        }

        private string _Name;

        public virtual string Name
        {
            get { return _Name; }
            set { _Name = value; }
        }

        public virtual string Name_DepartmentNumber
        {
            get
            {
                if (String.IsNullOrEmpty(_DepartmentNumber) == false)
                    return _Name + " (" + _DepartmentNumber + ")";
                else
                    return _Name;
            }
        }

        private string _ShortName;

        public virtual string ShortName
        {
            get { return _ShortName; }
            set { _ShortName = value; }
        }

        private string _SchoolCode;

        public virtual string SchoolCode
        {
            get { return _SchoolCode; }
            set { _SchoolCode = value; }
        }

        /// <summary>
        /// This is a covering school code to deal with
        /// Deans Offices having more than a
        /// single school code.
        /// </summary>
        private string _DeansOfficeSchoolCode;

        public virtual string DeansOfficeSchoolCode
        {
            get { return _DeansOfficeSchoolCode; }
            set { _DeansOfficeSchoolCode = value; }
        }

        private IList<Employee> _Employees;

        public virtual IList<Employee> Employees
        {
            get { return _Employees; }
            set { _Employees = value; }
        }

        public virtual int CompareTo(Department item)
        {
            return this.Name.CompareTo(item.Name);
        }

        public virtual bool Equals(Department other)
        {
            if (this.Name == other.Name)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public Department()
        {
        }

        public static IList<Department> GetAllForUser(IRepository repository, User user, bool isDepartmentUser, string sortPropertyName, bool isAscending)
        {
            Check.Require(repository != null, "Repository must be supplied");

            var departments = new List<Department>();

            if (isDepartmentUser)
            {
                departments.AddRange(user.Units.Select(unit => repository.OfType<Department>()
                    .Queryable
                    .Where(d => d.Id.Equals(unit.PPSCode))
                    .FirstOrDefault()));
            }
            else
            {
                var schoolsForUser = user.Units.Select(x => x.DeansOfficeSchoolCode).Distinct().ToArray();

                departments =
                    repository.OfType<Department>().Queryable.Where(
                        x => schoolsForUser.Contains(x.DeansOfficeSchoolCode)).ToList();
            }

            departments.Sort();
            if (!isAscending)
                departments.Reverse();

            return departments;
        }

        public static IList<Department> GetAllForUser(IRepository repository, string userId, string sortPropertyName, bool isAscending)
        {
            Check.Require(repository != null, "Repository must be supplied");

            // lookup user:
            User user = User.GetByEmployeeId(repository, userId);

            // assume non-department user, so pass isDepartmentUser parameter to false:
            return GetAllForUser(repository, user, false, sortPropertyName, isAscending);
        }
    }

    public class DepartmentMap : ClassMap<Department>
    {
        public DepartmentMap()
        {
            Id(x => x.Id, "DepartmentNumber")
               .UnsavedValue("0")
               .GeneratedBy.Assigned()
               .CustomType("string")
               .Length(6);

            Map(x => x.DepartmentNumber);
            Map(x => x.Name);
            Map(x => x.ShortName);
            Map(x => x.SchoolCode);
            Map(x => x.DeansOfficeSchoolCode);

            HasMany(x => x.Employees)
                .Table("UCDEmployees")
                .AsBag()
                .Inverse()
                .Cascade.None()
                .KeyColumn("HomeDept");
        }
    }
}