<%@ Page Title="" Language="C#" MasterPageFile="../Template.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="Stylesheet" type="text/css" href="../Styles/Home.css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script type="text/javascript" src="../Scripts/Home.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" Runat="Server">
    <div class="section">
            <div id="twitter">
                <a class="twitter-timeline" href="https://twitter.com/parrish_de" data-widget-id="470747054365368320">Tweets by @parrish_de</a>
                <script type="text/javascript">                    !function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + "://platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs); } } (document, "script", "twitter-wjs");</script>
            </div>
            <div id="aboutmeimg">
                <img src="../Images/me.jpg" alt="Pic of myself" />
            </div>
            <div class="heading">About Me</div>
            <p>
                I'm an aspiring developer who has interests in the Microsoft technology stack, simple designs, and learning new technologies. 
                And football.             
            </p>
            <p>
                Located in Augusta, Georgia, I spend most of my time doing the same thing you are at this moment &#8211 staring at a computer
                screen. I wouldn't have it any other way.
            </p>
            <p>
                This site contains various <a class="link" href="Projects.aspx">projects</a> that I have completed during my time at Augusta Technical College, for clients, or
                 just playing around in my spare time. 
            </p>
            <p>
                Feel free to <a class="link" href="Contact.aspx">contact</a> me about job opportunities, Web design help, or just to connect. Or to talk about football, I don't
                care if it is the middle of March, we can find something to talk about!
            </p>      
        </div>      
</asp:Content>

