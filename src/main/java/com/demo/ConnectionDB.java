package com.demo;

import java.sql.*;

public class ConnectionDB {

    private final String dbServerPort = "5432";
    private final String dbName = "neondb;
    private final String dbusername = "jey12345678";
    private final String dbpassword = "X4QKwSL9fcGe";

    private Connection con = null;

    public Connection getConnection() throws Exception {
        System.out.println("HELLO!");
        try {

            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://ep-hidden-dew-093269.us-east-2.aws.neon.tech:"+dbServerPort+"/"+dbName,dbusername,dbpassword);
            System.out.println("CONNECTION WORKED???");
            return con;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            throw e;
        }


    }
    public void close() throws SQLException {
        try {
            if (con != null)
                con.close();
        } catch (SQLException e) {
            throw new SQLException("Could not close connection with the Database Server: "
                    + e.getMessage());
        }

    }
}
