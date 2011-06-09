﻿using System;
using System.Collections.Generic;
using FluentNHibernate.Mapping;
using UCDArch.Core.DomainModel;

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

            HasMany(x => x.Employees)
                .Table("UCDEmployees")
                .AsBag()
                .Inverse()
                .Cascade.None()
                .KeyColumn("HomeDept");
        }
    }
}