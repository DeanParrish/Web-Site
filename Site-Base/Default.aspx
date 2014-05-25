<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="Stylesheet" type="text/css" href="Styles/Default.css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script type="text/javascript" src="http://malsup.github.com/jquery.cycle2.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" Runat="Server">
        <div class="section">
            <div class="heading text-align-right">Welcome!</div>
            <p>
                This site is designed by myself to showcase my talents. On this site you will find various 
                projects that I have either completed in school or as a side project.               
            </p>
            <div class="cycle-slideshow" id="slideshow">
                <img src="Images/database.jpg" />
                <img src="Images/learn-computer-programming.png" />
            </div>
        </div>
        
</asp:Content>

