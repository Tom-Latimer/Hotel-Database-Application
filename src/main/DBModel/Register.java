package main.DBModel;

import javax.persistence.*;

@Entity
@Table(name = "registers")
public class Register {
    @EmbeddedId
    private RegisterId id;

    @MapsId("ssn")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "ssn", nullable = false)
    private Employee ssn;

    @MapsId("bookingId")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "booking_id", nullable = false)
    private Booking booking;

    public RegisterId getId() {
        return id;
    }

    public void setId(RegisterId id) {
        this.id = id;
    }

    public Employee getSsn() {
        return ssn;
    }

    public void setSsn(Employee ssn) {
        this.ssn = ssn;
    }

    public Booking getBooking() {
        return booking;
    }

    public void setBooking(Booking booking) {
        this.booking = booking;
    }

}