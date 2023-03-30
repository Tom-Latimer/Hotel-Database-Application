package main.DBModel;

import javax.persistence.*;

@Entity
@Table(name = "manages")
public class Manage {
    @EmbeddedId
    private ManageId id;

    @MapsId("ssn")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "ssn", nullable = false)
    private Employee ssn;

    @MapsId
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumns({
            @JoinColumn(name = "chain_name", referencedColumnName = "chain_name", nullable = false),
            @JoinColumn(name = "hotel_id", referencedColumnName = "hotel_id", nullable = false)
    })
    private Hotel hotel;

    public ManageId getId() {
        return id;
    }

    public void setId(ManageId id) {
        this.id = id;
    }

    public Employee getSsn() {
        return ssn;
    }

    public void setSsn(Employee ssn) {
        this.ssn = ssn;
    }

    public Hotel getHotel() {
        return hotel;
    }

    public void setHotel(Hotel hotel) {
        this.hotel = hotel;
    }

}