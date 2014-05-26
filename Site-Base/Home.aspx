<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="Stylesheet" type="text/css" href="Styles/Default.css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" Runat="Server">
    <div class="section">
            <div id="twitter">
                <a class="twitter-timeline" href="https://twitter.com/parrish_de" data-widget-id="470747054365368320">Tweets by @parrish_de</a>
                <script>                    !function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + "://platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs); } } (document, "script", "twitter-wjs");</script>
            </div>
            <div class="heading"><b>About Me</b></div>
            <p>
                I'm an aspiring developer I'm an aspiring developer I'm an aspiring developer I'm an aspiring developer  I'm an aspiring developer I'm an aspiring developer             
            </p>
            
        </div>
       
</asp:Content>

