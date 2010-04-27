using CAESDO.Esra.Core.Domain;
using System.Collections.Generic;
using System;

namespace CAESDO.Esra.Core.DataInterfaces
{
    /// <summary>
    /// Provides an interface for retrieving DAO objects
    /// </summary>
    public interface IDaoFactory
    {
        IGenericDao<T, IdT> GetGenericDao<T, IdT>();
        IEmployeeDao GetEmployeeDao();
        ISalaryScaleDao GetSalaryScaleDao();
        IUserDao GetUserDao();
        IUnitDao GetUnitDao();
        ISalaryReviewAnalysisDao GetSalaryReviewAnalysisDao();
    }

    // There's no need to declare each of the DAO interfaces in its own file, so just add them inline here.
    // But you're certainly welcome to put each declaration into its own file.
    #region Inline interface declarations

    public interface IGenericDao<T, IdT> : IDao<T, IdT> { }

    public interface IEmployeeDao : IDao<Employee, string>
    {
        IList<Employee> GetByTitleCode(string titleCode, string propertyName, bool ascending);
        IList<Employee> GetEmployees(string propertyName, bool ascending, string[] titleCodes, string pkEmployee, string[] departmentIDs);

    }

    public interface ISalaryScaleDao : IDao<SalaryScale, int>
    {
        SalaryScale GetEffectiveSalaryScale(string titleCode, DateTime effectiveDate);
    }

    public interface IUserDao : IDao<User, int>
    {
        User GetUserByLogin(string LoginID);
        User GetUserBySID(string SID);
    }

    public interface IUnitDao : IDao<Unit, string> { }

    public interface ISalaryReviewAnalysisDao : IDao<SalaryReviewAnalysis, int>
    {
        new IList<SalaryReviewAnalysis> GetAll(string propertyName, bool ascending);
        IList<SalaryReviewAnalysis> GetAll(string employeeID, string reviewerLogin, string creationDate, string propertyName, bool? ascending);
    }

    #endregion
}
