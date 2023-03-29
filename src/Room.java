import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "room")
public class Room {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "room_id")
    private int roomId;

    @Column(name = "price", precision = 7, scale = 2)
    private BigDecimal hotelName;

    @Column(name = "capacity")
    private int capacity;

    @Column(name = "view_type")
    private boolean viewType;

    @Column(name = "available")
    private boolean available;

    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumns({
            @JoinColumn(name = "chain_name", referencedColumnName = "chain_name"),
            @JoinColumn(name = "hotel_id", referencedColumnName = "hotel_id"),
    })
    private Hotel hotel;


// constructor, getters, setters, etc.

}