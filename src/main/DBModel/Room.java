package DBModel;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

@Entity
@Table(name = "room")
public class Room {

    @EmbeddedId
    private RoomId room_id;

    @Column(name = "price", precision = 7, scale = 2)
    private BigDecimal hotelName;

    @Column(name = "capacity")
    private int capacity;

    @Column(name = "view_type")
    private boolean viewType;

    @Column(name = "available")
    private boolean available;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumns({
            @JoinColumn(name = "chain_name", referencedColumnName = "chain_name"),
            @JoinColumn(name = "hotel_id", referencedColumnName = "hotel_id")
    })
    private Hotel hotel;

    @OneToMany(mappedBy = "room", fetch = FetchType.LAZY)
    private List<Rents> rentingsList;

    @OneToMany(mappedBy = "room", fetch = FetchType.LAZY)
    private List<Books> reservations;


// constructor, getters, setters, etc.
    public Room(RoomId room_id, BigDecimal hotelName, int capacity, boolean viewType, boolean available, Hotel hotel) {
        this.room_id = room_id;
        this.hotelName = hotelName;
        this.capacity = capacity;
        this.viewType = viewType;
        this.available = available;
        this.hotel = hotel;
    }

    public RoomId getRoom_id() {
        return room_id;
    }

    public void setRoom_id(RoomId room_id) {
        this.room_id = room_id;
    }

    public BigDecimal getHotelName() {
        return hotelName;
    }

    public void setHotelName(BigDecimal hotelName) {
        this.hotelName = hotelName;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public boolean isViewType() {
        return viewType;
    }

    public void setViewType(boolean viewType) {
        this.viewType = viewType;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    public Hotel getHotel() {
        return hotel;
    }

    public void setHotel(Hotel hotel) {
        this.hotel = hotel;
    }
}