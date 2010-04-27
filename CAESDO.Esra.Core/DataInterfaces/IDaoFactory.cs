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
        IDepartmentDao GetDepartmentDao();
        IEmployeeDao GetEmployeeDao();
        IEmployeeChangesDao GetEmployeeChangesDao();
        ISalaryScaleDao GetSalaryScaleDao();
        IUserDao GetUserDao();
        IUnitDao GetUnitDao();
        ISalaryReviewAnalysisDao GetSalaryReviewAnalysisDao();
        ISalaryGradeQuartilesDao GetSalaryGradeQuartilesDao();
        ITitleDao GetTitleDao();
    }

    // There's no need to declare each of the DAO interfaces in its own file, so just add them inline here.
    // But you're certainly welcome to put each declaration into its own file.
    #region Inline interface declarations

    public interface IGenericDao<T, IdT> { }

    public interface IDepartmentDao { }

    public interface ITitleDao
    {
        IList<string> GetDistinctTitleCodesWithSalarySteps();
    }

    public interface IEmployeeDao
    {
        IList<Employee> GetByTitleCode(string titleCode, string propertyName, bool ascending);
        IList<Employee> GetEmployees(string propertyName, bool ascending, string[] titleCodes, string pkEmployee, string[] departmentIDs);
        IList<Employee> GetAllEmployees(string propertyName, bool ascending);
    }

    public interface IEmployeeChangesDao
    {
        IList<EmployeeChanges> GetLatestChanges(string employeeID, int? changeTypeID, int? maxNumChanges);
    }

    public interface ISalaryScaleDao
    {
        SalaryScale GetEffectiveSalaryScale(string titleCode, DateTime effectiveDate);
        IList<SalaryScale> GetAllSalaryScale(string propertyName, bool ascending);
        IList<SalaryScale> GetAllSalaryScalesWithSalarySteps(string propertyName, bool ascending);
        IList<SalaryScale> GetAllSalaryScalesWithSalarySteps(string titleCode, string propertyName, bool ascending);
        bool Exists(SalaryScale record);
        bool HasSalaryGradeQuartiles(SalaryScale record);
        SalaryGradeQuartiles GetSalaryGradeQuartiles(SalaryScale record);
        bool HasSalarySteps(SalaryScale record);
        IList<SalaryStep> GetSalarySteps(SalaryScale record);
        bool HasSalaryReviewAnalysis(SalaryScale record);
    }

    public interface ISalaryGradeQuartilesDao
    {
        IList<SalaryGradeQuartiles> GetDistinct();
        IList<String> GetDistinctSalaryGrades();
    }

    public interface IUserDao
    {
        User GetUserByLogin(string LoginID);
        User GetUserBySID(string SID);
        IList<User> GetUsersInApplication(string[] pUnits, string roleName);
        IList<Roles> GetRolesByUser(string selectedLoginID);
        IList<Unit> GetUnitsByUser(string selectedLoginID);
    }

    public interface IUnitDao { }

    public interface ISalaryReviewAnalysisDao
    {
        IList<SalaryReviewAnalysis> GetAllSalaryReviewAnalysis(string propertyName, bool ascending);
        IList<SalaryReviewAnalysis> GetAll(string employeeID, string reviewerLogin, string creationDate, string propertyName, bool? ascending);
    }

    #endregion
}
