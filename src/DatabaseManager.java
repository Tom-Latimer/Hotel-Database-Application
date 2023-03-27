import java.sql.*;

public class DatabaseManager {
    public static void main(String[] args) {
        String url = "jdbc:postgresql://localhost:5432/HotelApplication";
        String user = "postgres";
        String password = "postSh1zue!!gres";

        try {
            Class.forName("org.postgresql.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);
            System.out.println("Connected to the PostgreSQL database!");

            // use the connection to execute SQL queries...

            conn.close();
        } catch (SQLException e) {
            System.out.println("SQL exception: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            System.out.println("JDBC driver not found");
        }
    }
}
