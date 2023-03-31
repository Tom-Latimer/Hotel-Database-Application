package DBModel;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.Hibernate;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

@Getter
@Setter
@Embeddable
public class BookId implements Serializable {
    private static final long serialVersionUID = 656672791251423841L;
    @Column(name = "booking_id", nullable = false)
    private Integer bookingId;

    @Column(name = "chain_name", nullable = false, length = 20)
    private String chainName;

    @Column(name = "hotel_id", nullable = false)
    private Integer hotelId;

    @Column(name = "room_id", nullable = false)
    private Integer roomId;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        BookId entity = (BookId) o;
        return Objects.equals(this.chainName, entity.chainName) &&
                Objects.equals(this.hotelId, entity.hotelId) &&
                Objects.equals(this.bookingId, entity.bookingId) &&
                Objects.equals(this.roomId, entity.roomId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(chainName, hotelId, bookingId, roomId);
    }

}