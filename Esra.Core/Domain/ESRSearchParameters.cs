﻿using System;
using System.Collections.Generic;
using UCDArch.Core.DomainModel;

namespace Esra.Core.Domain
{
    public class ESRSearchParameters : DomainObject
    {
        private List<Title> _SearchTitles;

        public virtual bool IsAnyTitle
        {
            get { return (_SearchTitles == null || _SearchTitles.Count == 0 || _SearchTitles[0].TitleCode == null ? true : false); }
        }

        public virtual bool IsAnyDepartment
        {
            get { return (_SearchDepartments == null || _SearchDepartments.Count == 0 || _SearchDepartments[0].DepartmentNumber == null ? true : false); }
        }

        public virtual bool IsAnyEmployee
        {
            get { return (_SearchEmployee == null || _SearchEmployee.EmployeeID == null ? true : false); }
        }

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