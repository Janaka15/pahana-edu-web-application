package com.example.pahanaeduwebapplication.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static Connection connection;

    private static final String URL = "jdbc:mysql://localhost:3306/pahanaedu";
    private static final String USERNAME = "root";
    private static final String PASSWORD = ""; // change if you set a password

    private DBConnection() { }

    public static Connection getConnection() throws SQLException {
        if (connection == null || connection.isClosed()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                throw new SQLException("MySQL Driver not found!");
            }
        }
        return connection;
    }
}
