package DBModel;

import javax.persistence.*;

@Entity
@Table
public class Rents {
    @EmbeddedId
    private RentsId id;


    @MapsId("rent_id")
    @JoinColumn(name = "rent_id", referencedColumnName = "rent_id")
    @OneToOne
    private Renting renting;

    @MapsId("room_Id")
    @JoinColumns({
            @JoinColumn(name = "room_id", referencedColumnName = "room_id"),
            @JoinColumn(name = "chain_name", referencedColumnName = "chain_name"),
            @JoinColumn(name = "hotel_id", referencedColumnName = "hotel_id")
    })
    @ManyToOne
    private Room room;

}
