import javax.persistence.*;

@Entity
@Table(name = "amenity")
public class Amenity {

    @Id
    @Column(name = "amen_type", length = 20)
    private String amenType;

    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumns({
            @JoinColumn(name = "chain_name", referencedColumnName = "chain_name"),
            @JoinColumn(name = "hotel_id", referencedColumnName = "hotel_id"),
            @JoinColumn(name = "room_id", referencedColumnName = "room_id")
    })
    private Room room;

    // getters and setters
}
