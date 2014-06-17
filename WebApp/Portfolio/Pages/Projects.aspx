<%@ Page Title="" Language="C#" MasterPageFile="../../Template.master" AutoEventWireup="true"
    CodeFile="Projects.aspx.cs" Inherits="Projects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="../Styles/Projects.css" />
    <script type="text/javascript" src="../Scripts/jQuery_1.11.1.js"></script>
    <script type="text/javascript" src="../Scripts/Projects.js"></script>
    <script type="text/javascript" src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="maincontent" runat="Server">
    <span class="heading">
        Web Applications
    </span><br />
    <span class="pagedesc">
        This page displays various projects that I have either completed in school or in free time. Click on each thumbnail to go to the
        specific project page. Some are working web applications and some are descriptions of web applications. All projects have
        <span class="highlight">code snippets</span> along with descriptions at the bottom of the page.
    </span>
    <div class="section">
        <div class="imageThum">
            <a href="ConvertCurrency.aspx"><span class="link imgText">Currency Converstion</span><img class="image" alt="ConvertCurrency" src="../Images/CurrencyConvertThumb.png" /></a>
        </div>
        <div class="imageThum">
            <a href="DBFrontEnd.aspx"><span class="link imgText">Database Front End</span><img class="image" alt="DBFrontEnd" src="../Images/DBFrontEndThumb.png" /></a>
        </div>
        <div class="imageThum">
            <a href="Request.aspx"><span class="link imgText">Reservation</span><img class="image" alt="Reservation" src="../Images/ReservationThumb.png" /></a>
        </div>
    </div>
</asp:Content>
