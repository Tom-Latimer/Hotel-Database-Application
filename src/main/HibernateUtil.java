package main;


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
            configuration.addAnnotatedClass(main.DBModel.Amenity.class);
            configuration.addAnnotatedClass(main.DBModel.AmenityId.class);
            configuration.addAnnotatedClass(main.DBModel.Book.class);
            configuration.addAnnotatedClass(main.DBModel.BookId.class);
            configuration.addAnnotatedClass(main.DBModel.Booking.class);
            configuration.addAnnotatedClass(main.DBModel.Create.class);
            configuration.addAnnotatedClass(main.DBModel.CreateId.class);
            configuration.addAnnotatedClass(main.DBModel.Customer.class);
            configuration.addAnnotatedClass(main.DBModel.Employee.class);
            configuration.addAnnotatedClass(main.DBModel.Hotel.class);
            configuration.addAnnotatedClass(main.DBModel.HotelChain.class);
            configuration.addAnnotatedClass(main.DBModel.HotelId.class);
            configuration.addAnnotatedClass(main.DBModel.Manage.class);
            configuration.addAnnotatedClass(main.DBModel.ManageId.class);
            configuration.addAnnotatedClass(main.DBModel.Pay.class);
            configuration.addAnnotatedClass(main.DBModel.PayId.class);
            configuration.addAnnotatedClass(main.DBModel.Problem.class);
            configuration.addAnnotatedClass(main.DBModel.ProblemId.class);
            configuration.addAnnotatedClass(main.DBModel.Register.class);
            configuration.addAnnotatedClass(main.DBModel.RegisterId.class);
            configuration.addAnnotatedClass(main.DBModel.Rent.class);
            configuration.addAnnotatedClass(main.DBModel.RentId.class);
            configuration.addAnnotatedClass(main.DBModel.Renting.class);
            configuration.addAnnotatedClass(main.DBModel.Reserve.class);
            configuration.addAnnotatedClass(main.DBModel.ReserveId.class);
            configuration.addAnnotatedClass(main.DBModel.Room.class);
            configuration.addAnnotatedClass(main.DBModel.RoomId.class);
            configuration.addAnnotatedClass(main.DBModel.Work.class);
            configuration.addAnnotatedClass(main.DBModel.WorkId.class);
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
