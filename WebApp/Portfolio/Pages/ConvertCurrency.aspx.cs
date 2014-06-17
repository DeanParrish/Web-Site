using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MoneyConversion;
using System.Xml;
using System.Xml.Linq;
using System.Xml.XPath;
using System.Threading.Tasks;



public partial class CurrencyConversion : System.Web.UI.Page
{
    MoneyConversion.CCLibrary CCLib = new MoneyConversion.CCLibrary(50, HttpContext.Current.Server.MapPath("~/App_Data/ExchangeRates.xml"));

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateDDLFromXML(HttpContext.Current.Server.MapPath("~/App_Data/ExchangeRates.xml"), "currency", ddlFromCurrency);
            PopulateDDLFromXML(HttpContext.Current.Server.MapPath("~/App_Data/ExchangeRates.xml"), "currency", ddlToCurrency);
            CCLib.UpdateFile(HttpContext.Current.Server.MapPath("~/App_Data/ExchangeRates.xml"), "http://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml");
        }

    }

    private void AppendElementXML(string path, string[,] arr)
    {
        XDocument xmlDoc = XDocument.Load(path);

        XElement newElement = new XElement("Cube");
        newElement.Add(new XAttribute("currency", "EUR"));
        newElement.Add(new XAttribute("rate", "1"));

        xmlDoc.XPathSelectElement("Envelope/Cube/Cube/Cube[@currency = 'USD']")
            .AddAfterSelf(newElement);
        xmlDoc.Save(path);
    }
    private void PopulateDDLFromXML(string doc, string attribute, DropDownList list)
    {
        XDocument xmlDoc = XDocument.Load(doc);
        MoneyConversion.XMLMethods xmlMTD = new MoneyConversion.XMLMethods();
        xmlDoc = xmlMTD.RemoveAllNamespaces(xmlDoc.ToString());

        var getAttributes = from att in xmlDoc.Descendants("Cube")
                            where att.HasAttributes
                            orderby att.Attribute(attribute).Value
                            select att.Attribute(attribute).Value;


        foreach (var item in getAttributes)
        {
            list.Items.Add(item.ToString());
        }


    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        if (IsValid)
        {
            decimal amt;
            decimal.TryParse(txtAmount.Text, out amt);
            lblCCResult.Text = txtAmount.Text + ddlFromCurrency.Text + " converts to " +
                CCLib.Convert(amt, ddlFromCurrency.Text, ddlToCurrency.Text).ToString() + ddlToCurrency.Text;
            txtAmount.Text = "";
        }

    }
}