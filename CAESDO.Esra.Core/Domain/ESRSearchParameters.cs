using System;
using System.Collections.Generic;
using System.Text;
using CAESDO.Esra.Core.Domain;

namespace CAESDO.Core.Domain
{
    public class ESRSearchParameters : DomainObject<ESRSearchParameters, int>
    {
        private List<Title> _SearchTitles;
        // Contains a list of the Titles that were present in the Employee Salary Report search criteria.
        public virtual List<Title> SearchTitles
        {
            get { return _SearchTitles; }
            set { _SearchTitles = value; }
        }

        private List<Department> _SearchDepartments;
        // Contains a list of the Departments that were present in the Employee Salary Report search criteria.
        public virtual List<Department> SearchDepartments
        {
            get { return _SearchDepartments; }
            set { _SearchDepartments = value; }
        }

        private Employee _SearchEmployee;
        // Contains the Employee that was present in the Employee Salary Report search criteria.
        public virtual Employee SearchEmployee
        {
            get { return _SearchEmployee; }
            set { _SearchEmployee = value; }
        }

        private DateTime _ReportDate;

        public virtual DateTime ReportDate
        {
            get { return _ReportDate; }
            set { _ReportDate = value; }
        }

        public ESRSearchParameters()
        {
            _ReportDate = DateTime.Today;
        }

    }
}
