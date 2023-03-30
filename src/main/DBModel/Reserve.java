package main.DBModel;

import javax.persistence.*;

@Entity
@Table(name = "reserves")
public class Reserve {
    @EmbeddedId
    private ReserveId id;

    @MapsId("ssn")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "ssn", nullable = false)
    private Customer ssn;

    @MapsId("bookingId")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "booking_id", nullable = false)
    private Booking booking;

    public ReserveId getId() {
        return id;
    }

    public void setId(ReserveId id) {
        this.id = id;
    }

    public Customer getSsn() {
        return ssn;
    }

    public void setSsn(Customer ssn) {
        this.ssn = ssn;
    }

    public Booking getBooking() {
        return booking;
    }

    public void setBooking(Booking booking) {
        this.booking = booking;
    }

}