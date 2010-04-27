﻿using CAESDO.Esra.Core.Domain;
using System.Collections.Generic;

namespace CAESDO.Esra.Core.DataInterfaces
{
    /// <summary>
    /// Provides an interface for retrieving DAO objects
    /// </summary>
    public interface IDaoFactory
    {
        IGenericDao<T, IdT> GetGenericDao<T, IdT>();
        IEmployeeDao GetEmployeeDao();
    }

    // There's no need to declare each of the DAO interfaces in its own file, so just add them inline here.
    // But you're certainly welcome to put each declaration into its own file.
    #region Inline interface declarations

    public interface IGenericDao<T, IdT> : IDao<T, IdT> { }

    public interface IEmployeeDao : IDao<Employee, int>
    {
        IList<Employee> GetByTitleCode(string titleCode, string propertyName, bool ascending);
    }

    #endregion
}
