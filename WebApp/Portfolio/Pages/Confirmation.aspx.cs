using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Confirmation : System.Web.UI.Page
{
    private Reservation reservation;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            reservation = (Reservation)Session["Reservation"];
            if (reservation == null)
            {
                Response.Redirect("Request.aspx");
            }
            
            this.DisplayReservation();
        }
        
    }

    private void DisplayReservation()
    {
        lblArrivalDate.Text = reservation.ArrivalDate.ToShortDateString();
        lblDepartureDate.Text = reservation.DepartureDate.ToShortDateString();
        lblNoOfAdults.Text = reservation.NoOfAdults.ToString();
        lblNoOfChildren.Text = reservation.NoOfChildren.ToString();
        lblRoomType.Text = reservation.RoomType;
        lblBedType.Text = reservation.BedType;

        if (reservation.Smoking)
            lblSmoking.Text = "Yes";
        else
            lblSmoking.Text = "No";

        if (reservation.SpecialRequests == "")
            lblSpecialRequests.Text = "None";
        else
            lblSpecialRequests.Text = reservation.SpecialRequests;

        lblName.Text = reservation.Name;
        lblEmail.Text = reservation.Email;
    }

    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        reservation = (Reservation)Session["Reservation"];
        Session.Remove("Reservation");
        lblMessage.Text = "Thank you for your request.<br />" +
                          "We will get back to you within 24 hours.<br/>" + 
                          "An E-Mail has been sent to " + reservation.Email.ToString();

        HttpCookie nameCookie = new HttpCookie("UserName", lblName.Text);
        nameCookie.Expires = DateTime.Now.AddMonths(6);
        Response.Cookies.Add(nameCookie);

        HttpCookie emailCookie = new HttpCookie("Email", lblEmail.Text);
        emailCookie.Expires = DateTime.Now.AddMonths(6);
        Response.Cookies.Add(emailCookie);
	/*
        SmtpClient SMTP = new SmtpClient();
        MailMessage mail = new MailMessage();

        mail.To.Add(reservation.Email);
        mail.From = new MailAddress("parrish.de@gmail.com", "Dean Parrish");
        mail.IsBodyHtml = true;
        mail.Subject = "Your reservation details at Royal Inn and Suites";
        mail.Body = "Your reservation has been set " + reservation.Name +
                ". Please specifications below:<br/>" +
                "Arrival Date: " + reservation.ArrivalDate + "<br/>" +
                "Number of Nights: " + reservation.DepartureDate.Subtract(reservation.ArrivalDate) + "<br/>" +
                "Number of Adults: " + reservation.NoOfAdults + "<br/>" +
                "Number of Children: " + reservation.NoOfChildren + "<br/>" +
                "Room Type: " + reservation.RoomType + "<br/>" +
                "Bed Type: " + reservation.BedType + "<br/>" +
                "Smoking: " + reservation.Smoking + "<br/>" +
                "Special Requests: " + reservation.SpecialRequests + "<br/>";

        SMTP.Credentials = new System.Net.NetworkCredential("", "");
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
*/

    }
}