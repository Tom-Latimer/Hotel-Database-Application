package main.DBModel;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "hotel_chain")
public class HotelChain {
    @Id
    @Column(name = "chain_name", nullable = false, length = 20)
    private String id;

    @Column(name = "street_number", precision = 4)
    private BigDecimal streetNumber;

    @Lob
    @Column(name = "street_name")
    private String streetName;

    @Lob
    @Column(name = "city")
    private String city;

    @Column(name = "province", length = 3)
    private String province;

    @Column(name = "postal", length = 6)
    private String postal;

    @Lob
    @Column(name = "phone_numbers")
    private String phoneNumbers;

    @Lob
    @Column(name = "email_addresses")
    private String emailAddresses;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public String getPhoneNumbers() {
        return phoneNumbers;
    }

    public void setPhoneNumbers(String phoneNumbers) {
        this.phoneNumbers = phoneNumbers;
    }

    public String getEmailAddresses() {
        return emailAddresses;
    }

    public void setEmailAddresses(String emailAddresses) {
        this.emailAddresses = emailAddresses;
    }

}