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
        protected static readonly string KEY_REFERENCE_NUM_INDEX = "ReferenceNumberIndex";
        protected static readonly string KEY_EMPLOYEE_ID_INDEX = "EmployeeIDIndex";
        protected static readonly string KEY_REVIEWER_NAME_INDEX = "ReviewerNameIndex";
        protected static readonly string KEY_CREATION_DATE = "CreationDate";

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
                pnlProposedTitleCodeNote.Visible = false;
                pnlProposedTitle.Visible = false;

                UCDEmployee user = EmployeeBLL.GetByProperty("EmployeeID", Session[KEY_CURRENT_USER_ID] as string);
                ViewState.Add(KEY_CURRENT_USER, user);

                MultiView1.SetActiveView(vSelectSalaryReviewAnalysis);

                if (String.IsNullOrEmpty(ReferenceNum) == false)
                {
                    SalaryReviewAnalysis sra = SalaryReviewAnalysisBLL.GetByReferenceNumber(ReferenceNum);
                    if (sra != null)
                    {
                        int id = sra.ID;
                        Session.Add(KEY_SALARY_REVIEW_ANALYSIS_ID, id);
                        ////Session.Add(KEY_EMPLOYEE_ID, sra.Employee.PkEmployee);
                        Session.Add(KEY_TITLE_ID, sra.Title.ID);

                        List<SalaryScale> salaryScales = new List<SalaryScale>();
                        salaryScales.Add(sra.SalaryScale);
                        gvSalaryScale.DataSource = salaryScales;
                        gvSalaryScale.DataBind();

                        // new logic for setting the Proposed title as applicable:

                        if (sra.IsReclass)
                        {
                            pnlProposedTitle.Visible = true;
                            lblCurrentTitleCode.Text = sra.Title.TitleCode_Name;
                        }

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
            Session.Remove(KEY_SALARY_REVIEW_ANALYSIS_ID);
            /*
            gvSalaryReviewAnalysis.DataSource = SalaryReviewAnalysisBLL.GetAll(
                Session[KEY_CURRENT_USER_ID] as string,
                IsDepartmentUser(),
                ddlEmployee.SelectedValue,
                ddlCreatedBy.SelectedValue,
                tbCreationDate.Text,
                "Employee.FullName",
                true);
             * */
            gvSalaryReviewAnalysis.DataBind();
        }

        protected void ddlReferenceNumber_SelectedIndexChanged(object sender, EventArgs e)
        {
            //List<CAESDO.Esra.Core.Domain.SalaryReviewAnalysis> items = new List<CAESDO.Esra.Core.Domain.SalaryReviewAnalysis>();
            ddlEmployee.SelectedIndex = -1;
            ddlCreatedBy.SelectedIndex = -1;
            ddlNewSAREmployee.SelectedIndex = -1;
            if (String.IsNullOrEmpty(ddlReferenceNumber.SelectedValue) == false && ddlReferenceNumber.SelectedValue.Equals("0") == false)
            {
                Session.Add(KEY_SALARY_REVIEW_ANALYSIS_ID, ddlReferenceNumber.SelectedValue);
            }
            else
            {
                Session.Remove(KEY_SALARY_REVIEW_ANALYSIS_ID);
            }
            
            //tbCreationDate.Text = String.Format("{0:MM/dd/yyyy}", DateTime.MinValue);
            /*
            if (String.IsNullOrEmpty(ddlReferenceNumber.SelectedValue) == false && ddlReferenceNumber.SelectedValue.Equals("0") == false)
            {
                items.Add(SalaryReviewAnalysisBLL.GetByID(Convert.ToInt32(ddlReferenceNumber.SelectedValue)));
            }
            */
            //lbtnBack_Click(null, null);
            //gvSalaryReviewAnalysis.DataSource = items;
            gvSalaryReviewAnalysis.DataBind();
        }


        protected void ddlNewSAREmployee_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            string id = ddl.SelectedValue;
            string redirectURL = "~/SalaryReviewAnalysisEditor.aspx?EmployeeID=" + id;

            Session.Add(KEY_REFERENCE_NUM_INDEX, ddlReferenceNumber.SelectedIndex);
            Session.Add(KEY_EMPLOYEE_ID_INDEX, ddlEmployee.SelectedIndex);
            Session.Add(KEY_REVIEWER_NAME_INDEX, ddlCreatedBy.SelectedIndex);
            Session.Add(KEY_CREATION_DATE, tbCreationDate.Text);

            Response.Redirect(redirectURL);
        }

        protected void gvSalaryReviewAnalysis_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = (int)((GridView)sender).SelectedValue;
            int? oldId = Session[KEY_SALARY_REVIEW_ANALYSIS_ID] as int?;
            if (id > 0)
            {
                ViewState.Add(KEY_REFERENCE_NUM_INDEX, ddlReferenceNumber.SelectedIndex);
                ViewState.Add(KEY_EMPLOYEE_ID_INDEX, ddlEmployee.SelectedIndex);
                ViewState.Add(KEY_REVIEWER_NAME_INDEX, ddlCreatedBy.SelectedIndex);
                ViewState.Add(KEY_CREATION_DATE, tbCreationDate.Text);

                Session.Add(KEY_SALARY_REVIEW_ANALYSIS_ID, id);
                CAESDO.Esra.Core.Domain.SalaryReviewAnalysis sra = SalaryReviewAnalysisBLL.GetByID(id);
                ////Session.Add(KEY_EMPLOYEE_ID, sra.Employee.PkEmployee);
                Session.Add(KEY_TITLE_ID, sra.Title.ID);

                List<SalaryScale> salaryScales = new List<SalaryScale>();
                salaryScales.Add(sra.SalaryScale);
                gvSalaryScale.DataSource = salaryScales;
                gvSalaryScale.DataBind();

                // Logic to set the proposed title if recalss.
                pnlProposedTitle.Visible = false;
                if (sra.IsReclass)
                {
                    pnlProposedTitle.Visible = true;
                    lblCurrentTitleCode.Text = sra.Title.TitleCode_Name;
                }

                if (oldId != null && oldId == id)
                {
                    gvSARDetails.DataBind();
                }

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

            //TODO Add logic to clear out the query string.
            MultiView1.SetActiveView(vSelectSalaryReviewAnalysis);
        }

        protected void lbtnEdit_Click(object sender, EventArgs e)
        {
            if (Session[KEY_REFERENCE_NUM_INDEX] == null)
                Session.Add(KEY_REFERENCE_NUM_INDEX, (int)ViewState[KEY_REFERENCE_NUM_INDEX]);
            if (Session[KEY_EMPLOYEE_ID_INDEX] == null)
                Session.Add(KEY_EMPLOYEE_ID_INDEX, (int)ViewState[KEY_EMPLOYEE_ID_INDEX]);
            if (Session[KEY_REVIEWER_NAME_INDEX] == null)
                Session.Add(KEY_REVIEWER_NAME_INDEX, (int)ViewState[KEY_REVIEWER_NAME_INDEX]);
            if (Session[KEY_CREATION_DATE] == null)
                Session.Add(KEY_CREATION_DATE, (string)ViewState[KEY_CREATION_DATE]);

            int id = (int)Session[KEY_SALARY_REVIEW_ANALYSIS_ID];
            SalaryReviewAnalysis sra = SalaryReviewAnalysisBLL.GetByID(id);
            string redirectURL = "~/SalaryReviewAnalysisEditor.aspx?ReferenceNumber=" + sra.ReferenceNumber;
            Response.Redirect(redirectURL);
        }

        protected void gvSalaryReviewAnalysis_OnRowDeleting(object sender, EventArgs e)
        { 
            /*
            GridView gv = sender as GridView;
            if (gv != null)
            {
                GridViewRow gvr = gv.Rows[((GridViewDeleteEventArgs)e).RowIndex];
                Label referenceNumber = gvr.FindControl("lblReferenceNumber") as Label;

                SalaryReviewAnalysisBLL.DeleteRecord(referenceNumber.Text);
            }
            else
             * */
            {
                LinkButton button = sender as LinkButton;
                if (button != null)
                {
                    int id = Convert.ToInt32(button.CommandArgument);
                    SalaryReviewAnalysisBLL.DeleteRecord(id);
                }
            }
            //GridViewDeleteEventArgs deleteEventArgs = e as GridViewDeleteEventArgs;
            //deleteEventArgs.Cancel = true;
           
            SetMasterPageLabel(MASTER_PAGE_MESSAGE_LABEL_NAME, MESSAGE_RECORD_DELETED_SUCCESS);

            ListItem item = ddlReferenceNumber.Items[0];
            ddlReferenceNumber.Items.Clear();
            ddlReferenceNumber.Items.Add(item);
            ddlReferenceNumber.DataBind();

            gvSalaryReviewAnalysis.DataBind();
        }

        protected void gvSalaryReviewAnalysis_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (IsDepartmentUser())
            {
                GridView gv = sender as GridView;
                gv.Columns[10].Visible = false;
            }
        }

        protected void gvSARDetails_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (IsDepartmentUser())
            {
                GridView gv = sender as GridView;
                gv.Columns[5].Visible = false;
            }
        }

        protected void gvSalaryReviewAnalysis_DataBound(object sender, EventArgs e)
        {
            pnlProposedTitleCodeNote.Visible = false;

            if (((GridView)sender).Rows.Count > 0)
            {
                pnlProposedTitleCodeNote.Visible = true;
            }
        }

        protected void gvSalaryReviewAnalysis_Sorting(object sender, GridViewSortEventArgs e)
        {
            gridView_Sorting((GridView)sender, e, odsGvSalaryReviewAnalysis, "SalaryReviewAnalysisPage");
        }

        protected void ddlReferenceNumber_DataBound(object sender, EventArgs e)
        {
            int? id = Session[KEY_REFERENCE_NUM_INDEX] as int?;
            if (id != null)
            {
                ((DropDownList)sender).SelectedIndex = (int)id;
                Session.Remove(KEY_REFERENCE_NUM_INDEX);
            }
        }

        protected void tbCreationDate_DataBound(object sender, EventArgs e)
        {
            string dateString = Session[KEY_CREATION_DATE] as string;
            if (String.IsNullOrEmpty(dateString) == false)
            {
                tbCreationDate.Text = dateString;
                Session.Remove(KEY_CREATION_DATE);
            }
        }

        protected void ddlCreatedBy_DataBound(object sender, EventArgs e)
        {
            int? id = Session[KEY_REVIEWER_NAME_INDEX] as int?;
            if (id != null)
            {
                ((DropDownList)sender).SelectedIndex = (int)id;
                Session.Remove(KEY_REVIEWER_NAME_INDEX);
            }
        }

        protected void ddlEmployee_DataBound(object sender, EventArgs e)
        {
            int? id = Session[KEY_EMPLOYEE_ID_INDEX] as int?;
            if (id != null)
            {
                ((DropDownList)sender).SelectedIndex = (int)id;
                Session.Remove(KEY_EMPLOYEE_ID_INDEX);
            }
        }
    }
}
