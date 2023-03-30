package DBModel;

import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Date;

@Entity
@Table(name = "renting")
public class Renting {

    @Id
    @Column(name = "renting_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int renting_id;

    @Column(name = "start_date")
    private Date start_date;

    @Column(name="end_date")
    private Date end_date;

    @Column(name = "cost", precision = 7, scale = 2)
    private BigDecimal ssn;

    @OneToOne(mappedBy = "renting", fetch = FetchType.LAZY)
    private Creates employeeThatCreated;

    @OneToOne(mappedBy = "renting", fetch = FetchType.LAZY)
    private Pays customerThatPayed;

    @OneToOne(mappedBy = "renting", fetch = FetchType.LAZY)
    private Rents rentingFor;
}
