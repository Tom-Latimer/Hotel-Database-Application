package DBModel;

import javax.persistence.*;

@Entity
@Table(name = "manages")
public class Manages {
    @EmbeddedId
    private WorksManagesId id;

    //found in WokrsManagesId class
    @MapsId("hotel_id")
    @JoinColumns({
            @JoinColumn(name = "chain_name", referencedColumnName = "chain_name"),
            @JoinColumn(name = "hotel_id", referencedColumnName = "hotel_id")
    })
    @OneToOne
    private Hotel hotel;

    @MapsId("ssn")
    @JoinColumn(name="ssn",referencedColumnName = "ssn")
    @OneToOne
    private Employee employee;


}
