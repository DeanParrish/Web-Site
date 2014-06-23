<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true"
    CodeFile="CountDays.aspx.cs" Inherits="CountDays" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Dean Parrish - Day Counter</title>
    <link rel="stylesheet" type="text/css" href="Styles/WebApp.css" />
    <link type="text/css" rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
    <script type="text/javascript" src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js"></script>
    <script type="text/javascript" src="Scripts/ProjectPage.js"></script>
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
                    <asp:CompareValidator runat="server" ErrorMessage="This field must be a valid date/format (mm/dd/yyyy)"
                        Text="*" CssClass="error" Operator="DataTypeCheck" Type="Date" ControlToValidate="txtStartDate"></asp:CompareValidator>
                </div>
                <div class="line">
                    Enter end day(only needed if checked above):
                    <asp:TextBox runat="server" ID="txtEndDate" placeholder="mm/dd/yyyy" ValidationGroup="AppConfig"
                        CssClass="roundelement"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="validReq_txtEndDate" CssClass="error" Display="Dynamic" ControlToValidate="txtEndDate" Enabled="False" ErrorMessage="End Date is Required" Text="*"></asp:RequiredFieldValidator>
                    <asp:CompareValidator runat="server" CssClass="error" Display="Dynamic" ControlToValidate ="txtEndDate" Operator="DataTypeCheck" Type="Date" Text="*" ErrorMessage="This field must be a valid date/format (mm/dd/yyyy)" ID="validTypeCheck_txtEndDate"></asp:CompareValidator>
                    <asp:CompareValidator runat="server" CssClass="error" Display="Dynamic" ControlToValidate="txtEndDate" ControlToCompare="txtStartDate" Operator="GreaterThanEqual" ErrorMessage="This field must be later than the start date." Text="*" ID="validCompare_txtEndDate"></asp:CompareValidator>
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
        <!--**CODE SNIPPET**-->
        <a href="#CCSnippet" class="showCode"><i title="Show Code" class="fa fa-plus"></i>Show Code</a>
        <div class="codeSnippet" id="CCSnippet">
            <div class="snippetDesc">
                This application is extremely simple. There are two main parts: button click to do the actual calculation and check changed 
                    event to turn certain validations on and off. The button click event initiates three variables, two of which are DateTime 
                    and one TimeSpan. Next, I checked to make sure all of the validators "checked out" and then went into my calculations 
                    depending on which radio button was selected. The result of the calculation is shown in a label below the application. 
                    Button click event:
            </div>
            <pre class="prettyprint">
protected void btnSubmit_Click(object sender, EventArgs e)
    {
        TimeSpan result;
        DateTime start;
        DateTime end;
        lblResult.Text = "";
        if (Page.IsValid)
        {
            if (rdoAppConfig.SelectedValue == "EndYear")
            {
                DateTime.TryParse(txtStartDate.Text, out start);
                end = new DateTime(start.Year, 12, 31);

                result = end.Subtract(start);

                if (result.TotalDays > 1)
                {
                    lblResult.Text = "There are " + result.Days.ToString() + " days between " + start.ToShortDateString() +
                    " and " + end.ToShortDateString();
                }
                else if (result.TotalDays == 1)
                {
                    lblResult.Text = "There is " + result.Days.ToString() + " day between " + start.ToShortDateString() +
                    " and " + end.ToShortDateString();
                }
                else if (result.TotalDays == 0)
                {
                    lblResult.Text = "That is today!";
                }
                else
                {
                    lblResult.Text = "There was an error in your request. Please try again later.";
                }
                
              
            }
            else if (rdoAppConfig.SelectedValue == "SpecifiedDate")
            {
                DateTime.TryParse(txtStartDate.Text, out start);
                DateTime.TryParse(txtEndDate.Text, out end);

                result = end.Subtract(start);

                if (result.TotalDays > 1)
                {
                    lblResult.Text = "There are " + result.Days.ToString() + " days between " + start.ToShortDateString() +
                    " and " + end.ToShortDateString();
                }
                else if (result.TotalDays == 1)
                {
                    lblResult.Text = "There is " + result.Days.ToString() + " day between " + start.ToShortDateString() +
                    " and " + end.ToShortDateString();
                }
                else if (result.TotalDays == 0)
                {
                    lblResult.Text = "That is today!";
                }
                else
                {
                    lblResult.Text = "There was an error in your request. Please try again later.";
                }
            }

            
    }
            </pre>
            <div class="snippetDesc">
                    The check changed event of the radio buttons simply turn validators of the ending date on and off, depending on which 
                    option is selected.
            </div>
            <pre class="prettyprint">
protected void rdoAppConfig_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rdoAppConfig.SelectedValue == "EndYear")
        {
            validReq_txtEndDate.Enabled = false;
            validCompare_txtEndDate.Enabled = false;
            validTypeCheck_txtEndDate.Enabled = false;
        }
        else if (rdoAppConfig.SelectedValue == "SpecifiedDate")
        {
            validReq_txtEndDate.Enabled = true;
            validCompare_txtEndDate.Enabled = true;
            validTypeCheck_txtEndDate.Enabled = true;
        }
    }
            </pre>
        </div>
    </div>
</asp:Content>
