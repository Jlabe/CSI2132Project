package com.demo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RoomService {

    public List<Room> getRooms() throws Exception {
        String sql = "SELECT * FROM room";

        ConnectionDB db = new ConnectionDB();

        List<Room> rooms = new ArrayList<>();

        String seaMountainView = "";

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                if (rs.getBoolean("sea_mountain_view") == false) {
                    seaMountainView = "NO";
                } else {
                    seaMountainView = "YES";
                }
                Room room = new Room(
                        rs.getInt("street_number"),
                        rs.getString("street_name"),
                        rs.getString("city"),
                        rs.getString("state_province"),
                        rs.getString("zip"),
                        rs.getInt("room_number"),
                        rs.getInt("price"),
                        rs.getInt("capacity"),
                        seaMountainView,
                        rs.getString("problems_damages"),
                        rs.getDate("check_in_date"),
                        rs.getDate("check_out_date")
                );
                rooms.add(room);
            }


            return rooms;
        } catch (Exception e) {
            // throw any errors occurred
            throw new Exception(e.getMessage());
        } finally {
            db.close();
        }

    }

    public String createRoom(Room room) throws Exception {
        String message = "";
        Connection con = null;

        // connection object
        ConnectionDB db = new ConnectionDB();

        // sql query
        String insertRoomQuery = "INSERT INTO room (street_number,street_name, city, state_province,zip,room_number, price, capacity, sea_mountain_view, problems_damages, check_in_date, check_out_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

        // try connect to database, catch any exceptions
        try {
            con = db.getConnection(); //get Connection

            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(insertRoomQuery);

            // set every ? of statement
            stmt.setInt(1, room.getStreet_number());
            stmt.setString(2, room.getStreet_name());
            stmt.setString(3, room.getCity());
            stmt.setString(4,room.getStateProvince());
            stmt.setString(5,room.getZip());
            stmt.setInt(6, room.getRoom_number() );
            stmt.setDouble(7,room.getPrice());
            stmt.setInt(8,room.getCapacity());

            if(room.getSeaMountainView().equals("YES")){
                stmt.setBoolean(9,true);
            }
            else{
                stmt.setBoolean(9,false);
            }

            stmt.setString(10, room.getProblemsDamages());
            stmt.setDate(11,room.getCheck_in_date());
            stmt.setDate(12,room.getCheck_out_date());

            // execute the query
            stmt.executeUpdate();

        } catch (Exception e) {
            message = "Error while inserting room: " + e.getMessage();
        } finally {

            db.close();

        }

        // return respective message
        return message;
    }

    public String deleteRoom(int street_number,String street_name, String city, String stateProvince, String zip, int room_number) throws Exception {
        Connection con = null;
        String message = "";

        // sql query
        String sql = "DELETE FROM room WHERE street_number = ? AND street_name = ? AND city = ? AND state_province = ? AND zip = ? AND room_number = ?;";

        // database connection object
        ConnectionDB db = new ConnectionDB();

        // try connect to database, catch any exceptions
        try {
            con = db.getConnection();

            // prepare statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // set every ? of statement
            stmt.setInt(1, street_number);
            stmt.setString(2,street_name);
            stmt.setString(3,city);
            stmt.setString(4, stateProvince);
            stmt.setString(5,zip);
            stmt.setInt(6, room_number);



            // execute the query
            stmt.executeUpdate();


        } catch (Exception e) {
            message = "Error while deleting room: " + e.getMessage();
        } finally {

            db.close();
        }

        return message;
    }

    public String updateRoom(Room room) throws Exception {
        Connection con = null;
        String message = "";

        // sql query
        String sql = "UPDATE room SET street_number = ?, street_name = ?, city = ?, state_province = ?, zip = ?, room_number = ?, price = ?, capacity = ?, sea_mountain_view = ?, problems_damages = ?, check_in_date = ?, check_out_date = ? WHERE street_number = ? AND street_name = ? AND city = ? AND state_province = ? AND zip = ? AND room_number = ?;";

        // connection object
        ConnectionDB db = new ConnectionDB();

        // try connect to database, catch any exceptions
        try {
            // get connection
            con = db.getConnection();

            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // set every ? of statement
            stmt.setInt(1, room.getStreet_number());
            stmt.setString(2, room.getStreet_name());
            stmt.setString(3, room.getCity());
            stmt.setString(4, room.getStateProvince());
            stmt.setString(5, room.getZip());
            stmt.setInt(6, room.getRoom_number());
            stmt.setDouble(7, room.getPrice());
            stmt.setInt(8, room.getCapacity());

            String seaMountainView = room.getSeaMountainView();
            if (seaMountainView != null && seaMountainView.equals("YES")) {
                stmt.setBoolean(9, true);
            } else {
                stmt.setBoolean(9, false);
            }

            stmt.setString(10, room.getProblemsDamages());
            stmt.setDate(11, room.getCheck_in_date());
            stmt.setDate(12, room.getCheck_out_date());
            stmt.setInt(13, room.getStreet_number());
            stmt.setString(14, room.getStreet_name());
            stmt.setString(15, room.getCity());
            stmt.setString(16, room.getStateProvince());
            stmt.setString(17, room.getZip());
            stmt.setInt(18, room.getRoom_number());

            // execute the query
            stmt.executeUpdate();

        } catch (Exception e) {
            message = "Error while updating room: " + e.getMessage();
        } finally {
            db.close();
        }

        // return respective message
        return message;
    }

    public Room getRoomByUniqueIdentifiers(String street_number, String street_name, String city, String stateProvince, String zip, String room_number) throws Exception {
        int street_number_to_int = Integer.parseInt(street_number);
        int room_number_to_int = Integer.parseInt(room_number);

        String sql = "SELECT * FROM room WHERE street_number = ? AND street_name = ? AND city = ? AND state_province = ? AND zip = ? AND room_number = ?";

        ConnectionDB db = new ConnectionDB();

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setInt(1, street_number_to_int);
            stmt.setString(2, street_name);
            stmt.setString(3, city);
            stmt.setString(4, stateProvince);
            stmt.setString(5, zip);
            stmt.setInt(6, room_number_to_int);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Room room = new Room(
                        rs.getInt("street_number"),
                        rs.getString("street_name"),
                        rs.getString("city"),
                        rs.getString("state_province"),
                        rs.getString("zip"),
                        rs.getInt("room_number"),
                        rs.getInt("price"),
                        rs.getInt("capacity"),
                        rs.getString("sea_mountain_view"),
                        rs.getString("problems_damages"),
                        rs.getDate("check_in_date"),
                        rs.getDate("check_out_date")
                );
                return room;
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
