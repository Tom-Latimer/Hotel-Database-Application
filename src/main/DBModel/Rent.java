package main.DBModel;

import javax.persistence.*;

@Entity
@Table(name = "rents")
public class Rent {
    @EmbeddedId
    private RentId id;

    @MapsId("rentId")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "rent_id", nullable = false)
    private Renting rent;

    @MapsId
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumns({
            @JoinColumn(name = "chain_name", referencedColumnName = "chain_name", nullable = false),
            @JoinColumn(name = "hotel_id", referencedColumnName = "hotel_id", nullable = false),
            @JoinColumn(name = "room_id", referencedColumnName = "room_id", nullable = false)
    })
    private Room room;

    public RentId getId() {
        return id;
    }

    public void setId(RentId id) {
        this.id = id;
    }

    public Renting getRent() {
        return rent;
    }

    public void setRent(Renting rent) {
        this.rent = rent;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

}