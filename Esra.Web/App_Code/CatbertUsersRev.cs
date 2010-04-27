using Esra.Web.CatOps;
using System.Collections.Generic;
namespace CAESDO.Esra.Web
{
    public class CatbertUsersRev : CatbertUsers
    {
        private string _FullName;

        public string FullName
        {
            get { return _FullName; }
            set { _FullName = value; }
        }

        private Roles[] _Roles;

        public Roles[] Roles
        {
            get { return _Roles; }
            set { _Roles = value; }
        }

        private Units[] _Units;

        public Units[] Units
        {
            get { return _Units; }
            set { _Units = value; }
        }

        public CatbertUsersRev(CatbertUsers user)
            : this(user, null)
        {
        }

        public CatbertUsersRev(CatbertUsers user, Roles[] roles)
            : this(user, roles, null)
        {
        }

        public CatbertUsersRev(CatbertUsers user, Roles[] roles, Units[] units)
        {
            Department = user.Department;
            Email = user.Email;
            EmployeeID = user.EmployeeID;
            FirstName = user.FirstName;
            _FullName = user.LastName + ", " + user.FirstName;
            LastName = user.LastName;
            Login = user.Login;
            Role = user.Role;
            RoleID = user.RoleID;
            SID = user.SID;
            UserID = user.UserID;
            _Roles = roles;
            _Units = units;
        }

        public CatbertUsersRev() { }
    }
}

