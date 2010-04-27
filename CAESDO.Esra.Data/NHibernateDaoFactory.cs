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

        #endregion

        #region Inline DAO implementations

        public class GenericDao<T, IdT> : AbstractNHibernateDao<T, IdT>, IGenericDao<T, IdT> { }

        public class EmployeeDao : AbstractNHibernateDao<Employee, int>, IEmployeeDao
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

            public IList<Employee> GetEmployees(string propertyName, bool ascending, string titleCode, string employeeID, string departmentID)
            {
                IList<Employee> retval = null;

                if ((String.IsNullOrEmpty(titleCode) || titleCode.Equals("0"))&& 
                    (String.IsNullOrEmpty(employeeID) || employeeID.Equals("0")) &&
                    (String.IsNullOrEmpty(departmentID) || departmentID.Equals("0")))
                {
                    retval = GetAll(propertyName, ascending);
                }
                else
                {
                    ICriteria criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(typeof(Employee));
                    Conjunction conjunction = Expression.Conjunction();

                    if (String.IsNullOrEmpty(titleCode) == false && titleCode.Equals("0") == false)
                    {
                        criteria.CreateAlias("Title", "Title");
                        conjunction.Add(Expression.Eq("Title.TitleCode", titleCode));
                    }
                    if (String.IsNullOrEmpty(employeeID) == false && employeeID.Equals("0") == false)
                    {
                         conjunction.Add(Expression.Eq("id", Convert.ToInt32(employeeID)));
                    }
                    if (String.IsNullOrEmpty(departmentID) == false && departmentID.Equals("0") == false)
                    {
                        criteria.CreateAlias("HomeDepartment", "Department");
                        conjunction.Add(Expression.Eq("Department.id", Convert.ToInt32(departmentID)));
                    }
                    criteria.Add(conjunction);

                    if (propertyName.Equals("HomeDepartment"))
                    {
                        criteria.CreateAlias("HomeDepartment", "HomeDepartment")
                        .AddOrder((ascending ? Order.Asc("HomeDepartment.Name") : Order.Desc("HomeDepartment.Name")));
                    }
                    else
                    {
                        criteria.AddOrder((ascending ? Order.Asc(propertyName) : Order.Desc(propertyName)));
                    }

                    retval = criteria.List<Employee>();
                }
                return retval;
            }
        }

        #endregion

    }
}
