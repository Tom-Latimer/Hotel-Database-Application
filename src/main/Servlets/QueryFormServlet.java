package Servlets;

import DBModel.Hotel;
import DBModel.Hotel_;
import DBModel.Room;
import DBModel.Room_;
import Util.HibernateUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import javax.persistence.EntityManager;
import javax.persistence.criteria.*;
import javax.persistence.metamodel.EntityType;
import javax.persistence.metamodel.Metamodel;
import java.io.IOException;
import java.io.PrintWriter;
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

            System.out.println("Here is the results:" + results);

            request.getRequestDispatcher("/customerhome.jsp").forward(request,response);

        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("/index.jsp").forward(request,response);
        }

    }

    private List sendQuery(String location, int capacity, LocalDate inDate, LocalDate outDate) {
        List<Room> results = null;
        EntityManager session = HibernateUtil.getSessionFactory().createEntityManager();

        session.getTransaction().begin();

        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();

        CriteriaQuery<Room> searchQuery = criteriaBuilder.createQuery(Room.class);

        Root<Room> root = searchQuery.from(Room.class);

        Join<Room, Hotel> hotelRooms = root.join(Room_.hotel);

        Predicate[] predicates = new Predicate[4];

        if (location != null) {
            predicates[0] = criteriaBuilder.equal(hotelRooms.get(Hotel_.CITY), location);
        }

        if (capacity != 0) {
            predicates[1] = criteriaBuilder.equal(root.get(Room_.CAPACITY), capacity);
        }

        if (inDate != null) {
            //predicates[2] = criteriaBuilder.equal(hotelRooms.get())
        }

        if (outDate != null) {

        }

        results = session.createQuery(searchQuery).getResultList();

        session.getTransaction().commit();



        return results;
    }
}
