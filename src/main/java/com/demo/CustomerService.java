package com.demo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class CustomerService {

    public List<Customer> getCustomers() throws Exception {
        String sql = "SELECT * FROM Customer";

        ConnectionDB db = new ConnectionDB();

        List<Customer> customers = new ArrayList<>();


        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                Customer customer = new Customer(
                        rs.getString("ssn"),
                        rs.getString("first_name"),
                        rs.getString("middle_name"),
                        rs.getString("last_name"),
                        rs.getInt("street_number"),
                        rs.getString("street_name"),
                        rs.getString("city"),
                        rs.getString("state_province"),
                        rs.getInt("apt_number"),
                        rs.getString("zip"),
                        rs.getString("registration_date")
                );
                customers.add(customer);
            }
            return customers;

        } catch (Exception e) {
            // throw any errors occurred
            throw new Exception(e.getMessage());
        } finally {
            db.close();
        }

    }

    public String createCustomer(Customer customer) throws Exception {

        String message = "";
        Connection con = null;

        // connection object
        ConnectionDB db = new ConnectionDB();

        // sql query
        String insertCustomerQuery = "INSERT INTO customer (ssn ,first_name, middle_name, last_name, street_number,street_name, apt_number, city, state_province ,zip, registration_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?,?, ?, ?);";

        // try connect to database, catch any exceptions
        try {

            con = db.getConnection(); //get Connection

            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(insertCustomerQuery);

            // set every ? of statement
            stmt.setString(1, customer.getSSN());
            stmt.setString(2, customer.getFirst_name());
            stmt.setString(3, customer.getMiddle_name());
            stmt.setString(4, customer.getLast_name());
            stmt.setInt(5, customer.getStreet_number());
            stmt.setString(6,customer.getStreet_name());
            stmt.setInt(7, customer.getApt_number());
            stmt.setString(8,customer.getCity());
            stmt.setString(9, customer.getStateProvince());
            stmt.setString(10, customer.getZip());

            LocalDate localDate = LocalDate.parse(customer.getRegistration_date(), DateTimeFormatter.ISO_LOCAL_DATE);
            java.sql.Date sqlDate = java.sql.Date.valueOf(localDate);

            stmt.setDate(11, sqlDate);


            // execute the query
            stmt.executeUpdate();

        } catch (Exception e) {
            message = "Error while inserting customer: " + e.getMessage();
        } finally {
            db.close();

        }

        // return respective message
        return message;
    }

    public String deleteCustomer(String ssn) throws Exception {
        Connection con = null;
        String message = "";

        // sql query
        String sql = "DELETE FROM customer WHERE ssn = ? ;";

        // database connection object
        ConnectionDB db = new ConnectionDB();

        // try connect to database, catch any exceptions
        try {
            con = db.getConnection();

            // prepare statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // set every ? of statement
            stmt.setString(1, ssn);


            // execute the query
            stmt.executeUpdate();

        } catch (Exception e) {
            message = "Error while deleting customer: " + e.getMessage();
        } finally {

            db.close();
        }

        return message;
    }

    public String updateCustomer(Customer customer) throws Exception {
        Connection con = null;
        String message = "";

        // sql query
        String sql = "UPDATE Customer SET ssn = ? ,first_name = ?, middle_name = ?, last_name = ?, street_number = ?,street_name = ?, apt_number = ?, city = ?, state_province = ? ,zip = ?, registration_date = ? WHERE ssn = ?;";

        // connection object
        ConnectionDB db = new ConnectionDB();

        // try connect to database, catch any exceptions
        try {
            // get connection
            con = db.getConnection();

            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // set every ? of statement
            stmt.setString(1, customer.getSSN());
            stmt.setString(2, customer.getFirst_name());
            stmt.setString(3, customer.getMiddle_name());
            stmt.setString(4, customer.getLast_name());
            stmt.setInt(5, customer.getStreet_number());
            stmt.setString(6,customer.getStreet_name());
            stmt.setInt(7, customer.getApt_number());
            stmt.setString(8,customer.getCity());
            stmt.setString(9, customer.getStateProvince());
            stmt.setString(10, customer.getZip());

            LocalDate localDate = LocalDate.parse(customer.getRegistration_date(), DateTimeFormatter.ISO_LOCAL_DATE);
            java.sql.Date sqlDate = java.sql.Date.valueOf(localDate);

            stmt.setDate(11, sqlDate);

            stmt.setString(12, customer.getSSN());
            // execute the query
            stmt.executeUpdate();

        } catch (Exception e) {
            message = "Error while updating customer: " + e.getMessage();

        } finally {
            db.close();
        }

        // return respective message
        return message;
    }

    public Customer getCustomerByUniqueId(String ssn) throws Exception {

        String sql = "SELECT * FROM customer WHERE ssn = ?";

        ConnectionDB db = new ConnectionDB();

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setString(1, ssn);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Customer customer = new Customer(
                        rs.getString("ssn"),
                        rs.getString("first_name"),
                        rs.getString("middle_name"),
                        rs.getString("last_name"),
                        rs.getInt("street_number"),
                        rs.getString("street_name"),
                        rs.getString("city"),
                        rs.getString("state_province"),
                        rs.getInt("apt_number"),
                        rs.getString("zip"),
                        rs.getString("registration_date")
                );
                return customer;
            } else {
                throw new Exception("Room not found");
            }
        } catch (Exception e) {
            // throw any errors occurred
            throw new Exception(e.getMessage());
        } finally {
            db.close();
        }
    }

}
