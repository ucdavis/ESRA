using Esra.Web.CatOps;
namespace CAESDO.Esra.Web
{
    public class CatbertUsersRev : CatbertUsers
    {
        private string _FullName;

        public string FullName
        {
            get { return LastName + ", " + FirstName; }
            set { _FullName = value; }
        }
    }
}

