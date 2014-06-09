<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Confirmation.aspx.cs" Inherits="Confirmation" MasterPageFile="../Template.master" %>

<asp:Content ID="contenthead" runat="server" ContentPlaceHolderID="head">
    <title>Chapter 9: Reservations</title>
    <link rel="stylesheet" type="text/css" href="../Styles/MainStyle.css" />
    <link rel="stylesheet" type="text/css" href="../Styles/Reservation.css" />
    <link rel="stylesheet" type="text/css" href="../Styles/WebApp.css" />
    <script type="text/javascript" src="../Scripts/jQuery_1.11.1.js"></script>
    <script type="text/javascript" src="../Scripts/ProjectPage.js"></script>
    <script type="text/javascript" src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js"></script>
</asp:Content>

<asp:Content ID="contentmain" runat="server" ContentPlaceHolderID="maincontent">
    <h1>Royal Inn and Suites</h1>
    <h2>Where you&rsquo;re always treated like royalty</h2>
    <h3>Please confirm your reservation request</h3>
    <p class="text">Name:</p>
    <p class="label">
        <asp:Label ID="lblName" runat="server"></asp:Label>
    </p>
    <p class="text">Email:</p>
    <p class="label">
        <asp:Label ID="lblEmail" runat="server"></asp:Label>
    </p>
    <p class="text">Arrival date:</p>
    <p class="label">
        <asp:Label ID="lblArrivalDate" runat="server"></asp:Label>
    </p>
    <p class="text">Departure date:</p>
    <p class="label">
        <asp:Label ID="lblDepartureDate" runat="server"></asp:Label>
    </p>
    <p class="text">Number of adults:</p>
    <p class="label">
        <asp:Label ID="lblNoOfAdults" runat="server"></asp:Label>
    </p>
    <p class="text">Number of children:</p>
    <p class="label">
        <asp:Label ID="lblNoOfChildren" runat="server"></asp:Label>
    </p>
    <p class="text">Room type:</p>
    <p class="label">
        <asp:Label ID="lblRoomType" runat="server"></asp:Label>
    </p>
    <p class="text">Bed type:</p>
    <p class="label">
        <asp:Label ID="lblBedType" runat="server"></asp:Label>
    </p>
    <p class="text">Smoking:</p>
    <p class="label">
        <asp:Label ID="lblSmoking" runat="server"></asp:Label>
    </p>
    <p class="text">Special requests:</p>
    <p class="label">
        <asp:Label ID="lblSpecialRequests" runat="server"></asp:Label>
    </p>
    <p id="buttons">
        <asp:Button ID="btnConfirm" runat="server" Text="Confirm Request"
            OnClick="btnConfirm_Click" />&nbsp;
            <asp:Button ID="btnModify" runat="server" Text="Modify Request"
                PostBackUrl="~/Request.aspx" />
    </p>
    <p id="message">
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
    </p>

    <!--Code snippet and button -->
    <a href="#CCSnippet" class="showCode"><i title="Show Code" class="fa fa-plus"></i>Show
            Code</a>
    <div class="codeSnippet" id="CCSnippet">
        <div class="snippetDesc">
            <span class="error">NOTE: This portion is non-existant on the sample above.</span> Since we're confirming information,
            it might be good business to send an E-Mail to the one provided. The code below does just that when the user hit the button
            to confirm. It also adds the session and cookie mentioned on the Request.aspx page.
        </div>
        <pre class="prettyprint">
protected void btnConfirm_Click(object sender, EventArgs e)
    {
        reservation = (Reservation)Session["Reservation"];

        HttpCookie nameCookie = new HttpCookie("UserName", lblName.Text);
        nameCookie.Expires = DateTime.Now.AddMonths(6);
        Response.Cookies.Add(nameCookie);

        HttpCookie emailCookie = new HttpCookie("Email", lblEmail.Text);
        emailCookie.Expires = DateTime.Now.AddMonths(6);
        Response.Cookies.Add(emailCookie);

        SmtpClient SMTP = new SmtpClient();
        MailMessage mail = new MailMessage();

        mail.To.Add(reservation.Email);
        mail.From = new MailAddress("gmailuser", "Dean Parrish");
        mail.IsBodyHtml = true;
        mail.Subject = "Your reservation details at Royal Inn and Suites";
        mail.Body = "Your reservation has been set " + reservation.Name +
                ". Please specifications below: (linebreak here)" +
                "Arrival Date: " + reservation.ArrivalDate + "(linebreak here)" +
                "Number of Nights: " + reservation.DepartureDate.Subtract(reservation.ArrivalDate) + "(linebreak here)" +
                "Number of Adults: " + reservation.NoOfAdults + "(linebreak here)" +
                "Number of Children: " + reservation.NoOfChildren + "(linebreak here)" +
                "Room Type: " + reservation.RoomType + "(linebreak here)" +
                "Bed Type: " + reservation.BedType + "(linebreak here)" +
                "Smoking: " + reservation.Smoking + "(linebreak here)" +
                "Special Requests: " + reservation.SpecialRequests + "(linebreak here)";

        SMTP.Credentials = new System.Net.NetworkCredential("gmailuser", "pass");
        SMTP.Host = "smtp.gmail.com";
        SMTP.Port = 587;
        SMTP.EnableSsl = true;
        SMTP.UseDefaultCredentials = false;
        SMTP.DeliveryMethod = SmtpDeliveryMethod.Network;

        try
        {
            SMTP.Send(mail);
        }
        catch (Exception ex)
        {
            lblMessage.Text += ex.Message;
        }

    }
        </pre>
    </div>
</asp:Content>
