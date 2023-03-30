package DBModel;

import javax.persistence.*;

@Entity
@Table(name = "registers")
public class Registers {
    @EmbeddedId
    private ReservesRegistersId id;


    @MapsId("ssn")
    @JoinColumn(name = "ssn", referencedColumnName = "ssn")
    @ManyToOne
    private Employee employee;


    @MapsId("booking_id")
    @JoinColumn(name = "booking_id", referencedColumnName = "booking_id")
    @OneToOne
    private Booking booking;

}
