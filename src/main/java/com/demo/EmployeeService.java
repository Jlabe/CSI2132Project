package com.demo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class EmployeeService {

    public List<Employee> getEmployee() throws Exception {
        String sql = "SELECT * FROM Employee";

        ConnectionDB db = new ConnectionDB();

        List<Employee> employees = new ArrayList<>();


        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                Employee employee = new Employee(
                        rs.getString("worker_ssn"),
                        rs.getString("manager_ssn"),
                        rs.getString("first_name"),
                        rs.getString("middle_name"),
                        rs.getString("last_name"),
                        rs.getInt("street_number"),
                        rs.getString("street_name"),
                        rs.getInt("apt_number"),
                        rs.getString("city"),
                        rs.getString("stateProvince"),
                        rs.getString("zip")
                );
                employees.add(employee);
            }
            return employees;

        } catch (Exception e) {
            // throw any errors occurred
            throw new Exception(e.getMessage());
        } finally {
            db.close();
        }

    }

    public String createEmployee(Employee employee) throws Exception {

        String message = "";
        Connection con = null;

        // connection object
        ConnectionDB db = new ConnectionDB();

        // sql query
        String insertEmployeeQuery = "INSERT INTO Employee (worker_ssn , manager_ssn, first_name, middle_name, last_name, street_number,street_name, apt_number, city, stateProvince,zip) VALUES (?, ?, ?, ?, ?, ?, ?, ?,?, ?, ?);";

        // try connect to database, catch any exceptions
        try {

            con = db.getConnection(); //get Connection

            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(insertEmployeeQuery);

            // set every ? of statement
            stmt.setString(1, employee.getWorker_ssn());
            stmt.setString(2, employee.getManager_ssn());
            stmt.setString(3, employee.getFirst_name());
            stmt.setString(4, employee.getMiddle_name());
            stmt.setString(5, employee.getLast_name());
            stmt.setInt(6, employee.getStreet_number());
            stmt.setString(7, employee.getStreet_name());
            stmt.setInt(8, employee.getApt_number());
            stmt.setString(9, employee.getCity());
            stmt.setString(10, employee.getStateProvince());
            stmt.setString(11, employee.getZip());

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

    public String deleteEmployee(String worker_ssn) throws Exception {
        Connection con = null;
        String message = "";

        // sql query
        String sql = "DELETE FROM employee WHERE worker_ssn = ? ;";

        // database connection object
        ConnectionDB db = new ConnectionDB();

        // try connect to database, catch any exceptions
        try {
            con = db.getConnection();

            // prepare statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // set every ? of statement
            stmt.setString(1, worker_ssn);


            // execute the query
            stmt.executeUpdate();

        } catch (Exception e) {
            message = "Error while deleting employee: " + e.getMessage();
        } finally {

            db.close();
        }

        return message;
    }

    public String updateCustomer(Employee employee) throws Exception {
        Connection con = null;
        String message = "";

        // sql query
        String sql = "UPDATE Customer SET worker_ssn = ?, employee_ssn = ?, first_name = ?, middle_name = ?, last_name = ?, street_number = ?,street_name = ?, apt_number = ?, stateProvince = ? ,zip = ? WHERE worker_ssn = ?;";

        // connection object
        ConnectionDB db = new ConnectionDB();

        // try connect to database, catch any exceptions
        try {
            // get connection
            con = db.getConnection();

            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // set every ? of statement
            stmt.setString(1, employee.getWorker_ssn());
            stmt.setString(2,employee.getManager_ssn());
            stmt.setString(3, employee.getFirst_name());
            stmt.setString(4, employee.getMiddle_name());
            stmt.setString(5, employee.getLast_name());
            stmt.setInt(6, employee.getStreet_number());
            stmt.setString(7, employee.getStreet_name());
            stmt.setInt(8, employee.getApt_number());
            stmt.setString(9, employee.getCity());
            stmt.setString(10, employee.getStateProvince());
            stmt.setString(11, employee.getZip());

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

}
