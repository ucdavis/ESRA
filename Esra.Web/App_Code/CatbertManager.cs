using System;
using System.Data;
using System.Configuration;
using System.Web;
//using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Configuration;
using System.ComponentModel;
using System.Net;
using Esra.Web.CatOps;
using CAESDO.Esra.BLL;
using CAESDO.Esra.Core.Domain;
using System.Collections.Generic;
//using CAESDO.Esra.Core.DataInterfaces;
//using CAESDO.Esra.Data;


namespace CAESDO.Esra.Web
{
    /// <summary>
    /// Summary description for CatbertManager
    /// </summary>
    [DataObject]
    public class CatbertManager
    {
        static readonly string HASH = WebConfigurationManager.AppSettings["CatbertHash"];
        static readonly string AppName = WebConfigurationManager.AppSettings["AppName"];

        public static CatbertWebService catops = new CatbertWebService();

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static Units[] GetUnits()
        {
            SetSecurityContext();

            return catops.GetUnits();
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static Roles[] GetRoles()
        {
            SetSecurityContext();

            return catops.GetRoles(AppName);
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static Users[] SearchNewUsersByLogin(string EmployeeID, string FirstName, string LastName, string LoginID)
        {
            SetSecurityContext();

            return catops.SearchNewUser(EmployeeID, FirstName, LastName, LoginID);
        }

        public static Users[] SearchCampusUser(string loginID)
        {
            SetSecurityContext();

            return catops.SearchNewUser(null, null, null, loginID);
            //return catops.SearchCampusNewUser(loginID, HASH);
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static Users[] SearchNewUsersByLogin(string login)
        {
            SetSecurityContext();

            return catops.SearchNewUser(null, null, null, login);
        }

        public static bool AddUserToRole(Users user, Roles role)
        {
            SetSecurityContext();

            return catops.AssignPermissions(user.Login, AppName, role.RoleID);
        }

        public static bool AddUserToRole(string login, int roleID)
        {
            SetSecurityContext();

            return catops.AssignPermissions(login, AppName, roleID);
        }

        public static bool RemoveUserFromRole(int roleID, string login)
        {
            SetSecurityContext();

            return catops.DeletePermissions(login, AppName, roleID);
        }

        public static bool AddUserToUnit(string login, int UnitID)
        {
            SetSecurityContext();

            return catops.AddUnit(login, UnitID);
        }

        public static bool RemoveUserFromUnit(string login, int UnitID)
        {
            SetSecurityContext();

            return catops.DeleteUnit(login, UnitID);
        }

        public static Roles[] GetRolesByUser(string login)
        {
            SetSecurityContext();

            return catops.GetRolesByUser(AppName, login);
        }

        public static Units[] GetUnitsByUser(string login)
        {
            SetSecurityContext();

            return catops.GetUnitsByUser(login);
        }

        //[DataObjectMethod(DataObjectMethodType.Select)]
        //public static CatbertUsers[] GetUsersInApplication()
        //{
        //    SetSecurityContext();

        //    return catops.GetUsersByApplications(AppName);
        //}

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static CatbertUsersRev[] GetUsersInApplication()
        {
            SetSecurityContext();

            return GetUsersWithFullName(catops.GetUsersByApplications(AppName), "Reviewer");
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static CatbertUsersRev[] GetUsersInApplication(string[] pUnits)
        {
            CatbertUsersRev[] retval = GetUsersWithFullName(catops.GetUsersByApplications(AppName), "Reviewer");

            if (pUnits != null && pUnits.Length > 0 && String.IsNullOrEmpty(pUnits[0]) == false)
            {
                List<CatbertUsersRev> users = new List<CatbertUsersRev>();
                bool userFound = false;
                foreach (CatbertUsersRev user in retval)
                {
                    userFound = false;
                    foreach(Units userUnit in user.Units)
                    {
                        foreach(string unitId in pUnits)
                        {
                            if (unitId.Equals(Convert.ToString(userUnit.UnitID)))
                            {
                                users.Add(user);
                                userFound = true;
                                break;
                            }
                        }
                        if (userFound) break;
                    }
                }
                retval = users.ToArray();
            }
            return retval;
        }

        public static int InsertNewUser(string login)
        {
            SetSecurityContext();

            Users[] newUsers = CatbertManager.SearchNewUsersByLogin(login);
            if (newUsers.Length != 1)
                return -1;

            return catops.InsertNewUser(newUsers[0]);
        }

        public static int InsertNewUser(Users user)
        {
            SetSecurityContext();

            return catops.InsertNewUser(user);
        }

        public static bool VerifyUser(string login)
        {
            SetSecurityContext();

            return catops.VerifyUser(login);
        }

        public CatbertManager()
        {

        }

        public static void SetSecurityContext()
        {
            SecurityContext sc = new SecurityContext();

            string username = HttpContext.Current.User.Identity.Name;

            User user = UserBLL.GetCurrent();

            sc.userID = username;
            sc.password = user.UserKey.ToString();

            System.Net.ServicePointManager.CertificatePolicy = new TrustAllCertificatePolicy();

            catops.SecurityContextValue = sc;
        }

        private static CatbertUsersRev[] GetUsersWithFullName(CatbertUsers[] users)
        {
            return GetUsersWithFullName(users, null);
        }
        private static CatbertUsersRev[] GetUsersWithFullName(CatbertUsers[] users, string roleName)
        {
            //IDaoFactory daoFactory = new NHibernateDaoFactory();
            List<CatbertUsersRev> retval = new List<CatbertUsersRev>();
            foreach (CatbertUsers user in users)
            {
                Roles[] roles = GetRolesByUser(user.Login);
                Units[] units = GetUnitsByUser(user.Login);

                if (String.IsNullOrEmpty(roleName) == false && roleName.Equals(user.Role) == false)
                {
                    retval.Add(new CatbertUsersRev(user, roles, units)); // add the user regardless of their role(s).
                }
                else
                {
                    //Roles[] roles = GetRolesByUser(user.Login);
                    foreach (Roles role in roles)
                    {
                        if (role.Role.Equals(roleName))
                        {
                            retval.Add(new CatbertUsersRev(user, roles, units));
                            break;
                        }
                    }
                }
            }
            return retval.ToArray();
        }
    }

    [AttributeUsage(AttributeTargets.Method)]
    public class SetCabertSecurityContextAttribute : Attribute
    {
        public SetCabertSecurityContextAttribute(CatbertWebService service)
        {
            SecurityContext sc = new SecurityContext();

            sc.userID = HttpContext.Current.User.Identity.Name;
            sc.password = "02188896-cb85-41a4-a2a3-060aeec2975b";

            System.Net.ServicePointManager.CertificatePolicy = new TrustAllCertificatePolicy();

            service.SecurityContextValue = sc;
        }
    }

    // Accept all certificates even self signed
    public class TrustAllCertificatePolicy : System.Net.ICertificatePolicy
    {
        public TrustAllCertificatePolicy()
        { }

        public bool CheckValidationResult(ServicePoint sp,
         System.Security.Cryptography.X509Certificates.X509Certificate cert, WebRequest req, int problem)
        {
            return true;
        }
    }
}

