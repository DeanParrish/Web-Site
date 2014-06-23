<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true"
    CodeFile="CountDays.aspx.cs" Inherits="CountDays" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Dean Parrish - Day Counter</title>
    <link rel="stylesheet" type="text/css" href="Styles/WebApp.css" />
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
                    <asp:RadioButtonList runat="server" ID="rdoAppConfig" AutoPostBack="True">
                        <asp:ListItem Selected="True" Text="End of Year" Value="EndYear"></asp:ListItem>
                        <asp:ListItem Text="Specified Date" Value="SpecifiedDate"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <div class="line">
                    Enter start day:
                    <asp:TextBox runat="server" ID="txtStartDate" placeholder="mm/dd/yyyy" ValidationGroup="AppConfig"
                        CssClass="roundelement"></asp:TextBox><asp:Calendar ID="calStartDate" runat="server">
                    </asp:Calendar>
                    <asp:RequiredFieldValidator runat="server" ErrorMessage="Start Date is Required"
                        Text="*" CssClass="error" ControlToValidate="txtStartDate"></asp:RequiredFieldValidator>
                    <asp:CompareValidator runat="server" ErrorMessage="This field must be a valid date"
                        Text="*" CssClass="error" Operator="DataTypeCheck" Type="Date" ControlToValidate="txtStartDate"></asp:CompareValidator>
                </div>
                <div class="line">
                    Enter end day(only needed if checked above):
                    <asp:TextBox runat="server" ID="txtEndDate" placeholder="mm/dd/yyyy" ValidationGroup="AppConfig"
                        CssClass="roundelement"></asp:TextBox>
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
