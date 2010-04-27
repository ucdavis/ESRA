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
using System.Collections.Generic;
using CAESDO.Esra.Core.Domain;


namespace CAESDO.Esra.Web
{
    public partial class SalaryReviewAnalysisPage : ApplicationPage
    {
        protected static readonly string KEY_SALARY_REVIEW_ANALYSIS_ID = "CurrentSarID";
        protected static readonly string KEY_EMPLOYEE_ID = "CurrentEmployeeID";
        protected static readonly string KEY_TITLE_ID = "titleCode";

        protected void Page_Init(object sender, EventArgs e)
        {
            // Scott says to put logic for query string parsing in the Page_Init method.

            if (!IsPostBack)
            {
                Session.Remove(KEY_EMPLOYEE_ID);
                Session.Remove(KEY_SALARY_REVIEW_ANALYSIS_ID);
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
            List<CAESDO.Esra.Core.Domain.SalaryReviewAnalysis> items = new List<CAESDO.Esra.Core.Domain.SalaryReviewAnalysis>();
            ddlEmployee.SelectedIndex = -1;
            ddlCreatedBy.SelectedIndex = -1;
            //tbCreationDate.Text = String.Format("{0:MM/dd/yyyy}", DateTime.MinValue);
            if (String.IsNullOrEmpty(ddlReferenceNumber.SelectedValue) == false && ddlReferenceNumber.SelectedValue.Equals("0") == false)
            {
                CAESDO.Esra.Core.Domain.SalaryReviewAnalysis item = SalaryReviewAnalysisBLL.GetByID(Convert.ToInt32(ddlReferenceNumber.SelectedValue));
                items.Add(item);
            }
            gvSalaryReviewAnalysis.DataSource = items;
            gvSalaryReviewAnalysis.DataBind();
        }


        protected void ddlNewSAREmployee_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            string id = ddl.SelectedValue;
            string redirectURL = "~/SalaryReviewAnalysisEditor.aspx?EmployeeID=" + id;
            Response.Redirect(redirectURL);
        }

        protected void gvSalaryReviewAnalysis_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = (int)((GridView)sender).SelectedValue;
            if (id > 0)
            {
                Session.Add(KEY_SALARY_REVIEW_ANALYSIS_ID, id);
                CAESDO.Esra.Core.Domain.SalaryReviewAnalysis sra = SalaryReviewAnalysisBLL.GetByID(id);
                Session.Add(KEY_EMPLOYEE_ID, sra.Employee.ID);
                Session.Add(KEY_TITLE_ID, sra.Title.ID);
 
                MultiView1.SetActiveView(vSalaryReviewAnalysis);
            }
            else
            {
                MultiView1.SetActiveView(vSelectSalaryReviewAnalysis);
            }
        }

        protected void lbtnBack_Click(object sender, EventArgs e)
        {
            Session.Remove(KEY_SALARY_REVIEW_ANALYSIS_ID);
            Session.Remove(KEY_EMPLOYEE_ID);
            Session.Remove(KEY_TITLE_ID);

            MultiView1.SetActiveView(vSelectSalaryReviewAnalysis);
        }

        protected void lbtnEdit_Click(object sender, EventArgs e)
        {
            int id = (int)Session[KEY_SALARY_REVIEW_ANALYSIS_ID];
            SalaryReviewAnalysis sra = SalaryReviewAnalysisBLL.GetByID(id);
            string redirectURL = "~/SalaryReviewAnalysisEditor.aspx?ReferenceNumber=" + sra.ReferenceNumber;
            Response.Redirect(redirectURL);
        }
    }
}
