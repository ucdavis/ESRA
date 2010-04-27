using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using CAESDO.Esra.BLL;
using CAESDO.Esra.Core.Domain;
using CAESDO.Esra.Data;

namespace CAESDO.Esra.Web
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*
            AppException exception = AppExceptionBLL.GetByID(21);

            Response.Write(string.Format("{0}: {1}", exception.ID, exception.DateException.ToShortDateString()));
            */
            /*
            exception.DateException = DateTime.Now;

            using (new TransactionScope())
            {
                Response.Write(
                    AppExceptionBLL.MakePersistent(ref exception)
                    );
            }
            */

            //AppException exception = new CAESDO.NHibernatev2.Data.NHibernateDaoFactory().GetGenericDao<AppException, int>().GetById(10, false);

            //Response.Write(exception.ApplicationID + " " + exception.DateException.ToShortDateString());
            //AppException exception = GenericBLL<AppException, int>.GetByID(10);
            //exception.ApplicationID = 2;

            //Response.Write(exception == null ? "Null value" : exception.ApplicationID);

        }
    }
}
