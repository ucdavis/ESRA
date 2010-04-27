using CAESDO.Esra.Core.DataInterfaces;
using CAESDO.Esra.Core.Domain;
using System.Collections.Generic;
using NHibernate;
using NHibernate.Expression;
using System.ComponentModel;
using System.Web;
using System.Web.Security;
using System;

namespace CAESDO.Esra.Data
{
    /// <summary>
    /// Exposes access to NHibernate DAO classes.  Motivation for this DAO
    /// framework can be found at http://www.hibernate.org/328.html.
    /// </summary>
    public class NHibernateDaoFactory : IDaoFactory
    {
        #region Dao Retrieval Operations

        public IGenericDao<T, IdT> GetGenericDao<T, IdT>()
        {
            return new GenericDao<T, IdT>();
        }

        public IEmployeeDao GetEmployeeDao() { return new EmployeeDao(); }
        public ISalaryScaleDao GetSalaryScaleDao() { return new SalaryScaleDao(); }
        public IUnitDao GetUnitDao() { return new UnitDao(); }
        public IUserDao GetUserDao() { return new UserDao(); }
        public ISalaryReviewAnalysisDao GetSalaryReviewAnalysisDao() { return new SalaryReviewAnalysisDao(); }
        public IDepartmentDao GetDepartmentDao() { return new DepartmentDao(); }
        public ISalaryGradeQuartilesDao GetSalaryGradeQuartilesDao() { return new SalaryGradeQuartilesDao(); }
        
        #endregion

        #region Inline DAO implementations

        public class GenericDao<T, IdT> : AbstractNHibernateDao<T, IdT>, IGenericDao<T, IdT> { }
        public class UnitDao : AbstractNHibernateDao<Unit, string>, IUnitDao { }

        public class DepartmentDao : AbstractNHibernateDao<Department, string>, IDepartmentDao { }

        public class SalaryGradeQuartilesDao : AbstractNHibernateDao<SalaryGradeQuartiles, int>, ISalaryGradeQuartilesDao
        {
            /// <summary>
            /// This method returns a distinct list of
            /// SalaryGradeQuartiles objects, one of each with the earliest EffectiveDate. 
            /// This is because the list is built by taking the first object for each salary grade
            /// from the larger, complete list, which was sorted by EffectiveDate.
            /// </summary>
            /// <returns>A list of SalaryGradeQuartiles objects with distinct SalaryGrades, each
            /// having the earliest EffectiveDate out of all others with the same Salary Grade.</returns>
            public IList<SalaryGradeQuartiles> GetDistinct()
            {
                IList<SalaryGradeQuartiles> retval = new List<SalaryGradeQuartiles>();
                /*
                 * I could not get this to work as intended, but I am leaving it here as an example
                 * 
                ICriteria criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(typeof(SalaryGradeQuartiles))
                .SetProjection(Projections.GroupProperty("SalaryGrade"))
                .AddOrder(Order.Asc("SalaryGrade"));

                retval = criteria.List<SalaryGradeQuartiles>();
                */
                
                ICriteria criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(typeof(SalaryGradeQuartiles))
                .AddOrder(Order.Asc("SalaryGrade"))
                .AddOrder(Order.Asc("EffectiveDate"));

                foreach (SalaryGradeQuartiles item in criteria.List<SalaryGradeQuartiles>())
                {
                    if (retval.Count == 0)
                        retval.Add(item);
                    else
                    {
                        if (retval[retval.Count - 1].SalaryGrade.Equals(item.SalaryGrade) == false)
                        {
                            retval.Add(item);
                        }
                    }
                } // end for
                 
                return retval;
            }

            /// <summary>
            /// This method returns a list of just the salary grades, which
            /// can be used for populating a drop-down list with distinct salary grades.
            /// </summary>
            /// <returns>List of distinct salary grades based on the underlying 
            /// Salary Scales.</returns>
            public IList<String> GetDistinctSalaryGrades()
            {
                ICriteria criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(typeof(SalaryGradeQuartiles))
                .SetProjection(Projections.GroupProperty("SalaryGrade"))
                .AddOrder(Order.Asc("SalaryGrade"));

                return criteria.List<String>();
            }
        }

        public class EmployeeDao : AbstractNHibernateDao<Employee, string>, IEmployeeDao
        {
            public IList<Employee> GetByTitleCode(string titleCode, string propertyName, bool ascending)
            {
                IList<Employee> retval = null;

                if (String.IsNullOrEmpty(titleCode) == false && titleCode.Equals("0") == false)
                {
                    ICriteria criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(typeof(Employee))
                      .CreateAlias("Title", "Title")
                      .Add(Expression.Eq("Title.TitleCode", titleCode))
                      .AddOrder((ascending ? Order.Asc(propertyName) : Order.Desc(propertyName)));

                    retval = criteria.List<Employee>();
                }
                else
                {
                    retval = GetAll(propertyName, ascending);
                }

                return retval;
            }

            public IList<Employee> GetEmployees(string propertyName, bool ascending, string[] titleCodes, string pkEmployee, string[] departmentIDs)
            {
                IList<Employee> retval = null;

                if (((titleCodes == null) || (titleCodes.Length == 0) || (titleCodes[0].Equals("0"))) &&
                    (((String.IsNullOrEmpty(pkEmployee)) || pkEmployee.Equals("0"))) &&
                    (((departmentIDs == null) || (departmentIDs.Length == 0) || (departmentIDs[0].Equals("0")))))
                {
                    retval = GetAllEmployees(propertyName, ascending);
                }
                else
                {
                    ICriteria criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(typeof(Employee));
                    Conjunction conjunction = Expression.Conjunction();

                    if ((titleCodes != null) && (titleCodes.Length > 0) && (titleCodes[0].Equals("0") == false))
                    {
                        criteria.CreateAlias("Title", "Title");
                        conjunction.Add(Expression.In("Title.TitleCode", titleCodes));
                    }
                    if (String.IsNullOrEmpty(pkEmployee) == false && pkEmployee.Equals("0") == false)
                    {
                        conjunction.Add(Expression.Eq("id", pkEmployee));
                    }
                    if ((departmentIDs != null) && (departmentIDs.Length > 0) && (departmentIDs[0].Equals("0") == false))
                    {
                        criteria.CreateAlias("HomeDepartment", "Department");
                        conjunction.Add(Expression.In("Department.id", departmentIDs));
                    }
                    criteria.Add(conjunction);

                    if (propertyName.Equals("HomeDepartment") && ((departmentIDs == null) || (departmentIDs.Length == 0) || (departmentIDs[0].Equals("0"))))
                    {
                        criteria.CreateAlias("HomeDepartment", "HomeDepartment")
                        .AddOrder((ascending ? Order.Asc("HomeDepartment.Name") : Order.Desc("HomeDepartment.Name")))
                        .AddOrder(Order.Asc("FullName"));
                    }
                    else
                    {
                        criteria.AddOrder((ascending ? Order.Asc(propertyName) : Order.Desc(propertyName)));
                        if (propertyName.Equals("FullName") == false)
                        {
                            criteria.AddOrder(Order.Asc("FullName"));
                        }
                    }

                    retval = criteria.List<Employee>();
                }
                return retval;
            }

            public IList<Employee> GetAllEmployees(string propertyName, bool ascending)
            {
                ICriteria criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(typeof(Employee));
                if (propertyName.Equals("HomeDepartment"))
                {
                    criteria.CreateAlias("HomeDepartment", "HomeDepartment")
                    .AddOrder((ascending ? Order.Asc("HomeDepartment.Name") : Order.Desc("HomeDepartment.Name")))
                    .AddOrder(Order.Asc("FullName"));
                }
                else
                {
                    criteria.AddOrder((ascending ? Order.Asc(propertyName) : Order.Desc(propertyName)));
                    if (propertyName.Equals("FullName") == false)
                    {
                        criteria.AddOrder(Order.Asc("FullName"));
                    }
                }

                return criteria.List<Employee>();
            }
        }

        public class SalaryScaleDao : AbstractNHibernateDao<SalaryScale, int>, ISalaryScaleDao
        {
            public SalaryScale GetEffectiveSalaryScale(string titleCode, DateTime effectiveDate)
            {
                // get salary scale whose effective date is 
                SalaryScale retval = null;

                ICriteria criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(typeof(SalaryScale))
                .Add(Expression.Eq("TitleCode", titleCode))
                .SetProjection(Projections.RowCount());

                if (criteria.UniqueResult<int>() == 1)
                {
                   criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(typeof(SalaryScale))
                       .Add(Expression.Eq("TitleCode", titleCode));
                   retval = criteria.UniqueResult<SalaryScale>();
                }
                else if (criteria.UniqueResult<int>() > 1)
                {
                    DetachedCriteria maxEffectiveDateForDate = DetachedCriteria.For(typeof(SalaryScale))
                        .SetProjection(Projections.Max("EffectiveDate"))
                        .Add(Expression.Le("EffectiveDate", effectiveDate))
                        .Add(Expression.Eq("TitleCode", titleCode));

                    criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(typeof(SalaryScale))
                        .Add(Expression.Eq("TitleCode", titleCode))
                        .Add(Subqueries.PropertyEq("EffectiveDate", maxEffectiveDateForDate));

                    retval = criteria.List<SalaryScale>()[0];
                }

                return retval;
            }

            public IList<SalaryScale> GetAllSalaryScale(string propertyName, bool ascending)
            {
                IList<SalaryScale> retval = null;

                if (String.IsNullOrEmpty(propertyName) || propertyName.Equals("TitleCode"))
                {
                    propertyName = "TitleCode";
                    ICriteria criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(typeof(SalaryScale))
                      .AddOrder((ascending ? Order.Asc(propertyName) : Order.Desc(propertyName)));

                    retval = criteria.List<SalaryScale>();
                }
                else 
                {
                    ICriteria criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(typeof(SalaryScale))
                      .CreateAlias("Title", "Title")
                      .AddOrder((ascending ? Order.Asc(propertyName) : Order.Desc(propertyName)));

                    retval = criteria.List<SalaryScale>();
                }
                
                return retval;
            }

            public IList<SalaryScale> GetAllSalaryScalesWithSalarySteps(string propertyName, bool ascending)
            {
                IList<SalaryScale> retval = null;

                if (String.IsNullOrEmpty(propertyName) || propertyName.Equals("TitleCode"))
                {
                    propertyName = "TitleCode";

                    ICriteria criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(typeof(SalaryScale))
                      .Add(Expression.Gt("NumSalarySteps", 0))
                      .AddOrder((ascending ? Order.Asc(propertyName) : Order.Desc(propertyName)))
                      .AddOrder(Order.Asc("EffectiveDate"));

                    retval = criteria.List<SalaryScale>();
                }
                else
                {
                    ICriteria criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(typeof(SalaryScale))
                      .CreateAlias("Title", "Title")
                      .Add(Expression.Gt("NumSalarySteps", 0))
                      .AddOrder((ascending ? Order.Asc(propertyName) : Order.Desc(propertyName)));

                    retval = criteria.List<SalaryScale>();
                }

                return retval;
            }

            public bool Exists(SalaryScale record)
            {
                ICriteria criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(typeof(SalaryScale))
                    .Add(Expression.Eq("TitleCode", record.TitleCode))
                    .Add(Expression.Eq("EffectiveDate", record.EffectiveDate))
                    .SetProjection(Projections.RowCount());

                if (criteria.UniqueResult<int>() > 0)
                    return true;
                else
                    return false;
            }

            public bool HasSalaryGradeQuartiles(SalaryScale record)
            {
                ICriteria criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(typeof(SalaryScale))
                    .CreateAlias("SalaryGradeQuartiles", "quatriles")
                    .Add(Expression.Eq("quartiles.SalaryGrade", record.SalaryGrade))
                    .Add(Expression.Eq("quartiles.EffectiveDate", record.EffectiveDate))
                    .SetProjection(Projections.RowCount());

                if (criteria.UniqueResult<int>() > 0)
                    return true;
                else
                    return false;
            }

            public SalaryGradeQuartiles GetSalaryGradeQuartiles(SalaryScale record)
            {
                ICriteria criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(typeof(SalaryGradeQuartiles))
                    .Add(Expression.Eq("SalaryGrade", record.SalaryGrade))
                    .Add(Expression.Eq("EffectiveDate", record.EffectiveDate));

                if (criteria.List<SalaryGradeQuartiles>().Count == 1 )
                    return criteria.List<SalaryGradeQuartiles>()[0];
                else
                    return null;
            }

            public bool HasSalarySteps(SalaryScale record)
            {
                ICriteria criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(typeof(SalaryScale))
                    .CreateAlias("SalarySteps", "steps")
                    .Add(Expression.Eq("steps.TitleCode", record.TitleCode))
                    .Add(Expression.Eq("steps.EffectiveDate", record.EffectiveDate))
                    .SetProjection(Projections.RowCount());

                if (criteria.UniqueResult<int>() > 0)
                    return true;
                else
                    return false;
            }

            public IList<SalaryStep> GetSalarySteps(SalaryScale record)
            {
                ICriteria criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(typeof(SalaryStep))
                    .Add(Expression.Eq("TitleCode", record.TitleCode))
                    .Add(Expression.Eq("EffectiveDate", record.EffectiveDate));

                if (criteria.List<SalaryStep>().Count > 0)
                    return criteria.List<SalaryStep>();
                else
                    return null;
            }

            public bool HasSalaryReviewAnalysis(SalaryScale record)
            {
                ICriteria criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(typeof(SalaryReviewAnalysis))
                    .Add(Expression.Eq("SalaryScale", record))
                    .SetProjection(Projections.RowCount());

                if (criteria.UniqueResult<int>() > 0)
                    return true;
                else
                    return false;
            }
        }

        public class UserDao : AbstractNHibernateDao<User, int>, IUserDao
        {
            public User GetUserByLogin(string LoginID)
            {
                ICriteria criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(typeof(Login))
                    .Add(Expression.Eq("id", LoginID));

                Login login = criteria.UniqueResult<Login>();

                if (login == null)
                    return null;

                return login.User;
            }

            public User GetUserBySID(string SID)
            {
                ICriteria criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(typeof(User))
                    .Add(Expression.Eq("SID", SID));

                return criteria.UniqueResult<User>();
            }
        }
        #endregion
    }

    public class SalaryReviewAnalysisDao : AbstractNHibernateDao<SalaryReviewAnalysis, int>, ISalaryReviewAnalysisDao
    {
        public IList<SalaryReviewAnalysis> GetAll(string employeeID, string reviewerLogin, string creationDate, string propertyName, bool? ascending)
        {
                IList<SalaryReviewAnalysis> retval = null;
                if (String.IsNullOrEmpty(propertyName)) propertyName = "Employee.FullName";
                if (ascending == null) ascending = true;

                if ((String.IsNullOrEmpty(employeeID) || employeeID.Equals("0")) &&
                    ((String.IsNullOrEmpty(reviewerLogin) || reviewerLogin.Equals("0")) &&
                    ((String.IsNullOrEmpty(creationDate) || creationDate.Equals(String.Format("{0:MM/dd/yyyy}", DateTime.Today))))))
                {
                    retval = GetAllSalaryReviewAnalysis(propertyName, (bool)ascending);
                }
                else
                {
                    ICriteria criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(typeof(SalaryReviewAnalysis));
                    Conjunction conjunction = Expression.Conjunction();
                    criteria.CreateAlias("Employee", "Employee");

                    if (String.IsNullOrEmpty(employeeID) == false && employeeID.Equals("0") == false)
                    {
                        conjunction.Add(Expression.Eq("Employee.PkEmployee", employeeID));
                    }
                    if (String.IsNullOrEmpty(reviewerLogin) == false && reviewerLogin.Equals("0") == false)
                    {
                        conjunction.Add(Expression.Eq("InitiatedByReviewerName", reviewerLogin));
                    }
                    if (String.IsNullOrEmpty(creationDate) == false && creationDate.Equals(String.Format("{0:MM/dd/yyyy}", DateTime.Today)) == false)
                    {
                        conjunction.Add(Expression.Eq("DateInitiated", Convert.ToDateTime(creationDate)));
                    }
                    criteria.Add(conjunction);

                    if (propertyName.Equals("Department.Name"))
                    {
                        criteria.CreateAlias("Department", "Department")
                        .AddOrder(((bool)ascending ? Order.Asc(propertyName) : Order.Desc(propertyName)))
                        .AddOrder(Order.Asc("Employee.FullName"));
                    }
                    else
                    {
                        criteria.AddOrder(((bool)ascending ? Order.Asc(propertyName) : Order.Desc(propertyName)));
                        if (propertyName.Equals("Employee.FullName") == false)
                        {
                            criteria.AddOrder(Order.Asc("Employee.FullName"));
                        }
                    }

                    retval = criteria.List<SalaryReviewAnalysis>();
                }
                return retval;
        }

        public IList<SalaryReviewAnalysis> GetAllSalaryReviewAnalysis(string propertyName, bool ascending)
        {
             IList<SalaryReviewAnalysis> retval = null;

                if (String.IsNullOrEmpty(propertyName) || propertyName.Equals("Employee.FullName"))
                {
                    ICriteria criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(typeof(SalaryReviewAnalysis))
                      .CreateAlias("Employee", "Employee")
                      .AddOrder((ascending ? Order.Asc(propertyName) : Order.Desc(propertyName)));

                    retval = criteria.List<SalaryReviewAnalysis>();                    
                }
                else if (propertyName.Equals("Department.Name"))
                {
                    ICriteria criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(typeof(SalaryReviewAnalysis))
                      .CreateAlias("Department", "Department")
                      .AddOrder((ascending ? Order.Asc(propertyName) : Order.Desc(propertyName)));

                    retval = criteria.List<SalaryReviewAnalysis>();                    
                }
                else
                {
                    ICriteria criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(typeof(SalaryReviewAnalysis))
                      .AddOrder((ascending ? Order.Asc(propertyName) : Order.Desc(propertyName)));

                    retval = criteria.List<SalaryReviewAnalysis>();
                }

                return retval;
        }
    }
}
