package DBModel;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "books")
public class Book {
    @EmbeddedId
    private BookId id;

    @MapsId("bookingId")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "booking_id", nullable = false)
    private Booking booking;

    @MapsId
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumns({
            @JoinColumn(name = "chain_name", referencedColumnName = "chain_name", nullable = false),
            @JoinColumn(name = "hotel_id", referencedColumnName = "hotel_id", nullable = false),
            //@JoinColumn(name = "room_id", referencedColumnName = "room_id", nullable = false)
    })
    @PrimaryKeyJoinColumn(name = "room_id", referencedColumnName = "room_id")
    private Room room;

    @Column(name = "room_chain_name", nullable = false)
    private String roomChainName;

    @Column(name = "room_hotel_id", nullable = false)
    private Integer roomHotelId;

}