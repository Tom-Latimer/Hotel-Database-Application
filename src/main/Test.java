package main;


import DBModel.HotelChain;
import Util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.jdbc.Work;

import java.sql.Connection;
import java.sql.SQLException;

public class Test {

    public static void main(String[] args) {

        HotelChain h = new HotelChain();
        h.setId("Test2");
        try(Session session = HibernateUtil.getSessionFactory().openSession()) {

            session.beginTransaction();
            session.persist(h);
            session.getTransaction().commit();



        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
