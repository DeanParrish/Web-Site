<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="Projects.aspx.cs" Inherits="Projects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
            <asp:DropDownList ID="ddlFromCurrency" runat="server"></asp:DropDownList>
            Select currency to convert to:
            <asp:DropDownList ID="ddlToCurrency" runat="server"></asp:DropDownList><br />
            Enter amount:
            <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="CCReqValidator" runat="server" ControlToValidate="txtAmount" Text="This field is required" ErrorMessage="This field is required" CssClass="error" ValidationGroup="ConvertCurrency" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="CCNumericValid" runat="server" ControlToValidate="txtAmount" Text="This field must be numeric" ErrorMessage="This field must be numeric" CssClass="error" Display="Dynamic" ValidationGroup="ConvertCurrency" ValidationExpression="^\d{0,}(\.\d{1,2})?$"></asp:RegularExpressionValidator><br />
            <asp:Button ID="btnSubmit" runat="server" Text="Convert" OnClick="btnSubmit_Click" ValidationGroup="ConvertCurrency" /><br />
            <asp:Label ID="lblCCResult" runat="server"></asp:Label>
         </div>
</asp:Content>

