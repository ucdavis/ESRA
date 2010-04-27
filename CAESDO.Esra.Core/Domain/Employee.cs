﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Globalization;

namespace CAESDO.Esra.Core.Domain
{
    public class Employee : UCDEmployee, IComparable<Employee>
    {
        private bool _CareerDateHasBeenAdjusted;
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

        private bool _ApptDateHasBeenAdjusted;
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

        private bool _DatesHaveBeenAdjusted;

        public virtual bool DatesHaveBeenAdjusted
        {
            get { return _DatesHaveBeenAdjusted ; }
            set { _DatesHaveBeenAdjusted = value; }
        }

        private DateTime? _CareerHireDate;

        public virtual DateTime? CareerHireDate
        {
            get { return _CareerHireDate; }
            set { _CareerHireDate = value; }
        }

        private DateTime? _ApptHireDate;

        public virtual DateTime? ApptHireDate
        {
            get { return _ApptHireDate; }
            set { _ApptHireDate = value; }
        }

        private DateTime? _ExperienceBeginDate;

        public virtual DateTime? ExperienceBeginDate
        {
            get { return _ExperienceBeginDate; }
            set { _ExperienceBeginDate = value; }
        }

        private double? _YearsOfService;

        public virtual double? YearsOfService
        {
            get { return _YearsOfService; }
            set { _YearsOfService = value; }
        }
        private double? _TimeInTitle;
        public virtual double? TimeInTitle
        {
            get { return _TimeInTitle; }
            set { _TimeInTitle = value; }
        }
        private double? _YearsOfExperience;
        public virtual double? YearsOfExperience
        {
            get { return _YearsOfExperience; }
            set { _YearsOfExperience = value; }
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
            return String.Compare(this.FullName, item.FullName);
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
