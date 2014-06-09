<%@ Page Title="" Language="C#" MasterPageFile="../Template.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="../Styles/Contact.css" />
    <script type="text/javscript" src="https://maps.googleapis.com/maps/api/js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="maincontent" runat="Server">
    <div id="section">
        <div class="floatedleft">
            <p>
                <span class="heading highlight">Contact me</span><br />
                <span class="link">I would love to hear from you!</span><br />
                Wether it be to talk sports or business opportunities, I don't care!     
            
            </p>
            <p>
                <span class="heading highlight">Direct Contact</span><br />
                The best way to contact me would be via email. Click the button below.<br />
                <span id="email">
                    <a href="mailto:parrish.de@gmail.com"><i title="E-Mail" class="fa fa-envelope"></i></a>
                </span>
            </p>
            <p>
                <span class="heading highlight">Social Media</span><br />
                If you liked what you saw here, please feel free to contact me on various social media outlets! Links are provided below.<br />
                <span id="socialmediaWrapper">
                    <span id="twitter">
                        <a href="https://twitter.com/parrish_de"><i title="Twitter" class="fa fa-twitter"></i></a>
                    </span>
                    <span id="linkedin">
                        <a href="http://www.linkedin.com/pub/dean-parrish/77/817/926"><i title="LinkedIn" class="fa fa-linkedin-square"></i></a>
                    </span>
                    <span id="github">
                        <a href="https://github.com/DeanParrish"><i title="GitHub" class="fa fa-git-square"></i></a>
                    </span>
                </span>
            </p>
        </div>
        <div class="floatedright">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d106536.2325671687!2d-82.00860587591708!3d33.44260328921788!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88f9d097160baa41%3A0x3ee78afde3aa0be4!2sAugusta%2C+GA!5e0!3m2!1sen!2sus!4v1402333923526" width="400" height="300" frameborder="0" style="border: 0"></iframe>
        </div>
        <!--<p id="floatedright">

            <!--If you like what you saw here, explore what is going on in my social media accounts! 
            <span id="socialmediaWrapper">
                
            </span>
        </p>-->
    </div>
</asp:Content>

