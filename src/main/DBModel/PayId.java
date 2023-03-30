package main.DBModel;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Objects;

@Embeddable
public class PayId implements Serializable {
    private static final long serialVersionUID = 7553490505464117837L;
    @Column(name = "ssn", nullable = false, precision = 9)
    private BigDecimal ssn;

    @Column(name = "rent_id", nullable = false)
    private Integer rentId;

    public BigDecimal getSsn() {
        return ssn;
    }

    public void setSsn(BigDecimal ssn) {
        this.ssn = ssn;
    }

    public Integer getRentId() {
        return rentId;
    }

    public void setRentId(Integer rentId) {
        this.rentId = rentId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        PayId entity = (PayId) o;
        return Objects.equals(this.ssn, entity.ssn) &&
                Objects.equals(this.rentId, entity.rentId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(ssn, rentId);
    }

}