using System;
using System.Collections.Generic;
using System.Text;

namespace CAESDO.Esra.Core.Domain
{
    public class SalaryReviewAnalysis : DomainObject<SalaryReviewAnalysis, int>
    {
        private string _ReferenceNumber;

        public virtual string ReferenceNumber
        {
            get { return _ReferenceNumber; }
            set { _ReferenceNumber = value; }
        }

        private Employee _Employee;

        public virtual Employee Employee
        {
            get { return _Employee; }
            set { _Employee = value; }
        }

        private Scenario _ApprovedScenario;

        public virtual Scenario ApprovedScenario
        {
            get { return _ApprovedScenario; }
            set { _ApprovedScenario = value; }
        }

        private List<Scenario> _Scenarios;

        public virtual List<Scenario> Scenarios
        {
            get { return _Scenarios; }
            set { _Scenarios = value; }
        }

        private DateTime _DateInitiated;

        public virtual DateTime DateInitiated
        {
            get { return _DateInitiated; }
            set { _DateInitiated = value; }
        }

        private DateTime _DateApproved;

        public virtual DateTime DateApproved
        {
            get { return _DateApproved; }
            set { _DateApproved = value; }
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

        private string _InitiatedByReviewerName;

        public virtual string InitiatedByReviewerName
        {
            get { return _InitiatedByReviewerName; }
            set { _InitiatedByReviewerName = value; }
        }

        public SalaryReviewAnalysis()
        {

        }
    }
}
