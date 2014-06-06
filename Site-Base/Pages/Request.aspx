<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Request.aspx.cs" Inherits="Request" MasterPageFile="../Template.master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Chapter 9: Reservations</title>
    <link rel="stylesheet" type="text/css" href="../Styles/WebApp.css" />
    <link rel="stylesheet" type="text/css" href="../Styles/Reservation.css" />
    <script type="text/javascript" src="../Scripts/jQuery_1.11.1.js"></script>
    <script type="text/javascript" src="../Scripts/ProjectPage.js"></script>
    <script type="text/javascript" src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js"></script>
</asp:Content>

<asp:Content ID="contentmain" ContentPlaceHolderID="maincontent" runat="server">
    <h1>Royal Inn and Suites</h1>
    <h2>Where you&rsquo;re always treated like royalty</h2>
    <p id="arrival_date">
        Arrival date:&nbsp;
            <asp:TextBox ID="txtArrivalDate" runat="server" Width="75px">mm/dd/yyyy</asp:TextBox>&nbsp;
            <asp:ImageButton ID="ibtnCalendar" runat="server"
                ImageUrl="~/Images/Calendar.bmp" ImageAlign="Top"
                CausesValidation="False" OnClick="ibtnCalendar_Click" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
            ErrorMessage="Arrival date is required." Display="Dynamic"
            ControlToValidate="txtArrivalDate" CssClass="error"
            InitialValue="mm/dd/yyyy">*</asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server"
            ControlToValidate="txtArrivalDate" CssClass="error" Display="Dynamic"
            ErrorMessage="You must enter a valid date." Operator="DataTypeCheck"
            Type="Date">*</asp:CompareValidator>
        <asp:RangeValidator ID="rvArrival" runat="server"
            ControlToValidate="txtArrivalDate" CssClass="error" Display="Dynamic"
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
            ControlToValidate="txtNights" CssClass="error" Display="Dynamic"
            ErrorMessage="Number of nights is required.">*</asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator2" runat="server"
            ControlToValidate="txtNights" CssClass="error" Display="Dynamic"
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
            ControlToValidate="txtName" CssClass="error" Display="Dynamic"
            ErrorMessage="Name is required.">*</asp:RequiredFieldValidator>
    </p>
    <p class="contact">Email:</p>
    <p>
        <asp:TextBox ID="txtEmail" runat="server" Width="320px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
            ControlToValidate="txtEmail" CssClass="error" Display="Dynamic"
            ErrorMessage="Email is required.">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
            ErrorMessage="Email format is invalid." ControlToValidate="txtEmail"
            CssClass="error" Display="Dynamic"
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
    </p>
    <p id="buttons">
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" Width="80px"
            OnClick="btnSubmit_Click" />&nbsp;
            <asp:Button ID="btnClear" runat="server" Text="Clear" Width="80px"
                CausesValidation="False" OnClick="btnClear_Click" />
    </p>
    <p id="validation">
        &nbsp;<asp:ValidationSummary ID="ValidationSummary" runat="server"
            CssClass="error" HeaderText="Please correct the following errors:" />
    </p>
    <!--Code snippet and button -->
    <a href="#CCSnippet" class="showCode"><i title="Show Code" class="fa fa-plus"></i>Show
            Code</a>
    <div class="codeSnippet" id="CCSnippet">
        <div class="snippetDesc">
            When the page is loaded, the codebehind populates the drop down lists, sets the minimum and maximum 
            values for the arrival date, and looks for a session variable with the name "Reservation", which has
            previous information stored in another class. If the "Reservation" session is found, the form is
            loaded with the previous information. If the session is not found, cookies with the name "UserName"
            and "Email" is searched for. The cookies store previous username and email values of the form. If they
            are not found, an empty form is displayed.
        </div>
        <pre class="prettyprint">
protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            for (int i = 1; i <= 4; i++)
            {
                ddlAdults.Items.Add(i.ToString());
            }

            for (int i = 0; i <= 4; i++)
            {
                ddlChildren.Items.Add(i.ToString());
            }

            rvArrival.MinimumValue = DateTime.Today.ToShortDateString();
            rvArrival.MaximumValue = DateTime.Today.AddMonths(6).ToShortDateString();

            if (Session["Reservation"] != null)
            {
                reservation = (Reservation) Session["Reservation"];
                this.DisplayReservation();
            }
            else if (Request.Cookies["UserName"] != null)
            {
                txtName.Text = Request.Cookies["UserName"].Value;
                txtEmail.Text = Request.Cookies["Email"].Value;
                rdoStandard.Checked = true;
                rdoKing.Checked = true;
            }
            else
            {
                rdoStandard.Checked = true;
                rdoKing.Checked = true;
            }
        }
    }
        </pre>
        <div class="snippetDesc">
            In the previous example, the method <span class="link">DisplayReservation()</span> is called. This 
            method accesses the information, if found, from the "Reservation" session, which is stored in the
            Reservation class as shown in the example above.
        </div>
        <pre class="prettyprint">
private void DisplayReservation()
    {
        txtArrivalDate.Text = reservation.ArrivalDate.ToShortDateString();
        TimeSpan length = reservation.DepartureDate - reservation.ArrivalDate;
        txtNights.Text = length.Days.ToString();
        ddlAdults.SelectedValue = reservation.NoOfAdults.ToString();
        ddlChildren.SelectedValue = reservation.NoOfChildren.ToString();

        if (reservation.RoomType == "Business")
            rdoBusiness.Checked = true;
        else if (reservation.RoomType == "Suite")
            rdoSuite.Checked = true;
        else
            rdoStandard.Checked = true;

        if (reservation.BedType == "King")
            rdoKing.Checked = true;
        else
            rdoDouble.Checked = true;

        chkSmoking.Checked = reservation.Smoking;
        txtSpecialRequests.Text = reservation.SpecialRequests;
        txtName.Text = reservation.Name;
        txtEmail.Text = reservation.Email;
    }
        </pre>
        <div class="snippetDesc">
            When the user clicks the calendar image button, the calendar is displayed. This is the click event for that button.
        </div>
        <pre class="prettyprint">
protected void ibtnCalendar_Click(object sender, ImageClickEventArgs e)
    {
        ibtnCalendar.Visible = false;
        clnArrival.Visible = true;
    }
       </pre>
        <div class="snippetDesc">
        </div>

    </div>
</asp:Content>


