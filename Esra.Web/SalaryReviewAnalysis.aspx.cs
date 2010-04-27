using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using CAESDO.Esra.BLL;


namespace CAESDO.Esra.Web
{
    public partial class SalaryReviewAnalysis : ApplicationPage
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            // Scott says to put logic for query string parsing in the Page_Init method.

            if (!IsPostBack)
            {
                tbCreationDate.Text = String.Format("{0:MM/dd/yyyy}", DateTime.Today);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.SetActiveView(vSelectSalaryReviewAnalysis);
            }
        }

        protected void btnFindSRA_Click(object sender, EventArgs e)
        {
            ddlReferenceNumber.SelectedIndex = -1;
            gvSalaryReviewAnalysis.DataSource = SalaryReviewAnalysisBLL.GetAll(ddlEmployee.SelectedValue, ddlCreatedBy.SelectedValue, tbCreationDate.Text, "Employee.FullName", true);
            gvSalaryReviewAnalysis.DataBind();
        }

        protected void ddlReferenceNumber_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlEmployee.SelectedIndex = -1;
            ddlCreatedBy.SelectedIndex = -1;
            tbCreationDate.Text = String.Format("{0:MM/dd/yyyy}", DateTime.Today);
            gvSalaryReviewAnalysis.DataSource = SalaryReviewAnalysisBLL.GetByReferenceNumber(ddlReferenceNumber.SelectedValue);
            gvSalaryReviewAnalysis.DataBind();
        }


        protected void ddlNewSAREmployee_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            string id = ddl.SelectedValue;
            string redirectURL = "~/Test.aspx?EmployeeID=" + id;
            Response.Redirect(redirectURL);
        }
    }
}
