package main;


import DBModel.HotelChain;
import Util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.jdbc.Work;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.sql.Connection;
import java.sql.SQLException;

public class Test {

    public static void main(String[] args) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("HotelPU");

        HotelChain h = new HotelChain();
        h.setId("Test7");
        EntityManager session = emf.createEntityManager();

            session.getTransaction().begin();
            session.persist(h);
            session.getTransaction().commit();





    }
}
