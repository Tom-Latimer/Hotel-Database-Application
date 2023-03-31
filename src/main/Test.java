package main;


import DBModel.HotelChain;
import Util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.jdbc.Work;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;

public class Test {

    public static void main(String[] args) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("HotelPU");

        HotelChain h = new HotelChain();
        h.setId("Test13");

        h.setStreetNumber(new BigDecimal(1111));
        h.setStreetName("herbert");
        h.setCity("city");
        h.setProvince("mb");
        h.setPostal("k1k1k1");
        h.setPhoneNumbers("613");
        h.setEmailAddresses("h");
        EntityManager session = emf.createEntityManager();

        session.getTransaction().begin();
        session.persist(h);
        session.getTransaction().commit();





    }
}
