package DBModel;

import javax.persistence.Embeddable;
import java.io.Serializable;
import java.math.BigDecimal;

@Embeddable
public class ReservesRegistersId implements Serializable {
    private BigDecimal ssn;
    private int booking_id;

    public ReservesRegistersId(BigDecimal ssn, int booking_id) {
        this.ssn = ssn;
        this.booking_id = booking_id;
    }
}
