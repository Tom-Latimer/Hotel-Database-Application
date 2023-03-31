package DBModel;

import javax.persistence.*;

@Entity
@Table(name = "creates")
public class Create {
    @EmbeddedId
    private CreateId id;

    @MapsId("ssn")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "ssn", nullable = false)
    private Employee ssn;

    @MapsId("rentId")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "rent_id", nullable = false)
    private Renting rent;

    public CreateId getId() {
        return id;
    }

    public void setId(CreateId id) {
        this.id = id;
    }

    public Employee getSsn() {
        return ssn;
    }

    public void setSsn(Employee ssn) {
        this.ssn = ssn;
    }

    public Renting getRent() {
        return rent;
    }

    public void setRent(Renting rent) {
        this.rent = rent;
    }

}