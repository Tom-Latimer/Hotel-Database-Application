package main.Servlets;

import main.DBModel.Hotel;
import main.DBModel.Room;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import main.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import javax.persistence.criteria.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet (name = "QueryFormServlet", urlPatterns = "/queryServlet")
public class QueryFormServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String locationcity = request.getParameter("locationcity");

        String capacityguests = request.getParameter("capacityguests");

        String checkindate = request.getParameter("checkindate");

        String checkoutdate = request.getParameter("checkoutdate");

        Integer capacity;
        LocalDate inDate;
        LocalDate outDate;

        try {
            if (locationcity.isEmpty()) {
                locationcity = null;
            } else {
                locationcity = locationcity.toLowerCase();
            }
            if (capacityguests.isEmpty()) {
                capacity = 0;
            } else {
                capacity = Integer.parseInt(capacityguests);
            }
            if (checkindate.isEmpty()) {
                inDate = null;
            } else {
                inDate = LocalDate.parse(checkindate);
            }
            if (checkoutdate.isEmpty()) {
                outDate = null;
            } else {
                outDate = LocalDate.parse(checkoutdate);
            }


            List<Room> results = sendQuery(locationcity,capacity,inDate,outDate);

            if (results!= null) {
                for (Room room: results) {
                    System.out.println();
                }
            }


        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private List sendQuery(String location, int capacity, LocalDate inDate, LocalDate outDate) {
        List<Room> results = null;
        try(Session session = HibernateUtil.getSessionFactory().openSession()) {

            session.beginTransaction();

            CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();

            CriteriaQuery<Room> searchQuery = criteriaBuilder.createQuery(Room.class);

            Root<Room> root = searchQuery.from(Room.class);

            Join<Room, Hotel> hotelRooms = root.join("hotel");

            Predicate[] predicates = new Predicate[1];

            if (location != null) {
                predicates[0] = criteriaBuilder.equal(hotelRooms.get("city"), location);
            }

            if (capacity != 0) {
                //predicates[1] = criteriaBuilder.equal(hotelRooms.get("capacity"), capacity);
            }

            if (inDate != null) {
                //predicates[2] = criteriaBuilder.equal(hotelRooms.get())
            }

            if (outDate != null) {

            }

            results = session.createQuery(searchQuery).getResultList();

            session.getTransaction().commit();


        } catch (Exception e) {
            e.printStackTrace();;
        }
        return results;
    }
}
