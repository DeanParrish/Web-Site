using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Xml.XPath;

public partial class Projects : System.Web.UI.Page
{
    ClassLibrary1.CCLibrary CCLib = new ClassLibrary1.CCLibrary(50, HttpContext.Current.Server.MapPath("~/App_Data/ExchangeRates.xml"));

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
        }
       
    }
        
}