<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="Projects.aspx.cs" Inherits="Projects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="maincontent" Runat="Server">
    <div id="page">
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
            <asp:DropDownList ID="ddlFromCurrency" runat="server"></asp:DropDownList>
            <asp:DropDownList ID="ddlToCurrency" runat="server"></asp:DropDownList>
            <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
            <asp:Button ID="btnSubmit" runat="server" Text="Convert" OnClick="btnSubmit_Click" />
            <asp:Label ID="lblCCResult" runat="server"></asp:Label>
         </div>
    </div>
</asp:Content>

