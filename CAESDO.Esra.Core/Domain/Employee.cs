using System;
using System.Collections.Generic;
using System.Text;
using System.Globalization;

namespace CAESDO.Esra.Core.Domain
{
    public class Employee : UCDEmployee, IComparable<Employee>
    {
        private bool _DatesHaveBeenAdjusted;

        public virtual bool DatesHaveBeenAdjusted
        {
            get
            {
                return _DatesHaveBeenAdjusted ;
            }
            set { _DatesHaveBeenAdjusted = value; }
        }

        private DateTime? _CareerHireDate;

        public virtual DateTime? CareerHireDate
        {
            get 
            {
                //if (_CareerHireDate != null)
                //{
                //    return (DateTime)_CareerHireDate;
                //}
                //else
                //{
                //    return _HireDate;
                //}
                return _CareerHireDate;
            }
            set
            {
                _CareerHireDate = value;

                if (value != null)
                {
                    DatesHaveBeenAdjusted = true;
                }
            }
        }

        private DateTime? _ApptHireDate;

        public virtual DateTime? ApptHireDate
        {
            get
            {
                //if (_ApptHireDate != null)
                //{
                //    return (DateTime)_ApptHireDate;
                //}
                //else
                //{
                //    return _BeginDate;
                //}
                return _ApptHireDate;
            }
            set 
            {
                _ApptHireDate = value;

                if (value != null)
                {
                    DatesHaveBeenAdjusted = true;
                }
            }
        }

        private double? _YearsOfService;

        public virtual double? YearsOfService
        {
            get
            {
                //return (DateTime.Today - (DateTime)CareerHireDate).TotalDays / 365.25;
                return _YearsOfService;
            }
            set
            {
                _YearsOfService = value;
            }
        }
        private double? _TimeInTitle;
        public virtual double? TimeInTitle
        {
            get
            {
                //return (DateTime.Today - (DateTime)ApptHireDate).TotalDays / 365.25;
                return _TimeInTitle;
            }
            set
            {
                _TimeInTitle = value;
            }
        }

        private string _DepartmentComments;

        public virtual string DepartmentComments
        {
            get { return _DepartmentComments; }
            set { _DepartmentComments = value; }
        }
        private string _DeansOfficeComments;

        public virtual string DeansOfficeComments
        {
            get { return _DeansOfficeComments; }
            set { _DeansOfficeComments = value; }
        }

        public virtual int CompareTo(Employee item)
        {
            return this.FullName.CompareTo(item.FullName);
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
