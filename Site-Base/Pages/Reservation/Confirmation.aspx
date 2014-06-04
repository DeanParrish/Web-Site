<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Confirmation.aspx.cs" Inherits="Confirmation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Chapter 9: Reservations</title>
    <link href="Styles/Main.css" rel="stylesheet" type="text/css" />
    <link href="Styles/Confirmation.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="page">
    
        <h1>Royal Inn and Suites</h1>
        <h2>Where you&rsquo;re always treated like royalty</h2>
        <h3>Please confirm your reservation request</h3>
        <p class="text">Name:</p>
        <p class="label"><asp:Label ID="lblName" runat="server"></asp:Label></p>
        <p class="text">Email:</p>
        <p class="label"><asp:Label ID="lblEmail" runat="server"></asp:Label></p>
        <p class="text">Arrival date:</p>
        <p class="label"><asp:Label ID="lblArrivalDate" runat="server"></asp:Label></p>
        <p class="text">Departure date:</p>
        <p class="label"><asp:Label ID="lblDepartureDate" runat="server"></asp:Label></p>
        <p class="text">Number of adults:</p>
        <p class="label"><asp:Label ID="lblNoOfAdults" runat="server"></asp:Label></p>
        <p class="text">Number of children:</p>
        <p class="label"><asp:Label ID="lblNoOfChildren" runat="server"></asp:Label></p>
        <p class="text">Room type:</p>
        <p class="label"><asp:Label ID="lblRoomType" runat="server"></asp:Label></p>
        <p class="text">Bed type:</p>
        <p class="label"><asp:Label ID="lblBedType" runat="server"></asp:Label></p>
        <p class="text">Smoking:</p>
        <p class="label"><asp:Label ID="lblSmoking" runat="server"></asp:Label></p>
        <p class="text">Special requests:</p>
        <p class="label"><asp:Label ID="lblSpecialRequests" runat="server"></asp:Label></p>
        <p id="buttons">
            <asp:Button ID="btnConfirm" runat="server" Text="Confirm Request" 
                onclick="btnConfirm_Click" />&nbsp;
            <asp:Button ID="btnModify" runat="server" Text="Modify Request" 
                PostBackUrl="~/Request.aspx" />
        </p>
        <p id="message">
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </p>
        
    </div>
    </form>
</body>
</html>
