<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="Projects.aspx.cs" Inherits="Projects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="Styles/Projects.css" />
    <script type="text/javascript" src="Scripts/jQuery_1.11.1.js"></script>
    <script type="text/javascript" src="Scripts/Projects.js"></script>
    <script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="maincontent" Runat="Server">
        <div class="section">

               <div class="header">Currency Conversion Project</div>
            <ul>
                <li>Converts currency to other major currencies</li>
                <li>Updated Daily from the European Central Bank's <a href="http://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml">XML file.</a></li>
                <li>Technologies Used:
                    <ul>
                        <li>ASP.NET</li>
                        <li>C#.NET</li>
                        <li>LINQ to XML</li>
                    </ul>
                </li>
            </ul>
            Select currency to start with:
            <asp:DropDownList ID="ddlFromCurrency" runat="server"></asp:DropDownList><br />
            Select currency to convert to:
            <asp:DropDownList ID="ddlToCurrency" runat="server"></asp:DropDownList><br />
            Enter amount:
            <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="CCReqValidator" runat="server" ControlToValidate="txtAmount" Text="This field is required" ErrorMessage="This field is required" CssClass="error" ValidationGroup="ConvertCurrency" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="CCNumericValid" runat="server" ControlToValidate="txtAmount" Text="This field must be numeric" ErrorMessage="This field must be numeric" CssClass="error" Display="Dynamic" ValidationGroup="ConvertCurrency" ValidationExpression="^\d{0,}(\.\d{1,2})?$"></asp:RegularExpressionValidator><br />
            <asp:Button ID="btnSubmit" runat="server" Text="Convert" OnClick="btnSubmit_Click" ValidationGroup="ConvertCurrency" /><br />
            <asp:Label ID="lblCCResult" runat="server"></asp:Label><br />

            <!--Code snippet and button -->
            <a href="#CCSnippet" class="showCode"><img src="Images/plus.jpg" alt="plus.jpg" /> Show Code</a>
            <div class="codeSnippet" id="#CCSnippet">
                <div class="snippetDesc">This method populates the drop down lists above. It is accessing data from an XML file within the specified path. Reuse of code was a priority of implementing this.</div>
                <pre class="prettyprint">
private void PopulateDDLFromXML(string doc, string attribute, DropDownList list)
    {
        XDocument xmlDoc = XDocument.Load(doc);
        ClassLibrary1.XMLMethods xmlMTD = new ClassLibrary1.XMLMethods();
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
                </pre>
                <div class="snippetDesc">Since the values are in Euros, we must first convert the entered value into Euros. The first method return the Euro/specified currency. The second method converts that value into the specified currency.</div>
                <pre class="prettyprint">
private decimal GetCurrRate(string curr)
        {
            XMLMethods xmlMTD = new XMLMethods();
            xmlDoc = xmlMTD.RemoveAllNamespaces(xmlDoc.ToString());
                
            decimal retValue = 0;
            
            var GetDeciRate = from rate in xmlDoc.Descendants("Cube")
                              where (string)rate.Attribute("currency") == curr
                              select rate.Attribute("rate").Value;

            foreach (var item in GetDeciRate)
            {
                retValue = decimal.Parse(item);
            }
            
            return retValue;
        }

public decimal Convert(decimal amt, string inCurr, string outCurr)
        {
            try
            {
                decimal deciRetCurr = 0;
                decimal deciRate = GetCurrRate(outCurr);
                
                deciRetCurr = amt * ((1 / GetCurrRate(inCurr)) * deciRate);

                return Math.Round(deciRetCurr, 2);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                return 0;
            }         
        }
                </pre>
            </div>
         </div>
</asp:Content>

