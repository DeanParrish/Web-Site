<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!--<link rel="stylesheet" type="text/css" href="Styles/MainStyle.css" />-->
    <link rel="Stylesheet" type="text/css" href="Styles/Default.css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script type="text/javascript" src="http://malsup.github.com/jquery.cycle2.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page">
        <div id="body">
            <h2>Welcome!</h2>
            <p>
                This site is designed by myself to showcase my talents. On this site you will find various 
                projects that I have either completed in school or as a side project.               
            </p>
            <div class="cycle-slideshow" id="slideshow">
                <img src="Images/database.jpg" />
                <img src="Images/learn-computer-programming.png" />
            </div>
        </div>
        
        

    </div>
        
</asp:Content>

