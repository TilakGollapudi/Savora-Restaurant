package com.rms.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static final String URL =
            "jdbc:mysql://localhost:3306/restaurant_management_system?useSSL=false&serverTimezone=UTC";

    private static final String USERNAME = "root";

    private static final String PASSWORD = "Thilak@2004";

    private static Connection connection;

    private DBConnection() {
    }

    public static Connection getConnection() {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            if(connection == null || connection.isClosed()) {

                connection = DriverManager.getConnection(
                        URL,
                        USERNAME,
                        PASSWORD
                );

                System.out.println("Database Connected Successfully");
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return connection;
    }
}