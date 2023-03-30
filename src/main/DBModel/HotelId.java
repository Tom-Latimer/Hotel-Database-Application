package main.DBModel;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class HotelId implements Serializable {
    private static final long serialVersionUID = -2261425924785713295L;
    @Column(name = "hotel_id", nullable = false)
    private Integer hotelId;

    @Column(name = "chain_name", nullable = false, length = 20)
    private String chainName;

    public Integer getHotelId() {
        return hotelId;
    }

    public void setHotelId(Integer hotelId) {
        this.hotelId = hotelId;
    }

    public String getChainName() {
        return chainName;
    }

    public void setChainName(String chainName) {
        this.chainName = chainName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        HotelId entity = (HotelId) o;
        return Objects.equals(this.chainName, entity.chainName) &&
                Objects.equals(this.hotelId, entity.hotelId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(chainName, hotelId);
    }

}