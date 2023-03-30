package DBModel;

import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

@Entity
@Table(name = "customer")
public class Customer {

    @Id
    @Column(name = "ssn", nullable = false, precision = 9, scale = 0)
    private BigDecimal ssn;

    @Column(name = "first_name")
    private String first_name;

    @Column(name = "last_name")
    private String last_name;

    @Column(name = "street_number", precision = 4, scale = 0)
    private BigDecimal streetNumber;

    @Column(name = "street_name")
    private String streetName;

    @Column(name = "city")
    private String city;

    @Column(name = "province", length = 3)
    private String province;

    @Column(name = "postal", length = 6)
    private String postal;

    @Column(name = "date_of_registration")
    private Date date_of_registration;

    @OneToMany(mappedBy = "customer", fetch = FetchType.LAZY)
    private List<Pays> rentingsPaid;

}
