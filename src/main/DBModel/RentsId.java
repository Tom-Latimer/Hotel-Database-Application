package DBModel;

import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
public class RentsId implements Serializable {
    private int rent_id;

    //private RoomId room_Id;
}
