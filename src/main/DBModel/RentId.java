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
public class RentId implements Serializable {
    private static final long serialVersionUID = -2235668428930461268L;
    @Column(name = "rent_id", nullable = false)
    private Integer rentId;

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