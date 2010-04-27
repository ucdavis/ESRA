using System.ComponentModel;
using CAESArch.BLL;
using CAESDO.Esra.Core.DataInterfaces;
using System.Linq;

namespace CAESDO.Esra.BLL
{
    [DataObject]
    public class GenericBLL<T, IdT> : GenericBLLBase<T,IdT>
    {
        public static IQueryable<T> EntitySet
        {
            get { return Queryable; }
        }

        public static IDaoFactory daoFactory
        {
            get
            {
                return new CAESDO.Esra.Data.NHibernateDaoFactory();
            }
        }
    }
}
