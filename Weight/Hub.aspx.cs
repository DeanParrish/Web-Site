using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Hub : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnFoodLog_Click(object sender, EventArgs e)
    {
        Response.Redirect("FoodLog.aspx");
    }
    protected void btnExerciseLog_Click(object sender, EventArgs e)
    {
        Response.Redirect("ExerciseLog.aspx");
    }
}