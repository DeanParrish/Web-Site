using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            //GETS DDL SELECTION; Clears Select param; Gets Data from DB
            if (ddlSearch.SelectedValue.ToString() == "LName")
            {
                gvDataSource.SelectParameters.Clear();
                gvDataSource.SelectCommand = "SELECT [LastName], [FirstName], [Phone1], [Phone2], [Phone3], [CustomerNum] FROM [Customer] WHERE ([LastName] LIKE '%' + @LastName + '%')";
                gvDataSource.SelectParameters.Add("LastName", txtSearch.Text.ToString());
            }
            else if (ddlSearch.SelectedValue.ToString() == "FName")
            {
                gvDataSource.SelectParameters.Clear();
                gvDataSource.SelectCommand = "SELECT [LastName], [FirstName], [Phone1], [Phone2], [Phone3], [CustomerNum] FROM [Customer] WHERE ([FirstName] LIKE '%' + @FirstName + '%')";
                gvDataSource.SelectParameters.Add("FirstName", txtSearch.Text.ToString());
            }
            else if (ddlSearch.SelectedValue.ToString() == "Phone")
            {
                gvDataSource.SelectParameters.Clear();
                gvDataSource.SelectCommand = "SELECT [LastName], [FirstName], [Phone1], [Phone2], [Phone3], [CustomerNum] FROM [Customer] WHERE (([Phone1] LIKE '%' + @Phone + '%') OR ([Phone2] LIKE '%' + @Phone + '%') OR ([Phone3] LIKE '%' + @Phone + '%'))";
                gvDataSource.SelectParameters.Add("Phone", txtSearch.Text.ToString());
            }
        }
        catch (Exception)
        {

            lblError.Text = "An error has occured. Try Again.";
        }
       
    }

    protected void SqlDataSource2_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
            GridView1.DataBind();      
    }
    protected void SqlDataSource2_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
            GridView1.DataBind();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
            e.Row.ToolTip = "Click to select this row.";
        }
    }
}