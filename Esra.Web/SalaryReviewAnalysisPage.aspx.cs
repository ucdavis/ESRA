using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using CAESDO.Esra.BLL;
using CAESDO.Esra.Core.Domain;


namespace CAESDO.Esra.Web
{
    public partial class SalaryReviewAnalysisPage : ApplicationPage
    {
        protected static readonly string KEY_SALARY_REVIEW_ANALYSIS_ID = "CurrentSarID";
        protected static readonly string KEY_REFERENCE_NUM = "ReferenceNumber";
        protected static readonly string KEY_REFERENCE_NUM_INDEX = "ReferenceNumberIndex";
        protected static readonly string KEY_EMPLOYEE_ID_INDEX = "EmployeeIDIndex";
        protected static readonly string KEY_REVIEWER_NAME_INDEX = "ReviewerNameIndex";
        protected static readonly string KEY_CREATION_DATE = "CreationDate";

        protected static Employee NewSRAEmployee { get; set; }

# region restore_search_control_parameters 
        protected  int? ReferenceNumberIndex 
        {
            get { return Session[KEY_REFERENCE_NUM_INDEX] as int?; }
            set { Session[KEY_REFERENCE_NUM_INDEX] = value; }
        }

        protected  int? EmployeeIDIndex 
        {
            get { return Session[KEY_EMPLOYEE_ID_INDEX] as int?; }
            set { Session[KEY_EMPLOYEE_ID_INDEX] = value; }
        }

        protected  int? ReviewerNameIndex
        {
            get { return Session[KEY_REVIEWER_NAME_INDEX] as int?; }
            set { Session[KEY_REVIEWER_NAME_INDEX] = value; }
        }

        protected  string CreationDateString
        {
            get { return Session[KEY_CREATION_DATE] as string; }
            set { Session[KEY_CREATION_DATE] = value; }
        }

        protected string CurrentSarID
        {
            get { return Session[KEY_SALARY_REVIEW_ANALYSIS_ID] as string; }
            set { Session[KEY_SALARY_REVIEW_ANALYSIS_ID] = value; }
        }
# endregion

        protected string ReferenceNum
        {
            get
            {
                string retval = Request.QueryString[KEY_REFERENCE_NUM];
                
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
                NewSRAEmployee = null;
                CurrentSarID = null;
                tbCreationDate.Text = String.Format("{0:MM/dd/yyyy}", DateTime.Today);

                hiddenUserID.Value = UserBLL.GetCurrent().EmployeeID;
                hiddenIsDepartmentUser.Value = IsDepartmentUser().ToString();
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!IsPostBack)
            {
                MultiView1.SetActiveView(vSelectSalaryReviewAnalysis);
                Page.Form.DefaultButton = btnFindSRA.UniqueID;
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
            CurrentSarID = null;
            
            gvSalaryReviewAnalysis.DataBind();
        }

        protected void ddlReferenceNumber_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlEmployee.SelectedIndex = -1;
            ddlCreatedBy.SelectedIndex = -1;
            ddlNewSAREmployee.SelectedIndex = -1;
            if (String.IsNullOrEmpty(ddlReferenceNumber.SelectedValue) == false && ddlReferenceNumber.SelectedValue.Equals("0") == false)
            {
                CurrentSarID = ddlReferenceNumber.SelectedValue;
            }
            else
            {
                CurrentSarID = null;
            }
            
            gvSalaryReviewAnalysis.DataBind();
        }

        protected void ddlNewSAREmployee_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            string id = ddl.SelectedValue;

            Employee emp = EmployeeBLL.GetByID(id);
            NewSRAEmployee = emp;
            lblNewSRAEmployee.Text = emp.FullName;
            lblOriginalTitleCode.Text = emp.TitleCode;
            ddlProposedTitleCode.SelectedValue = emp.TitleCode;

            MultiView1.SetActiveView(vSelectReviewType);
        }

        protected void ddlProposedTitleCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = sender as DropDownList;
            string titleCodeString = ddl.SelectedValue;
            string proposedTitleCode = SalaryScaleBLL.GetEffectiveSalaryScale(titleCodeString, DateTime.Today).Title.TitleCode;
            string empId = NewSRAEmployee.ID;

            Response.Redirect(buildQueryString("SalaryReviewAnalysisEditor.aspx?" + KEY_EMPLOYEE_ID + "=" + empId + "&" + KEY_TITLE_CODE + "=" + proposedTitleCode));
        }

        protected void btnDoEquityReview_Click(object sender, EventArgs e)
        {
            string empId = NewSRAEmployee.ID;

            Response.Redirect(buildQueryString("SalaryReviewAnalysisEditor.aspx?" + KEY_EMPLOYEE_ID + "=" + empId));
        }

        protected void btnCancelSalaryReviewAnalysis_Click(object sender, EventArgs e)
        {
            NewSRAEmployee = null;
            ddlNewSAREmployee.SelectedIndex = -1;
            MultiView1.SetActiveView(vSelectSalaryReviewAnalysis);
        }

        protected void gvSalaryReviewAnalysis_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = (int)((GridView)sender).SelectedValue;
            string refNumber = SalaryReviewAnalysisBLL.GetByID(id).ReferenceNumber;
           
            // The point of this logic is to save the control settings so they may be 
            //restored upon return to this page.
            if (id > 0)
            {
                 ReferenceNumberIndex = ddlReferenceNumber.SelectedIndex;
                 EmployeeIDIndex = ddlEmployee.SelectedIndex;
                 ReviewerNameIndex = ddlCreatedBy.SelectedIndex;
                 CreationDateString = tbCreationDate.Text;
            }

            Response.Redirect(buildQueryString("SalaryReviewAnalysisViewer.aspx?" + KEY_REFERENCE_NUM + "=" + refNumber));
        }

        protected void lbtnBack_Click(object sender, EventArgs e)
        {
            CurrentSarID = null;
            
            //TODO Add logic to clear out the query string.
            MultiView1.SetActiveView(vSelectSalaryReviewAnalysis);
        }

        protected void gvSalaryReviewAnalysis_OnRowDeleting(object sender, EventArgs e)
        {
            LinkButton button = sender as LinkButton;
            if (button != null)
            {
                int id = Convert.ToInt32(button.CommandArgument);
                SalaryReviewAnalysisBLL.DeleteRecord(id);
            }

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
                gv.Columns[11].Visible = false;
            }
        }

        protected void gvSARDetails_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (IsDepartmentUser())
            {
                GridView gv = sender as GridView;
// ReSharper disable PossibleNullReferenceException
                gv.Columns[5].Visible = false;
// ReSharper restore PossibleNullReferenceException
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
            if (ReferenceNumberIndex != null)
            {
                ((DropDownList)sender).SelectedIndex = (int)ReferenceNumberIndex;
                ReferenceNumberIndex = null;
            }
        }

        protected void tbCreationDate_DataBound(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(CreationDateString) == false)
            {
                tbCreationDate.Text = CreationDateString;
                CreationDateString = null;
            }
        }

        protected void ddlCreatedBy_DataBound(object sender, EventArgs e)
        {
            if (ReviewerNameIndex != null)
            {
                ((DropDownList)sender).SelectedIndex = (int)ReviewerNameIndex;
                ReviewerNameIndex = null;
            }
        }

        protected void ddlEmployee_DataBound(object sender, EventArgs e)
        {
            if (EmployeeIDIndex != null)
            {
                ((DropDownList)sender).SelectedIndex = (int)EmployeeIDIndex;
                EmployeeIDIndex = null;
            }
        }
    }
}
