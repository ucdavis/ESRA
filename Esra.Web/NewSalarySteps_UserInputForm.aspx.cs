using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CAESDO.Esra.Web
{
    public partial class NewSalarySteps_UserInputForm : ApplicationPage
    {

        protected string TitleCode
        {
            get
            {
                string retval = Request.QueryString[KEY_TITLE_CODE];

                long temp = 0;
                if (String.IsNullOrEmpty(retval) || retval.Length != 4 || long.TryParse(retval, out temp) == false)
                {
                    retval = null;
                }

                return retval;
            }
        }

        protected string EffectiveDate
        {
            get
            {
                string retval = Request.QueryString[KEY_EFFECTIVE_DATE];

                DateTime temp;
                if (String.IsNullOrEmpty(retval) || retval.Length == 0 || DateTime.TryParse(retval, out temp) == false)
                {
                    retval = null;
                }
                else
                {
                    retval = String.Format("{0:MM/dd/yyyy}", temp);
                }

                return retval;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.SetActiveView(vNoSalaryScaleDataProvided);
                
                if (String.IsNullOrEmpty(TitleCode) == false && String.IsNullOrEmpty(EffectiveDate) == false)
                {
                    MultiView1.SetActiveView(vEditNewSalarySteps);
                    // TODO: Add logic to get Salary Scale and begin adding steps.
                }
            }
        }
    }
}
