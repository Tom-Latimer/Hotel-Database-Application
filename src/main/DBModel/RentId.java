package DBModel;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class RentId implements Serializable {
    private static final long serialVersionUID = -5715910406673952683L;
    @Column(name = "rent_id", nullable = false)
    private Integer rentId;

    @Column(name = "chain_name", nullable = false, length = 20)
    private String chainName;

    @Column(name = "hotel_id", nullable = false)
    private Integer hotelId;

    @Column(name = "room_id", nullable = false)
    private Integer roomId;

    public Integer getRentId() {
        return rentId;
    }

    public void setRentId(Integer rentId) {
        this.rentId = rentId;
    }

    public String getChainName() {
        return chainName;
    }

    public void setChainName(String chainName) {
        this.chainName = chainName;
    }

    public Integer getHotelId() {
        return hotelId;
    }

    public void setHotelId(Integer hotelId) {
        this.hotelId = hotelId;
    }

    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        RentId entity = (RentId) o;
        return Objects.equals(this.chainName, entity.chainName) &&
                Objects.equals(this.hotelId, entity.hotelId) &&
                Objects.equals(this.roomId, entity.roomId) &&
                Objects.equals(this.rentId, entity.rentId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(chainName, hotelId, roomId, rentId);
    }

}