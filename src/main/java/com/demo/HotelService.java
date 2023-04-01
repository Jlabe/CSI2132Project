package com.demo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class HotelService {

    public List<Hotel> getHotels() throws Exception {
        String sql = "SELECT * FROM Hotel";

        ConnectionDB db = new ConnectionDB();

        List<Hotel> hotels = new ArrayList<>();


        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                Hotel hotel = new Hotel(
                        rs.getString("chain_name"),
                        rs.getInt("street_number"),
                        rs.getString("street_name"),
                        rs.getString("city"),
                        rs.getString("state_province"),
                        rs.getString("zip"),
                        rs.getInt("num_of_rooms"),
                        rs.getString("contact_email"),
                        rs.getString("category")

                );
                hotels.add(hotel);
            }
            return hotels;

        } catch (Exception e) {
            // throw any errors occurred
            throw new Exception(e.getMessage());
        } finally {
            db.close();
        }

    }

    public String createHotel(Hotel hotel) throws Exception {

        String message = "";
        Connection con = null;

        // connection object
        ConnectionDB db = new ConnectionDB();

        // sql query
        String insertHotelQuery = "INSERT INTO hotel (chain_name,street_number, street_name, city, state_province,zip,num_of_rooms,contact_email,category) VALUES (?, ?, ?, ?, ?, ?, ?, ?,?);";

        // try to connect to database, catch any exceptions
        try {

            con = db.getConnection(); //get Connection

            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(insertHotelQuery);

            // set every ? of statement
            stmt.setString(1, hotel.getChain_name());
            stmt.setInt(2, hotel.getStreet_number());
            stmt.setString(3, hotel.getStreet_name());
            stmt.setString(4,hotel.getCity());
            stmt.setString(5,hotel.getStateProvince());
            stmt.setString(6,hotel.getZip());
            stmt.setInt(7, hotel.getNum_of_rooms());
            stmt.setString(8,hotel.getContact_email());
            stmt.setString(9,hotel.getCategory());



            // execute the query
            stmt.executeUpdate();

        } catch (Exception e) {
            message = "Error while inserting hotel: " + e.getMessage();
        } finally {
            db.close();

        }

        // return respective message
        return message;
    }

    public String deleteHotel(int street_number, String street_name, String city, String stateProvince, String zip) throws Exception {
        Connection con = null;
        String message = "";

        // sql query
        String sql = "DELETE FROM hotel WHERE street_number = ? AND street_name = ? AND city = ? AND state_province = ? AND zip = ?;";

        // database connection object
        ConnectionDB db = new ConnectionDB();

        // try to connect to database, catch any exceptions
        try {
            con = db.getConnection();

            // prepare statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // set every ? of statement
            stmt.setInt(1,street_number);
            stmt.setString(2,  street_name);
            stmt.setString(3, city);
            stmt.setString(4, stateProvince);
            stmt.setString(5,zip);


            // execute the query
            stmt.executeUpdate();

        } catch (Exception e) {
            message = "Error while deleting hotel: " + e.getMessage();
        } finally {

            db.close();
        }

        return message;
    }

    public String updateHotel(Hotel hotel) throws Exception {
        Connection con = null;
        String message = "";

        // sql query
        String sql = "UPDATE Hotel SET street_number = ?, street_name = ?, city = ?, state_province = ?, zip = ?, num_of_rooms = ?, contact_email = ?, category = ?, chain_name = ? WHERE street_number = ? AND street_name = ? AND city = ? AND state_province = ? AND zip = ?;";

        // connection object
        ConnectionDB db = new ConnectionDB();

        // try to connect to database, catch any exceptions
        try {
            // get connection
            con = db.getConnection();

            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // set every ? of statement
            stmt.setInt(1, hotel.getStreet_number());
            stmt.setString(2, hotel.getStreet_name());
            stmt.setString(3, hotel.getCity());
            stmt.setString(4, hotel.getStateProvince());
            stmt.setString(5, hotel.getZip());
            stmt.setInt(6, hotel.getNum_of_rooms());
            stmt.setString(7, hotel.getContact_email());
            stmt.setString(8, hotel.getCategory());
            stmt.setString(9, hotel.getChain_name());

            stmt.setInt(10, hotel.getStreet_number());
            stmt.setString(11, hotel.getStreet_name());
            stmt.setString(12, hotel.getCity());
            stmt.setString(13, hotel.getStateProvince());
            stmt.setString(14, hotel.getZip());

            // execute the query
            stmt.executeUpdate();

        } catch (Exception e) {
            message = "Error while updating hotel: " + e.getMessage();

        } finally {
            db.close();
        }

        return message;
    }


    public Hotel getHotelByUniqueId(int street_number, String street_name, String city, String stateProvince, String zip) throws Exception {

        String sql = "SELECT * FROM hotel WHERE street_number = ? AND street_name = ? AND city = ? AND state_province = ? AND zip = ?;";

        ConnectionDB db = new ConnectionDB();

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setInt(1, street_number);
            stmt.setString(2, street_name);
            stmt.setString(3, city);
            stmt.setString(4, stateProvince);
            stmt.setString(5, zip);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Hotel hotel = new Hotel(
                        rs.getString("chain_name"),
                        rs.getInt("street_number"),
                        rs.getString("street_name"),
                        rs.getString("city"),
                        rs.getString("state_province"),
                        rs.getString("zip"),
                        rs.getInt("num_of_rooms"),
                        rs.getString("contact_email"),
                        rs.getString("category")

                );
                return hotel;
            } else {
                throw new Exception("Hotel not found");
            }
        } catch (Exception e) {
            // throw any errors occurred
            throw new Exception(e.getMessage());
        } finally {
            db.close();
        }
    }
}
