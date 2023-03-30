package DBModel;

import javax.persistence.*;

@Entity
@Table
public class Books {
    @EmbeddedId
    private BooksId id;


    @MapsId("booking_id")
    @JoinColumn(name = "booking_id", referencedColumnName = "booking_id")
    @OneToOne
    private Booking booking;

    @MapsId("room_Id")
    @JoinColumns({
            @JoinColumn(name = "room_id", referencedColumnName = "room_id"),
            @JoinColumn(name = "chain_name", referencedColumnName = "chain_name"),
            @JoinColumn(name = "hotel_id", referencedColumnName = "hotel_id")
    })
    @ManyToOne
    private Room room;

}
