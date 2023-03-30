package DBModel;

import javax.persistence.*;

@Entity
@Table(name = "pays")
public class Pays {
    @EmbeddedId
    private CreatesPaysId id;


    @MapsId("ssn")
    @JoinColumn(name = "ssn", referencedColumnName = "ssn")
    @ManyToOne
    private Customer customer;

    @MapsId("rent_id")
    @JoinColumn(name = "rent_id", referencedColumnName = "rent_id")
    @OneToOne
    private Renting renting;


}
