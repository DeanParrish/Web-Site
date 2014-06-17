using System;

public class Reservation
{
    public Reservation() { }

    public DateTime ArrivalDate { get; set; }
    public DateTime DepartureDate { get; set; }
    public int NoOfAdults { get; set; }
    public int NoOfChildren { get; set; }
    public string RoomType { get; set; }
    public string BedType { get; set; }
    public bool Smoking { get; set; }
    public string SpecialRequests { get; set; }
    public string Name { get; set; }
    public string Email { get; set; }
}
