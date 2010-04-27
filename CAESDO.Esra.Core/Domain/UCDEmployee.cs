using System;
using System.Collections.Generic;
using System.Text;

namespace CAESDO.Esra.Core.Domain
{
    [Serializable]
    public abstract class UCDEmployee : DomainObject<UCDEmployee, string>
    {
        protected string _EmployeeID;

        public virtual string EmployeeID
        {
            get { return _EmployeeID; }
            set { _EmployeeID = value; }
        }

        protected Department _HomeDepartment;

        public virtual Department HomeDepartment
        {
            get { return _HomeDepartment; }
            set { _HomeDepartment = value; }
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

        public UCDEmployee()
        {

        }
    }
}
