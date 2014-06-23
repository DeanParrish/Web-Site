using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CountDays : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (rdoAppConfig.SelectedValue == "EndYear")
        {
            txtEndDate.Enabled = false;
        }
        else
        {
            txtEndDate.Enabled = true;
        }
        if (!IsPostBack)
        {
            
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        TimeSpan result;
        DateTime start;
        DateTime end;
        lblResult.Text = "";
        if (Page.IsValid)
        {
            if (rdoAppConfig.SelectedValue == "EndYear")
            {
                DateTime.TryParse(txtStartDate.Text, out start);
                end = new DateTime(start.Year, 12, 31);

                result = end.Subtract(start);


                lblResult.Text = "There are " + result.Days.ToString() + " days between " + start.ToShortDateString() +
                    " and " + end.ToShortDateString();
              
            }
            else if (rdoAppConfig.SelectedValue == "SpecifiedDate")
            {
                DateTime.TryParse(txtStartDate.Text, out start);
                DateTime.TryParse(txtEndDate.Text, out end);

                result = end.Subtract(start);

                lblResult.Text = "There are " + result.Days.ToString() + " days between " + start.ToShortDateString() +
                    " and " + end.ToShortDateString();
            }

            
        }
    }
}