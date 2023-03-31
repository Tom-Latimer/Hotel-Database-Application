package DBModel;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class RoomId implements Serializable {
    private static final long serialVersionUID = 3577457853417471869L;


    @Column(name = "room_id", nullable = false)
    private Integer roomId;

    @Column(name = "chain_name", nullable = false, length = 20)
    private String chainName;

    @Column(name = "hotel_id", nullable = false)
    private Integer hotelId;

    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        RoomId entity = (RoomId) o;
        return Objects.equals(this.chainName, entity.chainName) &&
                Objects.equals(this.hotelId, entity.hotelId) &&
                Objects.equals(this.roomId, entity.roomId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(chainName, hotelId, roomId);
    }

}