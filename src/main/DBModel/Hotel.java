package DBModel;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@IdClass(HotelId.class)
@Table(name = "hotel")
public class Hotel {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "room_seq")
    @SequenceGenerator(name = "room_seq", sequenceName = "room_seq", initialValue = 1)
    @Column(name = "hotel_id", nullable = false)
    private Integer hotelId;



    @Id
    @Column(name = "chain_name", nullable = false, length = 20)
    private String chainName;

    @MapsId("chainName")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "chain_name", nullable = false)
    private HotelChain hotelChain;

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

    @Column(name = "province", length = 2)
    private String province;

    @Column(name = "postal", length = 6)
    private String postal;


    @Column(name = "phone_numbers")
    private String phoneNumbers;


    @Column(name = "email_addresses")
    private String emailAddresses;

    public Hotel() {
    }

    public void setChainName(String chainName) {
        this.chainName = chainName;
    }

    public HotelChain getHotelChain() {
        return hotelChain;
    }

    public void setHotelChain(HotelChain hotelChain) {
        this.hotelChain = hotelChain;
    }

    public HotelChain getChainName() {
        return hotelChain;
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

    public Integer getHotelId() {
        return hotelId;
    }

    public void setHotelId(Integer hotelId) {
        this.hotelId = hotelId;
    }
}