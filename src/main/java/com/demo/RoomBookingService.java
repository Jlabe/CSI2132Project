package com.demo;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RoomBookingService {
    public List<RoomBooking> getRoomBookings() throws Exception {
        String sql = "SELECT * FROM room_booking";

        ConnectionDB db = new ConnectionDB();

        List<RoomBooking> roomBookings = new ArrayList<>();


        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                RoomBooking roomBooking = new RoomBooking(
                        rs.getInt("street_number"),
                        rs.getString("street_name"),
                        rs.getString("city"),
                        rs.getString("state_province"),
                        rs.getString("zip"),
                        rs.getInt("room_number"),
                        rs.getDate("booking_date"),
                        rs.getDate("check_in_date"),
                        rs.getDate("check_out_date"),
                        rs.getString("ssn")

                );
                roomBookings.add(roomBooking);
            }
            return roomBookings;

        } catch (Exception e) {
            // throw any errors occurred
            throw new Exception(e.getMessage());
        } finally {
            db.close();
        }

    }

    public String createRoomBooking(RoomBooking roomBooking) throws Exception {

        String message = "";
        Connection con = null;

        // connection object
        ConnectionDB db = new ConnectionDB();

        // sql query
        String insertRoomBookingQuery = "INSERT INTO room_booking (street_number, street_name, city, state_province, zip, room_number, booking_date, check_in_date, check_out_date, ssn) VALUES (?, ?, ?, ?, ?, ?, ?,?,?,?);";

        // try to connect to database, catch any exceptions
        try {

            con = db.getConnection(); //get Connection

            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(insertRoomBookingQuery);

            // set every ? of statement
            stmt.setInt(1, roomBooking.getStreet_number());
            stmt.setString(2, roomBooking.getStreet_name());
            stmt.setString(3,roomBooking.getCity());
            stmt.setString(4,roomBooking.getState_province());
            stmt.setString(5,roomBooking.getZip());
            stmt.setInt(6, roomBooking.getRoom_number());
            stmt.setDate(7,roomBooking.getBooking_date());
            stmt.setDate(8,roomBooking.getCheck_in_date());
            stmt.setDate(9,roomBooking.getCheck_out_date());
            stmt.setString(10,roomBooking.getSsn());



            // execute the query
            stmt.executeUpdate();

        } catch (Exception e) {
            message = "Error while inserting RoomBooking: " + e.getMessage();
        } finally {
            db.close();

        }

        // return respective message
        return message;
    }

    public String deleteRoomBooking(int street_number, String street_name, String city, String stateProvince, String zip, int room_number, Date bookingDate) throws Exception {
        Connection con = null;
        String message = "";

        // sql query
        String sql = "DELETE FROM room_booking WHERE street_number = ? AND street_name = ? AND city = ? AND state_province = ? AND zip = ? AND room_number = ? AND booking_date = ?;";

        // database connection object
        ConnectionDB db = new ConnectionDB();

        // try connect to database, catch any exceptions
        try {
            con = db.getConnection();

            // prepare statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // set every ? of statement
            stmt.setInt(1, street_number);
            stmt.setString(2, street_name);
            stmt.setString(3, city);
            stmt.setString(4, stateProvince);
            stmt.setString(5, zip);
            stmt.setInt(6, room_number);
            stmt.setDate(7, bookingDate);

            // execute the query
            stmt.executeUpdate();

        } catch (Exception e) {
            message = "Error while deleting room booking: " + e.getMessage();
        } finally {

            db.close();
        }

        return message;
    }

}
