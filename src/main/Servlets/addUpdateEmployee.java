package Servlets;

import DBModel.Customer;
import DBModel.Employee;
import Util.HibernateUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.Arrays;

@WebServlet(name = "addUpdateEmployee", urlPatterns = "/addE")
public class addUpdateEmployee extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ssn = request.getParameter("ssn");
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String role = request.getParameter("role");
        String streetNumberStr = request.getParameter("street_number");
        String streetName = request.getParameter("street_name");
        String city = request.getParameter("city");
        String province = request.getParameter("province");
        String postalCode = request.getParameter("postal");

        String[] provinceCodes = {"AB", "BC", "MB", "NB", "NL", "NS", "NT", "NU", "ON", "PE", "QC", "SK", "YT"};
        BigDecimal streetNumber;
        BigDecimal ssnBd = null;


        try {
            try {
                ssnBd = new BigDecimal(ssn);

                // Check if the BigDecimal has exactly 9 digits and no decimals
                if (!(ssnBd.precision() == 9 && ssnBd.scale() == 0)) {
                    ssnBd = BigDecimal.ZERO.setScale(9);
                }
            } catch (NumberFormatException e) {

                BigDecimal bd = BigDecimal.ZERO.setScale(9);

            }

            if (firstName.isEmpty()) {
                firstName = null;
            } else {
                firstName = firstName.toLowerCase();
            }

            // check if last name is empty
            if (lastName.isEmpty()) {
                lastName = null;
            } else {
                lastName = lastName.toLowerCase();
            }

            if (role.isEmpty()) {
                role = null;
            } else {
                role = role.toLowerCase();
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
            addEmployee(ssnBd,firstName,lastName,role,streetName,city,province,postalCode,streetNumber);
            request.getRequestDispatcher("/databaseentry.jsp").forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("/index.jsp").forward(request,response);
        }


    }

    private void addEmployee (BigDecimal ssn, String firstName, String lastName, String role, String street, String city, String province, String postal, BigDecimal streetNumber) {
        Employee employee = new Employee();

        employee.setCity(city);
        employee.setId(ssn);
        employee.setPostal(postal);
        employee.setStreetName(street);
        employee.setProvince(province);
        employee.setStreetNumber(streetNumber);
        employee.setFirstName(firstName);
        employee.setLastName(lastName);
        employee.setRole(role);

        Session session = HibernateUtil.getSessionFactory().openSession();

        session.beginTransaction();

        session.saveOrUpdate(employee);
        session.getTransaction().commit();

        session.close();
    }
}
