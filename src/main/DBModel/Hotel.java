package DBModel;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

@Entity
@Table(name = "hotel")
public class Hotel {

    @EmbeddedId
    private HotelId hotel_id;

    @Column(name = "hotel_name", length = 20)
    private String hotelName;

    @Column(name = "rating", precision = 2, scale = 1)
    private BigDecimal rating;

    @Column(name = "street_number", precision = 4)
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

    @MapsId("hotel_id")
    @JoinColumn(name = "chain_name", referencedColumnName = "chain_name")
    @ManyToOne
    private Hotel_Chain hotel_chain;

    @OneToMany(mappedBy = "hotel", fetch = FetchType.LAZY)
    private List<Works> employeeList;

    @OneToOne(mappedBy = "hotel", fetch = FetchType.LAZY)
    private Manages manager;

    @OneToMany(mappedBy = "hotel", fetch = FetchType.LAZY)
    private List<Room> roomList;


    // constructor, getters, setters, etc.

    public Hotel(HotelId hotel_id, String hotelName, BigDecimal rating, BigDecimal streetNumber, String streetName, String city, String province, String postal, String phoneNumbers, String emailAddresses) {
        this.hotel_id = hotel_id;
        this.hotelName = hotelName;
        this.rating = rating;
        this.streetNumber = streetNumber;
        this.streetName = streetName;
        this.city = city;
        this.province = province;
        this.postal = postal;
        this.phoneNumbers = phoneNumbers;
        this.emailAddresses = emailAddresses;
    }

    public HotelId getHotel_id() {
        return hotel_id;
    }

    public void setHotel_id(HotelId hotel_id) {
        this.hotel_id = hotel_id;
    }

    public String getHotelName() {
        return hotelName;
    }

    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }

    public BigDecimal getRating() {
        return rating;
    }

    public void setRating(BigDecimal rating) {
        this.rating = rating;
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


    public Hotel_Chain getHotel_chain() {
        return hotel_chain;
    }

    public void setHotel_chain(Hotel_Chain hotel_chain) {
        this.hotel_chain = hotel_chain;
    }
}
