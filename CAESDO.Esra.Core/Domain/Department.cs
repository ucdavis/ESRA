using System;
using System.Collections.Generic;
using System.Text;

namespace CAESDO.Esra.Core.Domain
{
    [Serializable]
    public class Department : DomainObject<Department, string>, IComparable<Department>
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

        private string _ShortName;

        public virtual string ShortName
        {
            get { return _ShortName; }
            set { _ShortName = value; }
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
}
