package DBModel;

import javax.persistence.Embeddable;
import java.io.Serializable;
import java.math.BigDecimal;

@Embeddable
public class CreatesPaysId implements Serializable {
    private BigDecimal ssn;

    private int rent_id;

    public CreatesPaysId(BigDecimal ssn, int rent_id) {
        this.ssn = ssn;
        this.rent_id = rent_id;
    }
}
