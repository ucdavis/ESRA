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
        protected static readonly string KEY_TITLE_ID = "titleCode";
        protected static readonly string KEY_REFERENCE_NUM = "ReferenceNumber";

        protected string ReferenceNum
        {
            get
            {
                string retval = Request.QueryString[KEY_REFERENCE_NUM];
                if (String.IsNullOrEmpty(retval))
                {
                    retval = Session[KEY_REFERENCE_NUM] as string;
                }

                long temp = 0;
                // ###20081001 min length = 11
                if (String.IsNullOrEmpty(retval) || retval.Length < 11 || long.TryParse(retval, out temp) == false)
                {
                    retval = null;
                }
                return retval;
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            // Scott says to put logic for query string parsing in the Page_Init method.

            if (!IsPostBack)
            {
                Session.Remove(KEY_EMPLOYEE_ID);
                Session.Remove(KEY_SALARY_REVIEW_ANALYSIS_ID);
                Session.Remove(KEY_TITLE_ID);
                Session.Remove(KEY_REFERENCE_NUM);
                tbCreationDate.Text = String.Format("{0:MM/dd/yyyy}", DateTime.Today);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.SetActiveView(vSelectSalaryReviewAnalysis);
                if (String.IsNullOrEmpty(ReferenceNum) == false)
                {
                    SalaryReviewAnalysis sra = SalaryReviewAnalysisBLL.GetByReferenceNumber(ReferenceNum);
                    if (sra != null)
                    {
                        int id = sra.ID;
                        Session.Add(KEY_SALARY_REVIEW_ANALYSIS_ID, id);
                        Session.Add(KEY_EMPLOYEE_ID, sra.Employee.ID);
                        Session.Add(KEY_TITLE_ID, sra.Title.ID);

                        List<SalaryScale> salaryScales = new List<SalaryScale>();
                        salaryScales.Add(sra.SalaryScale);
                        gvSalaryScale.DataSource = salaryScales;
                        gvSalaryScale.DataBind();

                        MultiView1.SetActiveView(vSalaryReviewAnalysis);
                    }
                }
            }
        }

        protected void rtpSalary_OnItemDataBound(object sender, EventArgs e)
        {
            Repeater rpt = (Repeater)sender;
            if (rpt.Items.Count > 0)
            {
                rpt.Visible = true;
            }
            else
            {
                rpt.Visible = false;
            }
        }

        protected void btnFindSRA_Click(object sender, EventArgs e)
        {
            ddlReferenceNumber.SelectedIndex = -1;
            ddlNewSAREmployee.SelectedIndex = -1;
            gvSalaryReviewAnalysis.DataSource = SalaryReviewAnalysisBLL.GetAll(ddlEmployee.SelectedValue, ddlCreatedBy.SelectedValue, tbCreationDate.Text, "Employee.FullName", true);
            gvSalaryReviewAnalysis.DataBind();
        }

        protected void ddlReferenceNumber_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<CAESDO.Esra.Core.Domain.SalaryReviewAnalysis> items = new List<CAESDO.Esra.Core.Domain.SalaryReviewAnalysis>();
            ddlEmployee.SelectedIndex = -1;
            ddlCreatedBy.SelectedIndex = -1;
            ddlNewSAREmployee.SelectedIndex = -1;
            //tbCreationDate.Text = String.Format("{0:MM/dd/yyyy}", DateTime.MinValue);
            if (String.IsNullOrEmpty(ddlReferenceNumber.SelectedValue) == false && ddlReferenceNumber.SelectedValue.Equals("0") == false)
            {
                CAESDO.Esra.Core.Domain.SalaryReviewAnalysis item = SalaryReviewAnalysisBLL.GetByID(Convert.ToInt32(ddlReferenceNumber.SelectedValue));
                items.Add(item);
            }

            //lbtnBack_Click(null, null);
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

                List<SalaryScale> salaryScales = new List<SalaryScale>();
                salaryScales.Add(sra.SalaryScale);
                gvSalaryScale.DataSource = salaryScales;
                gvSalaryScale.DataBind();
 
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
            Session.Remove(KEY_REFERENCE_NUM);

            MultiView1.SetActiveView(vSelectSalaryReviewAnalysis);
        }

        protected void lbtnEdit_Click(object sender, EventArgs e)
        {
            int id = (int)Session[KEY_SALARY_REVIEW_ANALYSIS_ID];
            SalaryReviewAnalysis sra = SalaryReviewAnalysisBLL.GetByID(id);
            string redirectURL = "~/SalaryReviewAnalysisEditor.aspx?ReferenceNumber=" + sra.ReferenceNumber;
            Response.Redirect(redirectURL);
        }

        protected void gvSalaryReviewAnalysis_OnRowDeleting(object sender, EventArgs e)
        {
            GridView gv = sender as GridView;
            GridViewRow gvr = gv.Rows[((GridViewDeleteEventArgs)e).RowIndex];
            Label referenceNumber = gvr.FindControl("lblReferenceNumber") as Label;
          
            SalaryReviewAnalysisBLL.DeleteRecord(referenceNumber.Text);

            SetMasterPageLabel(MASTER_PAGE_MESSAGE_LABEL_NAME, MESSAGE_RECORD_DELETED_SUCCESS);

            ListItem item = ddlReferenceNumber.Items[0];
            ddlReferenceNumber.Items.Clear();
            ddlReferenceNumber.Items.Add(item);
            ddlReferenceNumber.DataBind();

            gvSalaryReviewAnalysis.DataBind();
        }
    }
}
