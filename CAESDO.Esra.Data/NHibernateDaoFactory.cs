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

                if ((titleCodes == null) || (titleCodes.Length == 0) || (titleCodes[0].Equals("0")) &&
                    ((String.IsNullOrEmpty(pkEmployee)) || pkEmployee.Equals("0")) &&
                    ((departmentIDs == null) || (departmentIDs.Length == 0) || (departmentIDs[0].Equals("0"))))
                {
                    retval = GetAll(propertyName, ascending);
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
        }

        #endregion

    }
}
