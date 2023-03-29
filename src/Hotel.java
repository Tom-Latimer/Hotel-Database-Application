import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "hotel")
public class Hotel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "hotel_id")
    private int hotelId;

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

    @Id
    @ManyToOne
    @JoinColumn(name = "chain_name")
    private Hotel_Chain hotelChain;

    // constructor, getters, setters, etc.

    public Hotel(int hotelId, String hotelName, BigDecimal rating, BigDecimal streetNumber, String streetName, String city, String province, String postal, String phoneNumbers, String emailAddresses, Hotel_Chain hotelChain) {
        this.hotelId = hotelId;
        this.hotelName = hotelName;
        this.rating = rating;
        this.streetNumber = streetNumber;
        this.streetName = streetName;
        this.city = city;
        this.province = province;
        this.postal = postal;
        this.phoneNumbers = phoneNumbers;
        this.emailAddresses = emailAddresses;
        this.hotelChain = hotelChain;
    }

    public int getHotelId() {
        return hotelId;
    }

    public void setHotelId(int hotelId) {
        this.hotelId = hotelId;
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

    public Hotel_Chain getHotelChain() {
        return hotelChain;
    }

    public void setHotelChain(Hotel_Chain hotel_chain) {
        this.hotelChain = hotelChain;
    }
}
