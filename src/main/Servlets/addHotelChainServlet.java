package Servlets;

import DBModel.HotelChain;
import Util.HibernateUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.persistence.EntityManager;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Arrays;

@WebServlet(name = "addHotelChainServlet",urlPatterns = "/addHC")
public class addHotelChainServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            String chainName = request.getParameter("chain_name");
            String streetNumberStr = request.getParameter("street_number");
            String streetName = request.getParameter("street_name");
            String city = request.getParameter("city");
            String province = request.getParameter("province");
            String postalCode = request.getParameter("postal");
            String phoneNumber = request.getParameter("Phone_numbers");
            String emailAddress = request.getParameter("email_addresses");

            BigDecimal streetNumber;

            String[] provinceCodes = {"AB", "BC", "MB", "NB", "NL", "NS", "NT", "NU", "ON", "PE", "QC", "SK", "YT"};

            // Test and convert input values as required
            if (chainName != null && !chainName.isEmpty() && chainName.length() < 21) {
                chainName = chainName.toLowerCase();
            } else {
                chainName = null;
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

            addHotelChain(chainName, streetNumber, streetName, city, province, postalCode, phoneNumber, emailAddress);
            request.getRequestDispatcher("/databaseentry.jsp").forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("/index.jsp").forward(request,response);
        }
    }

    private void addHotelChain(String chainName, BigDecimal streetNumber, String streetName, String city, String province, String postal, String phoneNumbers, String emailAddresses) {
        EntityManager em = HibernateUtil.getSessionFactory().createEntityManager();

        HotelChain hotelChain = new HotelChain();
        hotelChain.setId(chainName);
        hotelChain.setStreetNumber(streetNumber);
        hotelChain.setStreetName(streetName);
        hotelChain.setCity(city);
        hotelChain.setProvince(province);
        hotelChain.setPostal(postal);
        hotelChain.setPhoneNumbers(phoneNumbers);
        hotelChain.setEmailAddresses(emailAddresses);

        em.getTransaction().begin();

        em.persist(hotelChain);
        em.getTransaction().commit();

        em.close();
    }

}
