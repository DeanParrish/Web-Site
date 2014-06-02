<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="ConvertCurrency.aspx.cs" Inherits="CurrencyConversion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="../Styles/ConvertCurrency.css" />
    <script type="text/javascript" src="../Scripts/jQuery_1.11.1.js"></script>
    <script type="text/javascript" src="../Scripts/ConvertCurrency.js"></script>
    <script type="text/javascript" src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" Runat="Server">
    <div class="section">
        <div class="webAppWrapper">
            <div class="webAppHeading">
                Currency Conversion</div>
            <div class="webAppDesc">
                <ul>
                    <li>&#8226 Converts currency to other major currencies</li>
                    <li>&#8226 Updated Daily from the European Central Bank's <a href="http://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml"
                        class="linkProject">XML file.</a></li>
                    <li>&#8226 Technologies Used:
                        <ul>
                            <li>&#8227 ASP.NET</li>
                            <li>&#8227 C#.NET</li>
                            <li>&#8227 LINQ to XML</li>
                            <li>&#8227 HTML5 and CSS3</li>
                            <li>&#8227 jQuery library</li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="webApp">
                <div class="line">
                    Select currency to start with:
                    <asp:DropDownList ID="ddlFromCurrency" runat="server" CssClass="roundelement">
                    </asp:DropDownList>
                </div>
                <div class="line">
                    Select currency to convert to:
                    <asp:DropDownList ID="ddlToCurrency" runat="server" CssClass="roundelement">
                    </asp:DropDownList>
                </div>
                <div class="line">
                    Enter amount:
                    <asp:TextBox ID="txtAmount" runat="server" CssClass="roundelement"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="CCReqValidator" runat="server" ControlToValidate="txtAmount"
                        Text="*" ErrorMessage="This field is required" CssClass="error"
                        ValidationGroup="ConvertCurrency" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="CCNumericValid" runat="server" ControlToValidate="txtAmount"
                        Text="*" ErrorMessage="This field must be numeric" CssClass="error"
                        Display="Dynamic" ValidationGroup="ConvertCurrency" 
                        ValidationExpression="^\d{0,}(\.\d{1,2})?$"></asp:RegularExpressionValidator>
                </div>
                <div class="line">
                    <asp:Button ID="btnSubmit" runat="server" Text="Convert" OnClick="btnSubmit_Click"
                        CssClass="button" ValidationGroup="ConvertCurrency" />
                </div>
                <div class="line">
                    <asp:Label ID="lblCCResult" runat="server"></asp:Label>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="error" 
                        DisplayMode="SingleParagraph" ValidationGroup="ConvertCurrency" />
                </div>
            </div>
        </div>
        <!--Code snippet and button -->
        <a href="#CCSnippet" class="showCode"><i title="Show Code" class="fa fa-plus"></i>Show
            Code</a>
        <div class="codeSnippet" id="CCSnippet">
            <div class="snippetDesc">
                This method populates the drop down lists above. It is accessing data from an XML
                file within the specified path. Reuse of code was a priority of implementing this.</div>
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
            <div class="snippetDesc">
                Since the values are in Euros, we must first convert the entered value into Euros.
                The first method return the Euro/specified currency. The second method converts
                that value into the specified currency.
            </div>
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
            <div class="snippetDesc">This is what I use to update the XML file from the ECB. Since they omit
                the Euro, I add it after it is updated.
            </div>
            <pre class="prettyprint">
                       //UPDATES FILE USING FILEUPDATE CLASS
public void UpdateFile(string path, string address)
        {
            FileUpdate fileUp = new FileUpdate();
            XMLMethods xmlMTD = new XMLMethods();
            try
            {
                fileUp.UpdateFile(path, fileUp.DownloadUpdate(address));
                XDocument xmlDoc = XDocument.Load(path);
                xmlDoc = xmlMTD.RemoveAllNamespaces(xmlDoc.ToString());
                XElement newElement = new XElement("Cube");
                newElement.Add(new XAttribute("currency", "EUR"));
                newElement.Add(new XAttribute("rate", "1"));
                xmlDoc.XPathSelectElement("Envelope/Cube/Cube/Cube[@currency = 'USD']")
                    .AddAfterSelf(newElement);
                xmlDoc.Save(path);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }         
        }
</pre>
            <div class="snippetDesc">The classes called above (<span class="link">UpdateFile()</span> and <span class="link">
                DownloadUpdate()</span>) are defined below. 
            </div>
            <pre class="prettyprint">
public class FileUpdate
    {
        public string DownloadUpdate(string address)
        {
            string text;
            using (var client = new WebClient())
            {
                text = client.DownloadString(address);
            }
            return text;
        }
        public string UpdateFile(string path, string newFile)
        {
            try
            {
                File.WriteAllText(path, newFile);
                return "Update Succeeded.";
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                return "Update Failed.";
            }
        }
    }
</pre>
            <div class="snippetDesc">One last Snippet for this section, this class (<span class="link">XMLMethods()</span>)
                removes the namespaces from the XML files so I can work with them.          
            </div>
            <pre class="prettyprint">
public class XMLMethods
    {
        public XDocument RemoveAllNamespaces(string xmlDocument)
        {
            XElement xmlDocumentWithoutNs = RemoveAllNamespaces(XElement.Parse(xmlDocument));
            XDocument xmlDocumentRet = new XDocument();
            xmlDocumentRet.Add(xmlDocumentWithoutNs);
            return xmlDocumentRet;
        }
        private static XElement RemoveAllNamespaces(XElement xmlDocument)
        {
            if (!xmlDocument.HasElements)
            {
                XElement xElement = new XElement(xmlDocument.Name.LocalName);
                xElement.Value = xmlDocument.Value;
                foreach (XAttribute attribute in xmlDocument.Attributes())
                    xElement.Add(attribute);
                return xElement;
            }
            return new XElement(xmlDocument.Name.LocalName, xmlDocument.Elements().Select(el => RemoveAllNamespaces(el)));
        }
    }
</pre>
        </div>

    </div>
</asp:Content>

