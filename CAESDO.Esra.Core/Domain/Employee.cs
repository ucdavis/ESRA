using System;
using System.Collections.Generic;
using System.Text;
using System.Globalization;

namespace CAESDO.Esra.Core.Domain
{
    [Serializable]
    public class Employee : UCDEmployee, IComparable<Employee>
    {
        // Beginning of nested classes.

        // Nested class to do ascending sort on Home Department property.
        protected class sortHomeDepartmentAscendingHelper : IComparer<Employee>
        {
            #region IComparer<Employee> Members

            public int Compare(Employee x, Employee y)
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

            #endregion
        }

        // Nested class to do descending sort on on Home Department property.
        protected class sortHomeDepartmentDescendingHelper : IComparer<Employee>
        {
            #region IComparer<Employee> Members

            public int Compare(Employee x, Employee y)
            {
                int deptOrder = String.Compare(y.HomeDepartment.Name, x.HomeDepartment.Name);
                if (deptOrder == 0)
                    return String.Compare(x.FullName, y.FullName);
                else
                    return deptOrder;
            }

            #endregion
        }

        // Nested class to do ascending sort on on Title.TitleCode property.
        protected class sortTitleAscendingHelper : IComparer<Employee>
        {
            #region IComparer<Employee> Members

            public int Compare(Employee x, Employee y)
            {
                int titleOrder = String.Compare(x.Title.TitleCode, y.Title.TitleCode);
                if (titleOrder == 0)
                    return String.Compare(x.FullName, y.FullName);
                else
                    return titleOrder;
            }

            #endregion
        }

        // Nested class to do descending sort on on Title.TitleCode property.
        protected class sortTitleDescendingHelper : IComparer<Employee>
        {
            #region IComparer<Employee> Members

            public int Compare(Employee x, Employee y)
            {
                int titleOrder = String.Compare(y.Title.TitleCode, x.Title.TitleCode);
                if (titleOrder == 0)
                    return String.Compare(x.FullName, y.FullName);
                else
                    return titleOrder;
            }

            #endregion
        }

        // End of nested classes.

        protected bool _CareerDateHasBeenAdjusted;
        // Not a database field.
        public virtual bool CareerDateHasBeenAdjusted
        {
            get
            {
                if (_CareerHireDate == null)
                    return false;
                else if (_CareerHireDate == _HireDate)
                    return false;
                else
                    return true;
            }
            set { _CareerDateHasBeenAdjusted = value; }
        }

        // Not a database field.
        public virtual DateTime AdjustedCareerHireDate
        {
            get
            {
                if (_CareerHireDate != null)
                {
                    return (DateTime)_CareerHireDate;
                }
                else
                {
                    return _HireDate;
                }
            }
            set { _CareerHireDate = value; }
        }

        protected bool _ApptDateHasBeenAdjusted;
        // Not a database field.
        public virtual bool ApptDateHasBeenAdjusted
        {
            get
            {
                if (_ApptHireDate == null)
                    return false;
                else if (_ApptHireDate == _BeginDate)
                    return false;
                else
                    return true;
            }
            set { _ApptDateHasBeenAdjusted = value; }
        }
        // Not a database field
        public virtual DateTime AdjustedApptHireDate
        {
            get
            {
                if (_ApptHireDate != null)
                {
                    return (DateTime)_ApptHireDate;
                }
                else
                {
                    return _BeginDate;
                }
            }
            set { _ApptHireDate = value; }
        }

        protected bool _DatesHaveBeenAdjusted;

        public virtual bool DatesHaveBeenAdjusted
        {
            get { return _DatesHaveBeenAdjusted ; }
            set { _DatesHaveBeenAdjusted = value; }
        }

        protected DateTime? _CareerHireDate;

        public virtual DateTime? CareerHireDate
        {
            get { return _CareerHireDate; }
            set { _CareerHireDate = value; }
        }

        public virtual bool PPSCareerHireDateChecked { get; set; }

        protected DateTime? _ApptHireDate;

        public virtual DateTime? ApptHireDate
        {
            get { return _ApptHireDate; }
            set { _ApptHireDate = value; }
        }

        public virtual bool PPSApptHireDateChecked { get; set; }

        protected DateTime? _ExperienceBeginDate;

        public virtual DateTime? ExperienceBeginDate
        {
            get { return _ExperienceBeginDate; }
            set { _ExperienceBeginDate = value; }
        }

        protected double? _YearsOfService;

        public virtual double? YearsOfService
        {
            get { return _YearsOfService; }
            set { _YearsOfService = value; }
        }
        protected double? _TimeInTitle;
        public virtual double? TimeInTitle
        {
            get { return _TimeInTitle; }
            set { _TimeInTitle = value; }
        }
        protected double? _YearsOfExperience;
        public virtual double? YearsOfExperience
        {
            get { return _YearsOfExperience; }
            set { _YearsOfExperience = value; }
        }

        protected string _DepartmentComments;

        public virtual string DepartmentComments
        {
            get { return _DepartmentComments; }
            set { _DepartmentComments = value; }
        }
        protected string _DeansOfficeComments;

        public virtual string DeansOfficeComments
        {
            get { return _DeansOfficeComments; }
            set { _DeansOfficeComments = value; }
        }

        public virtual int CompareTo(Employee item)
        {
            return String.Compare(this.FullName, item.FullName);
        }

        // Method to return IComparer object for sort helper.
        public static IComparer<Employee> sortHomeDepartmentAscending()
        {
            return (IComparer<Employee>)new sortHomeDepartmentAscendingHelper();
        }

        // Method to return IComparer object for sort helper.
        public static IComparer<Employee> sortHomeDepartmentDescending()
        {
            return (IComparer<Employee>)new sortHomeDepartmentDescendingHelper();
        }

        // Method to return IComparer object for sort helper.
        public static IComparer<Employee> sortTitleAscending()
        {
            return (IComparer<Employee>)new sortTitleAscendingHelper();
        }

        // Method to return IComparer object for sort helper.
        public static IComparer<Employee> sortTitleDescending()
        {
            return (IComparer<Employee>)new sortTitleDescendingHelper();
        }

        public virtual bool Equals(Employee other)
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

        public Employee()
        {

        }
    }
}
