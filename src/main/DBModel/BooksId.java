package DBModel;

import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
public class BooksId implements Serializable {
    private int booking_id;

    //private RoomId room_id;
}
