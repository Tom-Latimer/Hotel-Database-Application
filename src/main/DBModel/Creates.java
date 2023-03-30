package DBModel;

import javax.persistence.*;

@Entity
@Table(name = "Creates")
public class Creates {
    @EmbeddedId
    private CreatesPaysId id;


    @MapsId("ssn")
    @JoinColumn(name = "ssn", referencedColumnName = "ssn")
    @ManyToOne
    private Employee employee;

    @MapsId("rent_id")
    @JoinColumn(name = "rent_id", referencedColumnName = "rent_id")
    @OneToOne
    private Renting renting;

}
