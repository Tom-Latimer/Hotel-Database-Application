package Util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class HibernateUtil {
    private static SessionFactory sessionFactory;

    private static SessionFactory buildSessionFactory() {
        try {
            // Create the SessionFactory from hibernate.cfg.xml

            Configuration configuration = new Configuration();
            configuration.configure("hibernate.cfg.xml");
            configuration.addAnnotatedClass(DBModel.Amenity.class);
            configuration.addAnnotatedClass(DBModel.AmenityId.class);
            configuration.addAnnotatedClass(DBModel.Book.class);
            configuration.addAnnotatedClass(DBModel.BookId.class);
            configuration.addAnnotatedClass(DBModel.Booking.class);
            configuration.addAnnotatedClass(DBModel.Create.class);
            configuration.addAnnotatedClass(DBModel.CreateId.class);
            configuration.addAnnotatedClass(DBModel.Customer.class);
            configuration.addAnnotatedClass(DBModel.Employee.class);
            configuration.addAnnotatedClass(DBModel.Hotel.class);
            configuration.addAnnotatedClass(DBModel.HotelChain.class);
            configuration.addAnnotatedClass(DBModel.HotelId.class);
            configuration.addAnnotatedClass(DBModel.Manage.class);
            configuration.addAnnotatedClass(DBModel.ManageId.class);
            configuration.addAnnotatedClass(DBModel.Pay.class);
            configuration.addAnnotatedClass(DBModel.PayId.class);
            configuration.addAnnotatedClass(DBModel.Problem.class);
            configuration.addAnnotatedClass(DBModel.ProblemId.class);
            configuration.addAnnotatedClass(DBModel.Register.class);
            configuration.addAnnotatedClass(DBModel.RegisterId.class);
            configuration.addAnnotatedClass(DBModel.Rent.class);
            configuration.addAnnotatedClass(DBModel.RentId.class);
            configuration.addAnnotatedClass(DBModel.Renting.class);
            configuration.addAnnotatedClass(DBModel.Reserve.class);
            configuration.addAnnotatedClass(DBModel.ReserveId.class);
            configuration.addAnnotatedClass(DBModel.Room.class);
            configuration.addAnnotatedClass(DBModel.RoomId.class);
            configuration.addAnnotatedClass(DBModel.Work.class);
            configuration.addAnnotatedClass(DBModel.WorkId.class);
            System.out.println("Hibernate Configuration loaded");


            ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
            System.out.println("Hibernate serviceRegistry created");

            SessionFactory sessionFactory = configuration.buildSessionFactory(serviceRegistry);

            return sessionFactory;
        }
        catch (Throwable ex) {
            // Make sure you log the exception, as it might be swallowed
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static SessionFactory getSessionFactory() {
        if(sessionFactory == null) sessionFactory = buildSessionFactory();
        return sessionFactory;
    }

    public static Session getHibernateSession() {
        return sessionFactory.openSession();
    }

}
