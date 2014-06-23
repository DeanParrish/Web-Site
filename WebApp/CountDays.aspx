<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true"
    CodeFile="CountDays.aspx.cs" Inherits="CountDays" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Dean Parrish - Day Counter</title>
    <link rel="stylesheet" type="text/css" href="Styles/WebApp.css" />
    <link type="text/css" rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
    <script>
        jQuery(document).ready(function () {
            jQuery('#maincontent_txtStartDate').datepicker();
            jQuery("#maincontent_txtEndDate").datepicker();

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="Server">
    <div class="section">
        <div class="webAppWrapper">
            <div class="webAppHeading">
                Day Counter
            </div>
            <div class="webAppDesc">
                <ul>
                    <li>&#8226 Simple solution to return days remaining in the year</li>
                    <li>&#8227 ALT: Option to calculate until specified date</li>
                </ul>
            </div>
            <div class="webApp">
                <div class="line">
                    Select:
                    <asp:RadioButtonList runat="server" ID="rdoAppConfig" AutoPostBack="True" OnSelectedIndexChanged="rdoAppConfig_SelectedIndexChanged">
                        <asp:ListItem Selected="True" Text="End of Year" Value="EndYear"></asp:ListItem>
                        <asp:ListItem Text="Specified Date" Value="SpecifiedDate"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <div class="line">
                    Enter start day:
                    <asp:TextBox runat="server" ID="txtStartDate" placeholder="mm/dd/yyyy" ValidationGroup="AppConfig"
                        CssClass="roundelement"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ErrorMessage="Start Date is Required"
                        Text="*" CssClass="error" ControlToValidate="txtStartDate"></asp:RequiredFieldValidator>
                    <asp:CompareValidator runat="server" ErrorMessage="This field must be a valid date"
                        Text="*" CssClass="error" Operator="DataTypeCheck" Type="Date" ControlToValidate="txtStartDate"></asp:CompareValidator>
                </div>
                <div class="line">
                    Enter end day(only needed if checked above):
                    <asp:TextBox runat="server" ID="txtEndDate" placeholder="mm/dd/yyyy" ValidationGroup="AppConfig"
                        CssClass="roundelement"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="validreqEndDate" CssClass="error" Display="Dynamic" ControlToValidate="txtEndDate" Enabled="False" ErrorMessage="End Date is Required" Text="*"></asp:RequiredFieldValidator>
                    <asp:CompareValidator runat="server" CssClass="error" Display="Dynamic" ControlToValidate="txtEndDate" ControlToCompare="txtStartDate" Operator="GreaterThanEqual" ErrorMessage="This field must be later than the start date." Text="*"></asp:CompareValidator>
                </div>
                <div class="line">
                    <asp:Button runat="server" ID="btnSubmit" Text="Count!" CssClass="button" OnClick="btnSubmit_Click" />
                </div>
                <div class="line">
                    <asp:Label runat="server" ID="lblResult"></asp:Label>
                </div>
            </div>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="error" DisplayMode="SingleParagraph" />
        </div>
    </div>
</asp:Content>
