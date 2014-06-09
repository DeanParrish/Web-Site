<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Request.aspx.cs" Inherits="Request" MasterPageFile="../../Template.master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Chapter 9: Reservations</title>
    <link rel="stylesheet" type="text/css" href="../../Styles/WebApp.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class="section">
        <div class="webAppWrapper">
            <div class="webAppHeading">
                Hotel Reservation
            </div>
            <div class="webAppDesc">
                <ul>
                    <li></li>
                </ul>
            </div>
            <p id="arrival_date">
                Arrival date:&nbsp;
            <asp:TextBox ID="txtArrivalDate" runat="server" Width="75px">mm/dd/yyyy</asp:TextBox>&nbsp;
            <asp:ImageButton ID="ibtnCalendar" runat="server"
                ImageUrl="~/Images/Calendar.bmp" ImageAlign="Top"
                CausesValidation="False" OnClick="ibtnCalendar_Click" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ErrorMessage="Arrival date is required." Display="Dynamic"
                    ControlToValidate="txtArrivalDate" CssClass="validator"
                    InitialValue="mm/dd/yyyy">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server"
                    ControlToValidate="txtArrivalDate" CssClass="validator" Display="Dynamic"
                    ErrorMessage="You must enter a valid date." Operator="DataTypeCheck"
                    Type="Date">*</asp:CompareValidator>
                <asp:RangeValidator ID="rvArrival" runat="server"
                    ControlToValidate="txtArrivalDate" CssClass="validator" Display="Dynamic"
                    ErrorMessage="Arrival date must be within 6 months of the current date."
                    Type="Date" ViewStateMode="Enabled">*</asp:RangeValidator>
            </p>
            <p>
                <asp:Calendar ID="clnArrival" runat="server" Visible="False"
                    OnSelectionChanged="clnArrival_SelectionChanged"></asp:Calendar>
            </p>
            <p class="clear">
                Number of nights:&nbsp; 
            <asp:TextBox ID="txtNights" runat="server" Width="45px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="txtNights" CssClass="validator" Display="Dynamic"
                    ErrorMessage="Number of nights is required.">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator2" runat="server"
                    ControlToValidate="txtNights" CssClass="validator" Display="Dynamic"
                    ErrorMessage="Number of nights must be greater than or equal to 1."
                    Operator="GreaterThanEqual" Type="Integer" ValueToCompare="1">*</asp:CompareValidator>
            </p>
            <p>
                Number of adults:&nbsp;
            <asp:DropDownList ID="ddlAdults" runat="server" Width="50px"
                ViewStateMode="Enabled">
            </asp:DropDownList>&nbsp;&nbsp;
            Children:&nbsp;
            <asp:DropDownList ID="ddlChildren" runat="server" Width="50px"
                ViewStateMode="Enabled">
            </asp:DropDownList>
            </p>
            <h3>Preferences</h3>
            <p>
                Room type:&nbsp;
            <asp:RadioButton ID="rdoBusiness" runat="server" Text="Business"
                GroupName="Room" />&nbsp;
            <asp:RadioButton ID="rdoSuite" runat="server" Text="Suite" GroupName="Room" />&nbsp;
            <asp:RadioButton ID="rdoStandard" runat="server" Text="Standard"
                GroupName="Room" />
            </p>
            <p>
                Bed type:&nbsp;
            <asp:RadioButton ID="rdoKing" runat="server" Text="King"
                GroupName="Bed" />&nbsp;
            <asp:RadioButton ID="rdoDouble" runat="server" Text="Double Double"
                GroupName="Bed" />
            </p>
            <p>
                <asp:CheckBox ID="chkSmoking" runat="server" Text="Smoking" />
            </p>
            <p id="requests">Special requests:</p>
            <p>
                <asp:TextBox ID="txtSpecialRequests" runat="server" Rows="4" TextMode="MultiLine"
                    Width="250px"></asp:TextBox>
            </p>
            <h3 class="clear">Contact information</h3>
            <p class="contact">Name:</p>
            <p>
                <asp:TextBox ID="txtName" runat="server" Width="320px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                    ControlToValidate="txtName" CssClass="validator" Display="Dynamic"
                    ErrorMessage="Name is required.">*</asp:RequiredFieldValidator>
            </p>
            <p class="contact">Email:</p>
            <p>
                <asp:TextBox ID="txtEmail" runat="server" Width="320px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                    ControlToValidate="txtEmail" CssClass="validator" Display="Dynamic"
                    ErrorMessage="Email is required.">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                    ErrorMessage="Email format is invalid." ControlToValidate="txtEmail"
                    CssClass="validator" Display="Dynamic"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
            </p>
            <p id="buttons">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" Width="80px"
                    OnClick="btnSubmit_Click" />&nbsp;
            <asp:Button ID="btnClear" runat="server" Text="Clear" Width="80px"
                CausesValidation="False" OnClick="btnClear_Click" />
            </p>
            <p id="validation">
                &nbsp;<asp:ValidationSummary ID="ValidationSummary1" runat="server"
                    CssClass="validator" HeaderText="Please correct the following errors:" />
            </p>
        </div>
    </div>
</asp:Content>


