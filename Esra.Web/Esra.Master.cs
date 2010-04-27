using System;
using System.Web.Security;
using System.Web.UI;

namespace CAESDO.Esra.Web
{
    public partial class Esra : System.Web.UI.MasterPage
    {
        public static readonly string DEFAULT_PAGE = "Default.aspx";
        protected string _Version;
        public string Version
        {
            set { _Version = value; }
            get { return _Version; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Version = System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString();
            lbl_Version.Text = "Version : " + Version;

            if (!Page.IsPostBack)
            {
                if (Session["Message"] != null)
                {
                    this.lbl_Message.Text = Session["Message"].ToString();
                    this.lbl_Message.Visible = true;
                    Session["Message"] = null;
                }
                else
                {
                    this.lbl_Message.Visible = false;
                }
            }
            else
            {
                this.lbl_Message.Visible = false;
            }
        }

        protected void imgBtnLogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Abandon();
            string myLogoutPage = "LogoutPage.aspx";
            string postBackUrl = "https://cas.ucdavis.edu/cas/logout?service=" + Request.Url.ToString().Substring(0, Request.Url.ToString().LastIndexOf("/") + 1) + myLogoutPage; 
            Response.Redirect(postBackUrl);        
        }
    }
}
