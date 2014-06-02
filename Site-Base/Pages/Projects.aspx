<%@ Page Title="" Language="C#" MasterPageFile="../Template.master" AutoEventWireup="true"
    CodeFile="Projects.aspx.cs" Inherits="Projects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="../Styles/Projects.css" />
    <script type="text/javascript" src="../Scripts/jQuery_1.11.1.js"></script>
    <script type="text/javascript" src="../Scripts/Projects.js"></script>
    <script type="text/javascript" src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="maincontent" runat="Server">
    <div class="heading">
        Web Applications

    </div>
    <div class="section">
        <div class="imageThum">
            <a href="ConvertCurrency.aspx"><span class="link imgText">Currency ConverstionDatabase Front EndDatabase Front End</span><img class="image" alt="ConvertCurrency" src="../Images/CurrencyConvertThumb.png" /></a>
        </div>
    <div class="imageThum">
        <a href="DBFrontEnd.aspx"><span class="link imgText">Database Front End</span><img class="image" alt="DBFrontEnd" src="../Images/DBFrontEndThumb.png"</a>
    </div>

    </div>
</asp:Content>
