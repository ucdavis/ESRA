using System;
using System.Collections.Generic;
using System.Text;

namespace CAESDO.Esra.Core.Domain
{
    public class Employee : UCDEmployee
    {
        private bool? _DatesHaveBeenAdjusted;

        public virtual bool DatesHaveBeenAdjusted
        {
            get
            {
                return (_DatesHaveBeenAdjusted == null ? false : (bool)_DatesHaveBeenAdjusted);
            }
            set { _DatesHaveBeenAdjusted = value; }
        }

        private DateTime? _CareerHireDate;

        public virtual DateTime CareerHireDate
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
            set
            {
                _CareerHireDate = value;

                if (value != null)
                {
                    _DatesHaveBeenAdjusted = true;
                }
            }
        }

        private DateTime? _ApptHireDate;

        public virtual DateTime ApptHireDate
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
            set 
            {
                _ApptHireDate = value;

                if (value != null)
                {
                    _DatesHaveBeenAdjusted = true;
                }
            }
        }

        private double? _YearsOfService;

        public virtual double YearsOfService
        {
            get
            {
                System.TimeSpan diffResult = DateTime.Now - CareerHireDate;
                return diffResult.TotalDays / 365;
            }
            set
            {
                _YearsOfService = value;
            }
        }

        public virtual double TimeInTitle
        {
            get
            {
                System.TimeSpan diffResult = DateTime.Now - ApptHireDate;
                return diffResult.TotalDays / 365;
            }
            set
            {
                _YearsInTitle = value;
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

        public Employee()
        {

        }
    }
}
