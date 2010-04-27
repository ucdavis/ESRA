using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using CAESDO.Esra.BLL;
using CAESDO.Esra.Core.Domain;

namespace CAESDO.Esra.Web
{
    public partial class SalaryReviewAnalysisViewer : ApplicationPage
    {
        protected static readonly string KEY_REFERENCE_NUM = "ReferenceNumber";
        
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
               
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!IsPostBack)
            {
                pnlProposedTitle.Visible = false;

                User user = UserBLL.GetCurrent();
                
                MultiView1.SetActiveView(vSalaryReviewAnalysis);

                if (String.IsNullOrEmpty(ReferenceNum) == false)
                {
                    SalaryReviewAnalysis sra = SalaryReviewAnalysisBLL.GetByReferenceNumber(ReferenceNum);
                    if (sra != null)
                    {
                        if (!IsDepartmentUser() || 
                            (IsDepartmentUser()&& SRAEmployeeBLL.IsDepartmentEmployee(user, sra.Employee)))
                        {
                            int id = sra.ID;

                            // The following lines set the hidden fields' values so that the
                            // corresponding ObjectDataSources' control values will have
                            // the appropriate values to bind against.
                            hiddenCurrentSarID.Value = id.ToString();
                            hiddenCurrentTitleCode.Value = sra.Title.ID;

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
                        else
                        {
                            MultiView1.SetActiveView(vNotAuthorized);
                        }
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

        protected void lbtnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect(buildQueryString(Request.QueryString["ReturnPage"]));
        }

        protected void lbtnEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect(buildQueryString("~/SalaryReviewAnalysisEditor.aspx?" + KEY_REFERENCE_NUM + "=" + ReferenceNum));
        }

        protected void gvSARDetails_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (IsDepartmentUser())
            {
                GridView gv = sender as GridView;
                gv.Columns[5].Visible = false;
            }
        }
    }
}
