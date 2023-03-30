package DBModel;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import java.io.Serializable;

@Embeddable
public class HotelId implements Serializable {
    private String chain_name;

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "hotel_id")
    private int hotel_id;

    public HotelId(String chain_name, int hotel_id) {
        this.chain_name = chain_name;
        this.hotel_id = hotel_id;
    }
}
