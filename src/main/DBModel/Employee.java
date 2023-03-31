package DBModel;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "employee")
public class Employee {
    @Id
    @Column(name = "ssn", nullable = false, precision = 9)
    private BigDecimal id;

    @Lob
    @Column(name = "first_name")
    private String firstName;

    @Lob
    @Column(name = "last_name")
    private String lastName;

    @Column(name = "street_number", precision = 4)
    private BigDecimal streetNumber;

    @Lob
    @Column(name = "street_name")
    private String streetName;

    @Lob
    @Column(name = "city")
    private String city;

    @Column(name = "province", length = 2)
    private String province;

    @Column(name = "postal", length = 6)
    private String postal;

    @Lob
    @Column(name = "role")
    private String role;

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public BigDecimal getStreetNumber() {
        return streetNumber;
    }

    public void setStreetNumber(BigDecimal streetNumber) {
        this.streetNumber = streetNumber;
    }

    public String getStreetName() {
        return streetName;
    }

    public void setStreetName(String streetName) {
        this.streetName = streetName;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getPostal() {
        return postal;
    }

    public void setPostal(String postal) {
        this.postal = postal;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

}