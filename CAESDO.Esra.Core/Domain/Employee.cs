using System;
using System.Collections.Generic;
using System.Text;

namespace CAESDO.Esra.Core.Domain
{
    public class Employee : UCDEmployee
    {
        private bool _DatesHaveBeenAdjusted;

        public virtual bool DatesHaveBeenAdjusted
        {
            get { return _DatesHaveBeenAdjusted; }
            set { _DatesHaveBeenAdjusted = value; }
        }

        private DateTime _CareerHireDate;

        public virtual DateTime CareerHireDate
        {
            get { return _CareerHireDate; }
            set { _CareerHireDate = value; }
        }

        private DateTime _ApptHireDate;

        public virtual DateTime ApptHireDate
        {
            get { return _ApptHireDate; }
            set { _ApptHireDate = value; }
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
