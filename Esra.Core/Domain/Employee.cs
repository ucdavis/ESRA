using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

//using System.Linq.Expressions;
using FluentNHibernate.Mapping;
using NHibernate;
using NHibernate.Criterion;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Core.Utils;
using UCDArch.Data.NHibernate;

//using Expression = System.Linq.Expressions.Expression;

//using Expression = NHibernate.Criterion.Expression;

namespace Esra.Core.Domain
{
    [Serializable]
    public class Employee : UCDEmployee, IComparable<Employee>
    {
        // Beginning of nested classes.

        // Nested class to do ascending sort on Admin Department property.
        protected new class sortAdminDepartmentAscendingHelper : IComparer<Employee>
        {
            #region IComparer<Employee> Members

            public int Compare(Employee x, Employee y)
            {
                /*
                *
                * If the employees are in the same department return the employeeOrder.
                *
                * If the employees are in different departments return the deptOrder.
                *
                * */

                int deptOrder = String.Compare(x.AdminDepartment.Name, y.AdminDepartment.Name);
                if (deptOrder == 0)
                    return String.Compare(x.FullName, y.FullName);
                else
                    return deptOrder;
            }

            #endregion IComparer<Employee> Members
        }

        // Nested class to do descending sort on on Admin Department property.
        protected new class sortAdminDepartmentDescendingHelper : IComparer<Employee>
        {
            #region IComparer<Employee> Members

            public int Compare(Employee x, Employee y)
            {
                int deptOrder = String.Compare(y.AdminDepartment.Name, x.AdminDepartment.Name);
                if (deptOrder == 0)
                    return String.Compare(x.FullName, y.FullName);
                else
                    return deptOrder;
            }

            #endregion IComparer<Employee> Members
        }

        // Nested class to do ascending sort on Home Department property.
        protected new class sortHomeDepartmentAscendingHelper : IComparer<Employee>
        {
            #region IComparer<Employee> Members

            public int Compare(Employee x, Employee y)
            {
                /*
                *
                * If the employees are in the same department return the employeeOrder.
                *
                * If the employees are in different departments return the deptOrder.
                *
                * */

                int deptOrder = String.Compare(x.HomeDepartment.Name, y.HomeDepartment.Name);
                if (deptOrder == 0)
                    return String.Compare(x.FullName, y.FullName);
                else
                    return deptOrder;
            }

            #endregion IComparer<Employee> Members
        }

        // Nested class to do descending sort on on Home Department property.
        protected new class sortHomeDepartmentDescendingHelper : IComparer<Employee>
        {
            #region IComparer<Employee> Members

            public int Compare(Employee x, Employee y)
            {
                int deptOrder = String.Compare(y.HomeDepartment.Name, x.HomeDepartment.Name);
                if (deptOrder == 0)
                    return String.Compare(x.FullName, y.FullName);
                else
                    return deptOrder;
            }

            #endregion IComparer<Employee> Members
        }

        // Nested class to do ascending sort on on Title.TitleCode property.
        protected new class sortTitleAscendingHelper : IComparer<Employee>
        {
            #region IComparer<Employee> Members

            public int Compare(Employee x, Employee y)
            {
                int titleOrder = String.Compare(x.Title.TitleCode, y.Title.TitleCode);
                if (titleOrder == 0)
                    return String.Compare(x.FullName, y.FullName);
                else
                    return titleOrder;
            }

            #endregion IComparer<Employee> Members
        }

        // Nested class to do descending sort on on Title.TitleCode property.
        protected new class sortTitleDescendingHelper : IComparer<Employee>
        {
            #region IComparer<Employee> Members

            public int Compare(Employee x, Employee y)
            {
                int titleOrder = String.Compare(y.Title.TitleCode, x.Title.TitleCode);
                if (titleOrder == 0)
                    return String.Compare(x.FullName, y.FullName);
                else
                    return titleOrder;
            }

            #endregion IComparer<Employee> Members
        }

        // End of nested classes.

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
            set
            {
                _CareerHireDate = value;
            }
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

        // This probably no longer needs to be a database field
        protected bool _DatesHaveBeenAdjusted;

        public virtual bool DatesHaveBeenAdjusted
        {
            get
            {
                return ApptDateHasBeenAdjusted || CareerDateHasBeenAdjusted ? true : false;
                //return _DatesHaveBeenAdjusted;
            }
            set { _DatesHaveBeenAdjusted = value; }
        }

        protected DateTime? _CareerHireDate;

        public virtual DateTime? CareerHireDate
        {
            get { return _CareerHireDate; }
            set
            {
                _CareerHireDate = value;
            }
        }

        public virtual void SetCareerHireDate(DateTime? value)
        {
            if (CareerHireDate != value)
            {
                CareerHireDate = value;
                if (value == null)
                {
                    YearsOfService = (DateTime.Today - HireDate).TotalDays / 365.25;
                }
                else
                {
                    YearsOfService = (DateTime.Today - (DateTime)value).TotalDays / 365.25;
                }
            }
        }

        public virtual bool PPSCareerHireDateChecked { get; set; }

        public virtual void SetPPSCareerHireDateChecked(bool? value)
        {
            PPSCareerHireDateChecked = (value == null ? false : (bool)value);
        }

        protected DateTime? _ApptHireDate;

        public virtual DateTime? ApptHireDate
        {
            get { return _ApptHireDate; }
            set
            {
                _ApptHireDate = value;
            }
        }

        public virtual void SetApptHireDate(DateTime? value)
        {
            if (ApptHireDate != value)
            {
                ApptHireDate = value;
                if (value == null)
                {
                    TimeInTitle = (DateTime.Today - BeginDate).TotalDays / 365.25;
                }
                else
                {
                    TimeInTitle = (DateTime.Today - (DateTime)value).TotalDays / 365.25;
                }
            }
        }

        public virtual bool PPSApptHireDateChecked
        {
            get;
            set;
        }

        public virtual void SetPPSApptHireDateChecked(bool? value)
        {
            PPSApptHireDateChecked = (value == null ? false : (bool)value);
        }

        protected DateTime? _ExperienceBeginDate;

        public virtual DateTime? ExperienceBeginDate
        {
            get { return _ExperienceBeginDate; }
            set
            {
                _ExperienceBeginDate = value;
            }
        }

        public virtual void SetExperienceBeginDate(DateTime? value)
        {
            // first reset the Experience begin date if needed.
            if (ExperienceBeginDate == null)
            {
                YearsOfExperience = null;
            }

            if (ExperienceBeginDate != value)
            {
                ExperienceBeginDate = value;

                if (value == null)
                {
                    // reset years of experience to null:
                    YearsOfExperience = null;
                }
                else
                {
                    YearsOfExperience = (DateTime.Today - (DateTime)value).TotalDays / 365.25;
                }
            }
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

        public virtual void SetDepartmentComments(string value, bool? isDepartmentUser)
        {
            SetComments(value, isDepartmentUser);
        }

        protected string _DeansOfficeComments;

        public virtual string DeansOfficeComments
        {
            get { return _DeansOfficeComments; }
            set { _DeansOfficeComments = value; }
        }

        public virtual void SetDeansOfficeComments(string value, bool? isDepartmentUser)
        {
            SetComments(value, isDepartmentUser);
        }

        public virtual void SetComments(string value, bool? isDepartmentUser)
        {
            if (isDepartmentUser == null || isDepartmentUser == false)
            {
                DeansOfficeComments = (String.IsNullOrEmpty(value) ? null : value);
            }
            else
            {
                DepartmentComments = (String.IsNullOrEmpty(value) ? null : value);
            }
        }

        public virtual int CompareTo(Employee item)
        {
            return String.Compare(this.FullName, item.FullName);
        }

        // Method to return IComparer object for sort helper.
        public new static IComparer<Employee> sortAdminDepartmentAscending()
        {
            return (IComparer<Employee>)new sortAdminDepartmentAscendingHelper();
        }

        // Method to return IComparer object for sort helper.
        public new static IComparer<Employee> sortAdminDepartmentDescending()
        {
            return (IComparer<Employee>)new sortAdminDepartmentDescendingHelper();
        }

        // Method to return IComparer object for sort helper.
        public new static IComparer<Employee> sortHomeDepartmentAscending()
        {
            return (IComparer<Employee>)new sortHomeDepartmentAscendingHelper();
        }

        // Method to return IComparer object for sort helper.
        public new static IComparer<Employee> sortHomeDepartmentDescending()
        {
            return (IComparer<Employee>)new sortHomeDepartmentDescendingHelper();
        }

        // Method to return IComparer object for sort helper.
        public new static IComparer<Employee> sortTitleAscending()
        {
            return (IComparer<Employee>)new sortTitleAscendingHelper();
        }

        // Method to return IComparer object for sort helper.
        public new static IComparer<Employee> sortTitleDescending()
        {
            return (IComparer<Employee>)new sortTitleDescendingHelper();
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

        public static IList<Employee> GetAllForUser(IRepository repository, User user, string sortPropertyName, bool isAscending)
        {
            var depts = user.Units.Select(unit => unit.PPSCode).ToList();

            return GetAll(sortPropertyName, isAscending, null, null, depts.ToArray());
        }

        public static IList<Employee> GetAllForUser(IRepository repository, string userId, bool isDepartmentUser, string sortPropertyName, bool isAscending, string titleCodesString, string pkEmployee, string departmentIDsString)
        {
            string[] titleCodes = (!String.IsNullOrEmpty(titleCodesString) ? titleCodesString.Split('|') : new string[] { "0" });
            string[] departmentIDs = (!String.IsNullOrEmpty(departmentIDsString) ? departmentIDsString.Split('|') : new string[] { "0" });
            return GetAllForUser(repository, userId, isDepartmentUser, sortPropertyName, isAscending, titleCodes, pkEmployee, departmentIDs);
        }

        public static IList<Employee> GetAllForUser(IRepository repository, string userId, bool isDepartmentUser, string sortPropertyName, bool isAscending, string[] titleCodes, string pkEmployee, string[] departmentIds)
        {
            Check.Require(repository != null, "Repository must be supplied");

            if (isDepartmentUser && String.IsNullOrEmpty(sortPropertyName) == false && sortPropertyName.Equals("FullName"))
            {
                sortPropertyName = "FullName";  // Default sort by FullName
            }
            if (String.IsNullOrEmpty(sortPropertyName))
                sortPropertyName = "FullName";

            IList<Employee> employees = GetAll(sortPropertyName, isAscending, titleCodes, pkEmployee, departmentIds);
            List<Employee> retval = null;
            if (isDepartmentUser)
            {
                // Then blank out the Name, department and comments from non-departmental employees:
                List<Employee> nullList = new List<Employee>();
                retval = new List<Employee>();

                //User user = User.GetByLoginId(repository, userId);
                User user = User.GetByEmployeeId(repository, userId);

                foreach (Employee employee in employees)
                {
                    try
                    {
                        employee.IsDepartmentEmployee = true;
                        if (!ComputeIsDepartmentEmployee(user, employee))
                        {
                            // Set the employee's IsDepartmentEmployee to
                            // allow view to decide how to "blank out" fields.
                            // blank out the username, department and comments:
                            //employee.HomeDepartment = null;
                            //employee.FullName = null;
                            //employee.DeansOfficeComments = null;
                            //employee.DepartmentComments = null;
                            employee.IsDepartmentEmployee = false;

                            if (sortPropertyName.Equals("FullName") || sortPropertyName.Equals("HomeDepartment") || sortPropertyName.Equals("Title"))
                            {
                                // if sorted by FullName, add these employees to their own array.
                                nullList.Add(employee);
                            }
                            else
                            {
                                // otherwise just add them to the return array.
                                retval.Add(employee);
                            }
                        }
                        else
                        {
                            // add them as-is to the return array.
                            retval.Add(employee);
                        }
                    }
                    catch (System.Exception ex)
                    {
                        System.Console.Out.WriteLine(ex.InnerException);
                    }
                }

                if (sortPropertyName.Equals("FullName"))
                {
                    // sort by FullName
                    retval.Sort();
                    if (!isAscending)
                    {
                        retval.Reverse();
                    }
                    retval.AddRange(nullList);
                }
                else if (sortPropertyName.Equals("HomeDepartment"))
                {
                    // Sort by Departments, then by FullNames within individual departments:
                    if (isAscending)
                    {
                        retval.Sort(Employee.sortHomeDepartmentAscending());
                    }
                    else
                    {
                        retval.Sort(Employee.sortHomeDepartmentDescending());
                    }
                    retval.AddRange(nullList);
                }
                else if (sortPropertyName.Equals("Title"))
                {
                    if (isAscending)
                    {
                        retval.Sort(Employee.sortTitleAscending());
                    }
                    else
                    {
                        retval.Sort(Employee.sortTitleDescending());
                    }
                    retval.AddRange(nullList);
                }
                else
                {
                    retval.AddRange(nullList);
                }
            }
            else
            {
                // Return all employees as-is.
                retval = employees as List<Employee>;
            }
            return retval;
        }

        public static IList<Employee> GetAll(string sortPropertyName, bool isAscending, string[] titleCodes, string pkEmployee, string[] departmentIds)
        {
            IList<Employee> retval = null;

            var hasTitleCodes = (titleCodes != null) && (titleCodes.Length > 0) &&
                                    (!titleCodes[0].Equals("0") && !titleCodes[0].Equals(String.Empty))
                                        ? true
                                        : false;
            var hasDepartmentIds = (departmentIds != null) && (departmentIds.Length > 0) &&
                                    (!departmentIds[0].Equals("0") && !departmentIds[0].Equals(String.Empty))
                                        ? true
                                        : false;
            var hasPkEmployee = (!String.IsNullOrEmpty(pkEmployee)) &&
                                     !(pkEmployee.Equals("0") && !pkEmployee.Equals(String.Empty))
                                         ? true
                                         : false;

            if (!hasPkEmployee && !hasDepartmentIds && !hasTitleCodes)
            {
                retval = GetAll(sortPropertyName, isAscending);
            }
            else
            {
                ICriteria criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(typeof(Employee));
                Conjunction conjunction = Restrictions.Conjunction();

                if (hasTitleCodes)
                {
                    criteria.CreateAlias("Title", "Title");
                    conjunction.Add(Restrictions.In("Title.TitleCode", titleCodes));
                }
                if (hasPkEmployee)
                {
                    conjunction.Add(Restrictions.Eq("id", pkEmployee));
                }
                if (hasDepartmentIds)
                {
                    criteria.CreateAlias("HomeDepartment", "Department");
                    conjunction.Add(Restrictions.In("Department.id", departmentIds));
                }
                criteria.Add(conjunction);

                if (sortPropertyName.Equals("HomeDepartment") && (hasDepartmentIds))
                {
                    criteria.CreateAlias("HomeDepartment", "HomeDepartment")
                    .AddOrder((isAscending ? Order.Asc("HomeDepartment.Name") : Order.Desc("HomeDepartment.Name")))
                    .AddOrder(Order.Asc("FullName"));
                }
                else
                {
                    criteria.AddOrder((isAscending ? Order.Asc(sortPropertyName) : Order.Desc(sortPropertyName)));
                    if (sortPropertyName.Equals("FullName") == false)
                    {
                        criteria.AddOrder(Order.Asc("FullName"));
                    }
                }

                retval = criteria.List<Employee>();
            }
            return retval;
        }

        public static IList<Employee> GetAll(string sortPropertyName, bool isAscending)
        {
            ICriteria criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(typeof(Employee));
            if (sortPropertyName.Equals("HomeDepartment"))
            {
                criteria.CreateAlias("HomeDepartment", "HomeDepartment")
                .AddOrder((isAscending ? Order.Asc("HomeDepartment.Name") : Order.Desc("HomeDepartment.Name")))
                .AddOrder(Order.Asc("FullName"));
            }
            else
            {
                criteria.AddOrder((isAscending ? Order.Asc(sortPropertyName) : Order.Desc(sortPropertyName)));
                if (sortPropertyName.Equals("FullName") == false)
                {
                    criteria.AddOrder(Order.Asc("FullName"));
                }
            }

            return criteria.List<Employee>();
        }

        /// <summary>
        /// Set when Employee is "pulled" from database, based on what the
        /// logged in user's IsDepartmentUser is and whether or not the
        /// the employee is in the user's departments list.
        /// Not a database field.
        /// </summary>
        public virtual bool IsDepartmentEmployee { get; set; }

        /// <summary>
        /// This is the method, which determines whether or not the login user can "see"
        /// the employee's name, department, etc.
        /// Therefore, you will need to change it if the business rules are changed for
        /// departments (or possibly schools, etc in the future).
        /// </summary>
        /// <param name="user">The logged in user</param>
        /// <param name="employee">The UCD Employee</param>
        /// <returns>true if the employee's identifying information can be viewed by the login user.</returns>
        public static bool ComputeIsDepartmentEmployee(User user, Employee employee)
        {
            // Business rules for determining whether or not a employee is visible to a user:
            bool retval = false;

            if (user != null && employee != null)
            {
                // Check if the employee's home or work department or admin department is in the user's list of departments:
                retval = user.Units.Any(unit => (employee.HomeDepartmentID != null && employee.HomeDepartmentID.Equals(unit.PPSCode)) || (employee.WorkDepartmentID != null && employee.WorkDepartmentID.Equals(unit.PPSCode)) || (employee.AdminDepartmentID != null && employee.AdminDepartmentID.Equals(unit.PPSCode)));
            }
            return retval;
        }

        public static IQueryable GenerateSortExpression(IQueryable source, Type sourceType, string propertyName, string action)
        {
            System.Linq.Expressions.ParameterExpression paramExpression = System.Linq.Expressions.Expression.Parameter(sourceType, sourceType.Name);

            System.Linq.Expressions.MemberExpression memExp = System.Linq.Expressions.Expression.PropertyOrField(paramExpression, propertyName);

            System.Linq.Expressions.LambdaExpression lambda = System.Linq.Expressions.Expression.Lambda(memExp, paramExpression);

            return source.Provider.CreateQuery(

                System.Linq.Expressions.Expression.Call(

                    typeof(Queryable),

                    action,

                    new Type[] { source.ElementType, lambda.Body.Type },

                    source.Expression,

                    lambda));
        }
    }

    public class EmployeeMap : SubclassMap<Employee>
    {
        public EmployeeMap()
        {
            Table("Employee");

            KeyColumn("PkEmployee");

            Map(x => x.DatesHaveBeenAdjusted);

            Map(x => x.CareerHireDate);
            Map(x => x.PPSCareerHireDateChecked);

            Map(x => x.ApptHireDate);
            Map(x => x.PPSApptHireDateChecked);

            Map(x => x.ExperienceBeginDate);
            Map(x => x.DepartmentComments);
            Map(x => x.DeansOfficeComments);
            Map(x => x.YearsOfService);
            Map(x => x.TimeInTitle);
            Map(x => x.YearsOfExperience);
        }
    }
}