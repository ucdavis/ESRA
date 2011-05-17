using System;
using System.Collections.Generic;
using UCDArch.Core.DomainModel;

namespace Esra.Core.Domain
{
    [Serializable]
    public abstract class UCDEmployee : DomainObjectWithTypedId<string>, IComparable<UCDEmployee>
    {
        // Beginning of nested classes.

        // Nested class to do ascending sort on Admin Department property.
        protected class sortAdminDepartmentAscendingHelper : IComparer<UCDEmployee>
        {
            #region IComparer<UCDEmployee> Members

            public int Compare(UCDEmployee x, UCDEmployee y)
            {
                /*
                *
                * If the employees are in the same department return the employeeOrder.
                *
                * If the employees are in different departments return the deptOrder.
                *
                * */

                int deptOrder = String.Compare(x.AdminDepartment.Name, y.AdminDepartment.Name);
                if (deptOrder == 0)
                    return String.Compare(x.FullName, y.FullName);
                else
                    return deptOrder;
            }

            #endregion IComparer<UCDEmployee> Members
        }

        // Nested class to do descending sort on on Admin Department property.
        protected class sortAdminDepartmentDescendingHelper : IComparer<UCDEmployee>
        {
            #region IComparer<UCDEmployee> Members

            public int Compare(UCDEmployee x, UCDEmployee y)
            {
                int deptOrder = String.Compare(y.AdminDepartment.Name, x.AdminDepartment.Name);
                if (deptOrder == 0)
                    return String.Compare(x.FullName, y.FullName);
                else
                    return deptOrder;
            }

            #endregion IComparer<UCDEmployee> Members
        }

        // Nested class to do ascending sort on Home Department property.
        protected class sortHomeDepartmentAscendingHelper : IComparer<UCDEmployee>
        {
            #region IComparer<UCDEmployee> Members

            public int Compare(UCDEmployee x, UCDEmployee y)
            {
                /*
                *
                * If the employees are in the same department return the employeeOrder.
                *
                * If the employees are in different departments return the deptOrder.
                *
                * */

                int deptOrder = String.Compare(x.HomeDepartment.Name, y.HomeDepartment.Name);
                if (deptOrder == 0)
                    return String.Compare(x.FullName, y.FullName);
                else
                    return deptOrder;
            }

            #endregion IComparer<UCDEmployee> Members
        }

        // Nested class to do descending sort on on Home Department property.
        protected class sortHomeDepartmentDescendingHelper : IComparer<UCDEmployee>
        {
            #region IComparer<UCDEmployee> Members

            public int Compare(UCDEmployee x, UCDEmployee y)
            {
                int deptOrder = String.Compare(y.HomeDepartment.Name, x.HomeDepartment.Name);
                if (deptOrder == 0)
                    return String.Compare(x.FullName, y.FullName);
                else
                    return deptOrder;
            }

            #endregion IComparer<UCDEmployee> Members
        }

        // Nested class to do ascending sort on on Title.TitleCode property.
        protected class sortTitleAscendingHelper : IComparer<UCDEmployee>
        {
            #region IComparer<UCDEmployee> Members

            public int Compare(UCDEmployee x, UCDEmployee y)
            {
                int titleOrder = String.Compare(x.Title.TitleCode, y.Title.TitleCode);
                if (titleOrder == 0)
                    return String.Compare(x.FullName, y.FullName);
                else
                    return titleOrder;
            }

            #endregion IComparer<UCDEmployee> Members
        }

        // Nested class to do descending sort on on Title.TitleCode property.
        protected class sortTitleDescendingHelper : IComparer<UCDEmployee>
        {
            #region IComparer<UCDEmployee> Members

            public int Compare(UCDEmployee x, UCDEmployee y)
            {
                int titleOrder = String.Compare(y.Title.TitleCode, x.Title.TitleCode);
                if (titleOrder == 0)
                    return String.Compare(x.FullName, y.FullName);
                else
                    return titleOrder;
            }

            #endregion IComparer<UCDEmployee> Members
        }

        // End of nested classes.
        protected string _EmployeeID;

        public virtual string EmployeeID
        {
            get { return _EmployeeID; }
            set { _EmployeeID = value; }
        }

        protected string _HomeDepartmentID;

        public virtual string HomeDepartmentID
        {
            get { return _HomeDepartmentID; }
            set { _HomeDepartmentID = value; }
        }

        protected Department _HomeDepartment;

        public virtual Department HomeDepartment
        {
            get { return _HomeDepartment; }
            set { _HomeDepartment = value; }
        }

        protected string _WorkDepartmentID;

        public virtual string WorkDepartmentID
        {
            get { return _WorkDepartmentID; }
            set { _WorkDepartmentID = value; }
        }

        protected Department _WorkDepartment;

        public virtual Department WorkDepartment
        {
            get { return _WorkDepartment; }
            set { _WorkDepartment = value; }
        }

        protected string _AdminDepartmentID;

        public virtual string AdminDepartmentID
        {
            get { return _AdminDepartmentID; }
            set { _AdminDepartmentID = value; }
        }

        protected Department _AdminDepartment;

        public virtual Department AdminDepartment
        {
            get { return _AdminDepartment; }
            set { _AdminDepartment = value; }
        }

        protected bool? _Different;

        public virtual bool? Different
        {
            get { return (_Different == null ? false : _Different); }
            set { _Different = value; }
        }

        protected string _FullName;

        public virtual string FullName
        {
            get { return _FullName; }
            set { _FullName = value; }
        }

        protected string _FirstName;

        public virtual string FirstName
        {
            get { return _FirstName; }
            set { _FirstName = value; }
        }

        protected string _MiddleName;

        public virtual string MiddleName
        {
            get { return _MiddleName; }
            set { _MiddleName = value; }
        }

        protected string _LastName;

        public virtual string LastName
        {
            get { return _LastName; }
            set { _LastName = value; }
        }

        protected Title _Title;

        public virtual Title Title
        {
            get { return _Title; }
            set { _Title = value; }
        }

        protected string _TitleCode;

        public virtual string TitleCode
        {
            get { return _TitleCode; }
            set { _TitleCode = value; }
        }

        protected DateTime _HireDate;

        public virtual DateTime HireDate
        {
            get { return _HireDate; }
            set { _HireDate = value; }
        }

        protected DateTime _BeginDate;

        public virtual DateTime BeginDate
        {
            get { return _BeginDate; }
            set { _BeginDate = value; }
        }

        protected ApptType _ApptType;

        public virtual ApptType ApptType
        {
            get { return _ApptType; }
            set { _ApptType = value; }
        }

        protected double _PayRate;

        public virtual double PayRate
        {
            get { return _PayRate; }
            set { _PayRate = value; }
        }

        protected string _SalaryGrade;

        public virtual string SalaryGrade
        {
            get { return _SalaryGrade; }
            set { _SalaryGrade = value; }
        }

        protected string _SalaryStep;

        public virtual string SalaryStep
        {
            get { return _SalaryStep; }
            set { _SalaryStep = value; }
        }

        protected string _BargainingUnitCode;

        public virtual string BargainingUnitCode
        {
            get { return _BargainingUnitCode; }
            set { _BargainingUnitCode = value; }
        }

        public virtual int CompareTo(UCDEmployee item)
        {
            return String.Compare(this.FullName, item.FullName);
        }

        // Method to return IComparer object for sort helper.
        public static IComparer<UCDEmployee> sortAdminDepartmentAscending()
        {
            return (IComparer<UCDEmployee>)new sortAdminDepartmentAscendingHelper();
        }

        // Method to return IComparer object for sort helper.
        public static IComparer<UCDEmployee> sortAdminDepartmentDescending()
        {
            return (IComparer<UCDEmployee>)new sortAdminDepartmentDescendingHelper();
        }

        // Method to return IComparer object for sort helper.
        public static IComparer<UCDEmployee> sortHomeDepartmentAscending()
        {
            return (IComparer<UCDEmployee>)new sortHomeDepartmentAscendingHelper();
        }

        // Method to return IComparer object for sort helper.
        public static IComparer<UCDEmployee> sortHomeDepartmentDescending()
        {
            return (IComparer<UCDEmployee>)new sortHomeDepartmentDescendingHelper();
        }

        // Method to return IComparer object for sort helper.
        public static IComparer<UCDEmployee> sortTitleAscending()
        {
            return (IComparer<UCDEmployee>)new sortTitleAscendingHelper();
        }

        // Method to return IComparer object for sort helper.
        public static IComparer<UCDEmployee> sortTitleDescending()
        {
            return (IComparer<UCDEmployee>)new sortTitleDescendingHelper();
        }

        public virtual bool Equals(UCDEmployee other)
        {
            if (this.FullName == other.FullName)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public UCDEmployee()
        {
        }
    }
}