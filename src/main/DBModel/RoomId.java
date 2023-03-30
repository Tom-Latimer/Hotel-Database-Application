package DBModel;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import java.io.Serializable;

@Embeddable
public class RoomId implements Serializable {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "room_id")
    private int roomId;

    private HotelId hotel_id;

    public RoomId(int roomId, HotelId hotel_id) {
        this.roomId = roomId;
        this.hotel_id = hotel_id;
    }
}
