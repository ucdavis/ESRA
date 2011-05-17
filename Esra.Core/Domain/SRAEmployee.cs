using System;
using UCDArch.Core.DomainModel;

namespace Esra.Core.Domain
{
    /// <summary>
    /// Class represents a snapshot of the employee's information
    /// at the time a salary review analysis was performed.
    /// </summary>
    [Serializable]
    public class SRAEmployee : DomainObject
    {
        private string _PkEmployee;

        public virtual string PkEmployee
        {
            get { return _PkEmployee; }
            set { _PkEmployee = value; }
        }

        // End of nested classes.
        protected string _EmployeeID;

        public virtual string EmployeeID
        {
            get { return _EmployeeID; }
            set { _EmployeeID = value; }
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
            get { return _DatesHaveBeenAdjusted; }
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

        /* Shouldn't need these because this class doesn't implement IComparable directly.
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
        */

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
            _PkEmployee = emp.Id;
            _TitleCode = emp.TitleCode;
            _Title = emp.Title;
            _EmployeeID = emp.EmployeeID;
            _DatesHaveBeenAdjusted = emp.DatesHaveBeenAdjusted;
            //_ApptHireDate = emp.AdjustedApptHireDate;
            //_CareerHireDate = emp.AdjustedCareerHireDate;
            _ApptHireDate = emp.ApptHireDate;
            PPSApptHireDateChecked = emp.PPSApptHireDateChecked;
            _CareerHireDate = emp.CareerHireDate;
            PPSCareerHireDateChecked = emp.PPSCareerHireDateChecked;
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
            _AdminDepartmentID = emp.AdminDepartmentID;
            _AdminDepartment = emp.AdminDepartment;
            _HomeDepartmentID = emp.HomeDepartmentID;
            _HomeDepartment = emp.HomeDepartment;
            _WorkDepartmentID = emp.WorkDepartmentID;
            _WorkDepartment = emp.WorkDepartment;
            _Different = (bool)emp.Different;
        }
    }
}