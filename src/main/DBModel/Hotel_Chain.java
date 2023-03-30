package DBModel;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

@Entity
@Table(name = "hotel_chain")
public class Hotel_Chain {

    @Id
    @Column(name = "chain_name", nullable = false, length = 20)
    private String chainName;

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

    @Column(name = "phone_numbers")
    private String phoneNumbers;

    @Column(name = "email_addresses")
    private String emailAddresses;

    @OneToMany(mappedBy = "hotel_chain",fetch = FetchType.LAZY)
    private List<Hotel> hotelList;

    // Constructor, getters, and setters

    public void Hotel_Chain(String chainName, BigDecimal streetNumber, String streetName, String city, String province, String postal, String phoneNumbers, String emailAddresses) {
        this.chainName = chainName;
        this.streetNumber = streetNumber;
        this.streetName = streetName;
        this.city = city;
        this.province = province;
        this.postal = postal;
        this.phoneNumbers = phoneNumbers;
        this.emailAddresses = emailAddresses;
    }

    public Hotel_Chain(String chainName) {
        this.chainName = chainName;
    }

    public String getChainName() {
        return chainName;
    }

    public void setChainName(String chainName) {
        this.chainName = chainName;
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

    public List<Hotel> getHotelList() {
        return hotelList;
    }

    public void setHotelList(List<Hotel> hotelList) {
        this.hotelList = hotelList;
    }
}
