<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="DBFrontEnd.aspx.cs" Inherits="Pages_DBFrontEnd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="html/css" href="../Styles/WebApp.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="Server">
    <div class="section">
        <div class="webAppWrapper">
            <div class="webAppHeading">
                Database Front End
            </div>
            <div class="webAppDesc">
                <ul>
                    <li>&#8226 Inserts customer information into SQL Server database</li>
                    <li>&#8226 Retrieves information via GridView when the search page is loaded</li>
                    <li>&#8226 Allows user to filter results in GridView via textbox above</li>
                    <li>&#8226 The main user and I brainstormed about different filter needs. Filtering includes:
                    <ul>
                        <li>&#8227 Last Name</li>
                        <li>&#8227 First Name</li>
                        <li>&#8227 Phone Number</li>
                        <li>&#8227 Partial phone number</li>
                    </ul>
                    </li>
                    <li>&#8226 The information can be updated via Details View control after selecting a reord</li>
                    <li>&#8226 Various client and server side validation to ensure data integrity</li>
                    <li>&#8226 Technologies used:
                    <ul>
                        <li>&#8227 ASP.NET</li>
                        <li>&#8227 C#.NET</li>
                        <li>&#8227 T-SQL</li>
                        <li>&#8227 jQuery</li>
                        <li>&#8227 SQL Server</li>
                    </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>

