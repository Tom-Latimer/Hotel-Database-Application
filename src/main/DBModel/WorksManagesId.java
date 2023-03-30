package DBModel;

import javax.persistence.Embeddable;
import java.io.Serializable;
import java.math.BigDecimal;

@Embeddable
public class WorksManagesId implements Serializable {
    private BigDecimal ssn;

    private HotelId hotel_id;

    public WorksManagesId(BigDecimal ssn) {
        this.ssn = ssn;
    }
}
