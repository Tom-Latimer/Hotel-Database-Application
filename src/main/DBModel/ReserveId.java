package main.DBModel;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Objects;

@Embeddable
public class ReserveId implements Serializable {
    private static final long serialVersionUID = -5183398093057397748L;
    @Column(name = "ssn", nullable = false, precision = 9)
    private BigDecimal ssn;

    @Column(name = "booking_id", nullable = false)
    private Integer bookingId;

    public BigDecimal getSsn() {
        return ssn;
    }

    public void setSsn(BigDecimal ssn) {
        this.ssn = ssn;
    }

    public Integer getBookingId() {
        return bookingId;
    }

    public void setBookingId(Integer bookingId) {
        this.bookingId = bookingId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ReserveId entity = (ReserveId) o;
        return Objects.equals(this.bookingId, entity.bookingId) &&
                Objects.equals(this.ssn, entity.ssn);
    }

    @Override
    public int hashCode() {
        return Objects.hash(bookingId, ssn);
    }

}