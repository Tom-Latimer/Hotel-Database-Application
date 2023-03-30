package DBModel;

import javax.persistence.*;

@Entity
@Table(name = "problem")
public class Problem {
    @EmbeddedId
    private ProblemId id;

    @MapsId
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumns({
            @JoinColumn(name = "chain_name", referencedColumnName = "chain_name", nullable = false),
            @JoinColumn(name = "hotel_id", referencedColumnName = "hotel_id", nullable = false),
            @JoinColumn(name = "room_id", referencedColumnName = "room_id", nullable = false)
    })
    private Room room;

    public ProblemId getId() {
        return id;
    }

    public void setId(ProblemId id) {
        this.id = id;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

}