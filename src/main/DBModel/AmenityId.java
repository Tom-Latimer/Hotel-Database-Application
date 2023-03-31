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
public class AmenityId implements Serializable {
    private static final long serialVersionUID = -7494021977207725228L;
    @Column(name = "amen_type", nullable = false, length = 20)
    private String amenType;

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
        AmenityId entity = (AmenityId) o;
        return Objects.equals(this.chainName, entity.chainName) &&
                Objects.equals(this.amenType, entity.amenType) &&
                Objects.equals(this.hotelId, entity.hotelId) &&
                Objects.equals(this.roomId, entity.roomId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(chainName, amenType, hotelId, roomId);
    }

}