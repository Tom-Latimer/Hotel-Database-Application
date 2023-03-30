package DBModel;

import javax.persistence.*;

@Entity
@Table(name = "pays")
public class Pay {
    @EmbeddedId
    private PayId id;

    @MapsId("ssn")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "ssn", nullable = false)
    private Customer ssn;

    @MapsId("rentId")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "rent_id", nullable = false)
    private Renting rent;

    public PayId getId() {
        return id;
    }

    public void setId(PayId id) {
        this.id = id;
    }

    public Customer getSsn() {
        return ssn;
    }

    public void setSsn(Customer ssn) {
        this.ssn = ssn;
    }

    public Renting getRent() {
        return rent;
    }

    public void setRent(Renting rent) {
        this.rent = rent;
    }

}