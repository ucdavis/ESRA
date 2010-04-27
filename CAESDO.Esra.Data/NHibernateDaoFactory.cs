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
        }

        #endregion

    }
}
