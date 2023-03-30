package DBModel;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "room")
public class Room {
    @EmbeddedId
    private RoomId id;

    @MapsId
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumns({
            @JoinColumn(name = "hotel_id", referencedColumnName = "hotel_id", nullable = false),
            @JoinColumn(name = "chain_name", referencedColumnName = "chain_name", nullable = false)
    })
    private Hotel hotel;

    @Column(name = "price", precision = 7, scale = 2)
    private BigDecimal price;

    @Column(name = "capacity")
    private Integer capacity;

    @Column(name = "view_type")
    private Boolean viewType;

    @Column(name = "available")
    private Boolean available;

    public RoomId getId() {
        return id;
    }

    public void setId(RoomId id) {
        this.id = id;
    }

    public Hotel getHotel() {
        return hotel;
    }

    public void setHotel(Hotel hotel) {
        this.hotel = hotel;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getCapacity() {
        return capacity;
    }

    public void setCapacity(Integer capacity) {
        this.capacity = capacity;
    }

    public Boolean getViewType() {
        return viewType;
    }

    public void setViewType(Boolean viewType) {
        this.viewType = viewType;
    }

    public Boolean getAvailable() {
        return available;
    }

    public void setAvailable(Boolean available) {
        this.available = available;
    }

}