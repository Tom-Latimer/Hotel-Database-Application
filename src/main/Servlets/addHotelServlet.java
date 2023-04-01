package Servlets;

import DBModel.Hotel;
import DBModel.HotelChain;
import DBModel.HotelId;
import Util.HibernateUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Arrays;

@WebServlet(name = "addHotelServlet", urlPatterns = "/addH")
public class addHotelServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {


            String chainName = request.getParameter("chain_name");
            String hotelName = request.getParameter("name");
            String rating = request.getParameter("rating");
            String streetNumberStr = request.getParameter("street_number");
            String streetName = request.getParameter("street_name");
            String city = request.getParameter("city");
            String province = request.getParameter("province");
            String postalCode = request.getParameter("postal");
            String phoneNumber = request.getParameter("Phone_numbers");
            String emailAddress = request.getParameter("email_addresses");

            BigDecimal streetNumber;
            BigDecimal ratingBD = null;

            String[] provinceCodes = {"AB", "BC", "MB", "NB", "NL", "NS", "NT", "NU", "ON", "PE", "QC", "SK", "YT"};

            // Test and convert input values as required
            if (chainName != null && !chainName.isEmpty() && chainName.length() < 21) {
                chainName = chainName.toLowerCase();
            } else {
                chainName = null;
            }

            if (hotelName != null && !hotelName.isEmpty()) {
                hotelName = hotelName.toLowerCase();
            } else {
                hotelName = null;
            }


            try {
                ratingBD = new BigDecimal(rating);
                if (ratingBD.scale() != 1 || ratingBD.compareTo(BigDecimal.valueOf(1.0)) < 0 || ratingBD.compareTo(BigDecimal.valueOf(5.0)) > 0) {
                    ratingBD = null;
                }
            } catch (NumberFormatException e) {
                ratingBD = null;
            }

            if (streetNumberStr != null && !streetNumberStr.isEmpty()) {
                try {
                    streetNumber = new BigDecimal(streetNumberStr);
                    if (streetNumber.scale() <= 0 && streetNumber.precision() <= 4) {

                    } else {
                        streetNumber = new BigDecimal(0000);
                    }
                } catch (NumberFormatException e) {
                    streetNumber = new BigDecimal(0000);
                }
            } else {
                streetNumber = new BigDecimal(0000);
            }

            if (streetName != null && !streetName.isEmpty()) {
                streetName = streetName.toLowerCase();
            } else {
                streetName = null;
            }

            if (city != null && !city.isEmpty()) {
                city = city.toLowerCase();
            } else {
                city = null;
            }


            if (province != null && !province.isEmpty()) {
                String provinceCode = province.toUpperCase();
                if (Arrays.asList(provinceCodes).contains(provinceCode)) {
                    // the province input is valid
                    province = provinceCode.toLowerCase();
                } else {
                    province = null;
                }
            } else {
                province = null;
                ;
            }

            if (postalCode != null && !postalCode.isEmpty() && postalCode.length() < 7) {
                postalCode = postalCode.toLowerCase();
            } else {
                postalCode = null;
            }

            if (phoneNumber != null && !phoneNumber.isEmpty()) {
                phoneNumber = phoneNumber.toLowerCase();
            } else {
                phoneNumber = null;
            }

            if (emailAddress != null && !emailAddress.isEmpty()) {
                emailAddress = emailAddress.toLowerCase();
            } else {
                emailAddress = null;
            }

            if (chainName == null) {
                // Handle error case where chain name is empty or null
            }

            addUpdateHotel(chainName, hotelName, ratingBD, streetNumber, streetName, city, province, postalCode, phoneNumber, emailAddress);

            request.getRequestDispatcher("/databaseentry.jsp").forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("/index.jsp").forward(request,response);
        }
    }

    private void addUpdateHotel(String chainName, String name,BigDecimal rating, BigDecimal streetNumber, String streetName, String city, String province, String postal, String phoneNumbers, String emailAddresses) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        Hotel hotel = new Hotel();

        HotelChain hc = new HotelChain();

        hc.setId(chainName);



        hotel.setHotelChain(hc);
        hotel.setChainName(chainName);
        hotel.setHotelName(name);
        hotel.setRating(rating);
        hotel.setStreetNumber(streetNumber);
        hotel.setStreetName(streetName);
        hotel.setCity(city);
        hotel.setProvince(province);
        hotel.setPostal(postal);
        hotel.setPhoneNumbers(phoneNumbers);
        hotel.setEmailAddresses(emailAddresses);

        session.beginTransaction();

        session.saveOrUpdate(hotel);
        session.getTransaction().commit();

        session.close();
    }
}
