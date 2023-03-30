package DBModel;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "booking")
public class Booking {

    @Id
    @Column(name = "booking_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int booking_id;

    @Column(name = "start_date")
    private Date start_date;

    @Column(name="end_date")
    private Date end_date;

    @OneToOne(mappedBy = "booking", fetch = FetchType.LAZY)
    private Registers employeeThatApproved;

    @OneToOne(mappedBy = "booking", fetch = FetchType.LAZY)
    private Reserves customerThatBooked;

    @OneToOne(mappedBy = "booking", fetch = FetchType.LAZY)
    private Books roomThatIsReserved;
}
