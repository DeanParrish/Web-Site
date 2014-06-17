using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Data.SqlClient;


public partial class Add : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        ddlState.SelectedValue = "GA";
        txtFName.Focus();
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        txtAddress.Text = "";
        txtCity.Text = "";
        txtComment.Text = "";
        txtLName.Text = "";
        txtPhone1.Text = "";
        txtPhone2.Text = "";
        txtPhone3.Text = "";
        txtZip.Text = "";
        ddlState.SelectedValue = "GA";
        lblCorrect.Text = "";
    }
    
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        
        try
        {
            txtFName.Text.Trim();
            txtLName.Text.Trim();
            txtPhone1.Text.Trim();
            txtPhone2.Text.Trim();
            txtPhone3.Text.Trim();
            txtAddress.Text.Trim();
            txtCity.Text.Trim();
            txtZip.Text.Trim();

            dsCustomer.Insert();

            txtFName.Text = "";
            txtLName.Text = "";
            txtPhone1.Text = "";
            txtPhone2.Text = "";
            txtPhone3.Text = "";
            txtAddress.Text = "";
            txtCity.Text = "";
            txtZip.Text = "";
            ddlState.SelectedValue = "GA";
            txtComment.Text = "";
            
            lblCorrect.Text = "Insert Complete!";
        }
        catch (Exception ex)
        {
            if (ex.Message.Contains("timeout"))
            {
                Response.Redirect("add.aspx");
            }
            //lblCorrect.Text = "";
            lblMessage.Text = "An error has occured, try again.";
        }

        
    }
}