package com.demo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RoomRentingService {
    public List<RoomRenting> getRoomRenting() throws Exception {
        String sql = "SELECT * FROM room_renting";

        ConnectionDB db = new ConnectionDB();

        List<RoomRenting> roomRentings = new ArrayList<>();


        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                RoomRenting roomRenting = new RoomRenting(
                        rs.getInt("street_number"),
                        rs.getString("street_name"),
                        rs.getString("city"),
                        rs.getString("state_province"),
                        rs.getString("zip"),
                        rs.getInt("room_number"),
                        rs.getDate("check_in_date"),
                        rs.getDate("check_out_date"),
                        rs.getString("worker_ssn"),
                        rs.getString("ssn")

                );
                roomRentings.add(roomRenting);
            }
            return roomRentings;

        } catch (Exception e) {
            // throw any errors occurred
            throw new Exception(e.getMessage());
        } finally {
            db.close();
        }

    }

    public String createRoomRenting(RoomRenting roomRenting) throws Exception {

        String message = "";
        Connection con = null;

        // connection object
        ConnectionDB db = new ConnectionDB();

        // sql query
        String insertRoomRentingQuery = "INSERT INTO room_renting (street_number, street_name, city, state_province, zip, room_number, check_in_date, check_out_date, worker_ssn, ssn) VALUES (?, ?, ?, ?, ?, ?, ?,?,?,?);";

        // try to connect to database, catch any exceptions
        try {

            con = db.getConnection(); //get Connection

            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(insertRoomRentingQuery);

            // set every ? of statement
            stmt.setInt(1, roomRenting.getStreet_number());
            stmt.setString(2, roomRenting.getStreet_name());
            stmt.setString(3,roomRenting.getCity());
            stmt.setString(4,roomRenting.getState_province());
            stmt.setString(5,roomRenting.getZip());
            stmt.setInt(6, roomRenting.getRoom_number());
            stmt.setDate(7,roomRenting.getCheck_in_date());
            stmt.setDate(8,roomRenting.getCheck_out_date());
            stmt.setString(9,roomRenting.getWorker_ssn());
            stmt.setString(10,roomRenting.getSsn());



            // execute the query
            stmt.executeUpdate();

        } catch (Exception e) {
            message = "Error while inserting RoomRenting: " + e.getMessage();
        } finally {
            db.close();

        }

        // return respective message
        return message;
    }
}
