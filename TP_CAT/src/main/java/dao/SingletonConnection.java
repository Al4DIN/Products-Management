package dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class SingletonConnection {
    private static Connection connection;
    static {
        
        try
        {

            String url1 = "jdbc:mysql://localhost:3306/db_catal?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            String user = "root";
            String password = "";
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url1, user, password);

        }catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

    }

    public static Connection getConnection() {
        return connection;
    }
}
