using System.Collections.Generic;
using System.ComponentModel;
using CAESDO.Esra.Core.Domain;

namespace CAESDO.Esra.BLL
{
    public class RoleBLL : GenericBLL<Roles, int>
    {
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static IList<Roles> GetRoles()
        {
            IList<Roles> retval = null;

            var roles = GetAll("Role", true);
            
            if (roles != null && roles.Count > 0)
                retval = roles.Count > 1 ? new List<Roles>(new HashSet<Roles>(roles)) : roles;
            
            return retval;
        }
    }

    public class UnitBLL : GenericBLL<Unit, string>
    {
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static IList<Unit> GetUnits()
        {
            IList<Unit> retval = null;

            var units =  GetAll("FullName", true);

            if (units != null && units.Count > 0)
                retval = units.Count > 1 ? new List<Unit>(new HashSet<Unit>(units)) : units;
            
            return retval;
        }
    }

    public class UserBLL : GenericBLL<User, int>
    {
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static User GetByLogin(string login)
        {
            return daoFactory.GetUserDao().GetUserByLogin(login);
        }

        public static User GetCurrent()
        {
            return GetByLogin(System.Web.HttpContext.Current.User.Identity.Name);
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static IList<User> GetUsersInApplication(string[] pUnits, string roleName)
        {
            return daoFactory.GetUserDao().GetUsersInApplication(pUnits, roleName);
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static IList<Roles> GetRolesByUser(string selectedLoginID)
        {
            return daoFactory.GetUserDao().GetRolesByUser(selectedLoginID);
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static IList<Unit> GetUnitsByUser(string selectedLoginID)
        {
            return daoFactory.GetUserDao().GetUnitsByUser(selectedLoginID);
        }
    }
}
