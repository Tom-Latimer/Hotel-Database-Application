package DBModel;

import javax.persistence.*;

@Entity
@Table(name = "reserves")
public class Reserves {
    @EmbeddedId
    private ReservesRegistersId id;


    @MapsId("ssn")
    @JoinColumn(name = "ssn", referencedColumnName = "ssn")
    @ManyToOne
    private Customer customer;

    @MapsId("booking_id")
    @JoinColumn(name = "booking_id", referencedColumnName = "booking_id")
    @OneToOne
    private Booking booking;


}
