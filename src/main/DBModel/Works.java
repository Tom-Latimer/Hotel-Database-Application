package DBModel;

import javax.persistence.*;

@Entity
@Table(name = "works")
public class Works {

    @EmbeddedId WorksManagesId id;

    @MapsId("hotel_id")
    @JoinColumns({
            @JoinColumn(name = "hotel_id", referencedColumnName = "hotel_id"),
            @JoinColumn(name = "chain_name", referencedColumnName = "chain_name")
    })
    @ManyToOne
    private Hotel hotel;

    @MapsId("ssn")
    @JoinColumn(name="ssn",referencedColumnName = "ssn")
    @OneToOne
    private Employee employee;

}
