using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CAESDO.Esra.BLL;
using CAESDO.Esra.Core.Domain;
using System.Globalization;

namespace CAESDO.Esra.Web
{
    public partial class SalaryStep_UserInputForm : ApplicationPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvSalaryScales_Sorting(object sender, GridViewSortEventArgs e)
        {
            gridView_Sorting((GridView)sender, e, odsSalaryScale, "SalaryStep_UserInputForm");
        }

        protected void lvSalarySteps_ItemEditing(object sender, EventArgs e)
        {
            ResetMasterPageLabel(MASTER_PAGE_MESSAGE_LABEL_NAME);
        }

        protected void gvSalaryScales_OnCommand(object sender, CommandEventArgs e)
        {
            string[] keySegments = ((string)e.CommandArgument).Split(new char[]{'|'}) ;
            if (e.CommandName.Equals("Copy"))
            {
                SalaryScale ss = SalaryScaleBLL.GetEffectiveSalaryScale(keySegments[0], Convert.ToDateTime(keySegments[1]));
                
                SalaryScale ssCopy = ss.InitializedCopy();
                List<SalaryScale> ssList = new List<SalaryScale>();
                ssList.Add(ssCopy);
                lvNewSalaryScale.DataSource = ssList;
                lvNewSalaryScale.DataBind();
                
                // Open the edit view and allow the user to edit the efective date and salary amounts.
            }
        }

        protected void tbSalaryAmount_OnTextChanged(object sender, EventArgs args)
        {
            NumberStyles styles = NumberStyles.Number | NumberStyles.AllowCurrencySymbol;
            NumberFormatInfo numberFormatInfo = CultureInfo.CurrentCulture.NumberFormat;
            TextBox tb = (TextBox)sender;
            ListViewDataItem item = (ListViewDataItem)tb.NamingContainer;

            // get new salary amount:
            double newSalary = 0;
            double.TryParse(tb.Text, styles, numberFormatInfo, out newSalary);
            tb.Text = String.Format("{0:c}", newSalary);
           
            // calculate new monthly amount:
            double monthlyAmount = newSalary / 12;
            Label lblMonthly = item.FindControl("lblMonthly2") as Label;
            if (lblMonthly == null)
            {
                lblMonthly = item.FindControl("lblMonthly3") as Label;
            }
            monthlyAmount = Math.Round(monthlyAmount, 0, MidpointRounding.AwayFromZero);
            lblMonthly.Text = String.Format("{0:c}", monthlyAmount);

            // calculate new hourly amount:
            double hourlyAmount = newSalary / 2088;
            Label lblHourly = item.FindControl("lblHourly2") as Label;
            if (lblHourly == null)
            {
                lblHourly = item.FindControl("lblHourly3") as Label;
            }
            lblHourly.Text = String.Format("{0:c}", hourlyAmount);
        }
    }
}
