using Esra.Web.CatOps;
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

        public CatbertUsersRev(CatbertUsers user) : this(user, null)
        {
        }
        
         public CatbertUsersRev(CatbertUsers user, Roles[] roles)
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
         }

        public CatbertUsersRev() { }
    }
}

