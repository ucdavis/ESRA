using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CAESDO.Esra.Web
{
    public partial class ModalConfirm : ApplicationPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Expose the __doPostBack function to programmatically call it from javascript
            Page.ClientScript.GetPostBackEventReference(this, String.Empty);
        }

        protected void YesButton_Click(object sender, EventArgs e)
        {
            // Code to delete the item goes here...

            Label1.Text = "Item deleted";
        } 

    }
}
