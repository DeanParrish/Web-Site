using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Request : System.Web.UI.Page
{
    private Reservation reservation = new Reservation();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlAdults.Items.Add("1");
            ddlAdults.Items.Add("2");
            ddlAdults.Items.Add("3");
            ddlAdults.Items.Add("4");

            ddlChildren.Items.Add("0");
            ddlChildren.Items.Add("1");
            ddlChildren.Items.Add("2");
            ddlChildren.Items.Add("3");
            ddlChildren.Items.Add("4");

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

    protected void ibtnCalendar_Click(object sender, ImageClickEventArgs e)
    {
        ibtnCalendar.Visible = false;
        clnArrival.Visible = true;
    }

    protected void clnArrival_SelectionChanged(object sender, EventArgs e)
    {
        txtArrivalDate.Text = clnArrival.SelectedDate.Month.ToString() + "/" +
                              clnArrival.SelectedDate.Day.ToString() + "/" +
                              clnArrival.SelectedDate.Year.ToString();
        clnArrival.Visible = false;
        ibtnCalendar.Visible = true;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        reservation.ArrivalDate = Convert.ToDateTime(txtArrivalDate.Text);
        reservation.DepartureDate = reservation.ArrivalDate.AddDays(Convert.ToInt32(txtNights.Text));
        reservation.NoOfAdults = Convert.ToInt32(ddlAdults.SelectedValue);
        reservation.NoOfChildren = Convert.ToInt32(ddlChildren.SelectedValue);

        if (rdoBusiness.Checked)
            reservation.RoomType = "Business";
        else if (rdoSuite.Checked)
            reservation.RoomType = "Suite";
        else
            reservation.RoomType = "Standard";

        if (rdoKing.Checked)
            reservation.BedType = "King";
        else
            reservation.BedType = "Double Double";

        reservation.Smoking = chkSmoking.Checked;
        reservation.SpecialRequests = txtSpecialRequests.Text;
        reservation.Name = txtName.Text;
        reservation.Email = txtEmail.Text;

        Session["Reservation"] = reservation;
        Response.Redirect("Confirmation.aspx");
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtArrivalDate.Text = "mm/dd/yyyy";
        txtNights.Text = "";
        ddlAdults.SelectedIndex = -1;
        ddlChildren.SelectedIndex = -1;
        rdoStandard.Checked = true;
        rdoKing.Checked = true;
        chkSmoking.Checked = false;
        txtSpecialRequests.Text = "";
        txtName.Text = "";
        txtEmail.Text = "";
    }
}