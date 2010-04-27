using System;
using System.Collections.Generic;
using System.Text;
using System.Globalization;

namespace CAESDO.Esra.Core.Domain
{
    /// <summary>
    /// Class represents a snapshot of the employee's information
    /// at the time a salary review analysis was performed.
    /// </summary>
    [Serializable]
    public class SRAEmployee : Employee
    {
        /// <summary>
        /// The date the employee snapshot was taken.
        /// </summary>
        private DateTime _Created;
        public virtual DateTime Created
        {
            get { return _Created; }
            set { _Created = value; }
        }

        private SalaryReviewAnalysis _CorrespondingAnalysis;
        public virtual SalaryReviewAnalysis CorrespondingAnalysis
        {
            get { return _CorrespondingAnalysis; }
            set { _CorrespondingAnalysis = value; }
        }

        private int _CorrespondingAnalysisID;
        public virtual int CorrespondingAnalysisID
        {
            get { return _CorrespondingAnalysisID; }
            set { _CorrespondingAnalysisID = value; }
        }

        /* Shouldn't need theses here, since I moved the code to the base class.
        public virtual int CompareTo(SRAEmployee item)
        {
            return String.Compare(this.ID, item.ID);
        }

        public virtual bool Equals(SRAEmployee other)
        {
            if (this.ID == other.ID)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
         * */

        public SRAEmployee()
        {

        }

        /// <summary>
        /// Create a snapshot of an Employee at the time of the analysis.
        /// </summary>
        /// <param name="emp">The employee you wish to create a snapshot for.</param>
        public SRAEmployee(Employee emp)
        {
            _Created = DateTime.Today;
            id = emp.ID;
            _TitleCode = emp.TitleCode;
            _Title = emp.Title;
            _EmployeeID = emp.EmployeeID;
            _DatesHaveBeenAdjusted = emp.DatesHaveBeenAdjusted;
            //_ApptHireDate = emp.AdjustedApptHireDate;
            //_CareerHireDate = emp.AdjustedCareerHireDate;
            _ApptHireDate = emp.ApptHireDate;
            _CareerHireDate = emp.CareerHireDate;
            _BeginDate = emp.BeginDate;
            _HireDate = emp.HireDate;
            _ExperienceBeginDate = emp.ExperienceBeginDate;
            _YearsOfService = emp.YearsOfService;
            _TimeInTitle = emp.TimeInTitle;
            _YearsOfExperience = emp.YearsOfExperience;
            _DepartmentComments = emp.DepartmentComments;
            _DeansOfficeComments = emp.DeansOfficeComments;
            _FullName = emp.FullName;
            _FirstName = emp.FirstName;
            _MiddleName = emp.MiddleName;
            _LastName = emp.LastName;
            _PayRate = emp.PayRate;
            _SalaryGrade = emp.SalaryGrade;
            _BargainingUnitCode = emp.BargainingUnitCode;
            _SalaryStep = emp.SalaryStep;
            _HomeDepartmentID = emp.HomeDepartmentID;
            _HomeDepartment = emp.HomeDepartment;
            _WorkDepartmentID = emp.WorkDepartmentID;
            _WorkDepartment = emp.WorkDepartment;
            _Different = (bool)emp.Different;
        }
    }
}
