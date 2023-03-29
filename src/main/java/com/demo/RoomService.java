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
                        rs.getString("problems_damages")
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
        String insertRoomQuery = "INSERT INTO room (street_number,street_name, city, state_province,zip,room_number, price, capacity, seaMountainView, problems_damages) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

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
            stmt.setInt(7,room.getPrice());
            stmt.setInt(8,room.getCapacity());

            if(room.getSeaMountainView().equals("YES")){
                stmt.setBoolean(9,true);
            }
            else{
                stmt.setBoolean(9,false);
            }

            stmt.setString(10, room.getProblemsDamages());
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
        String sql = "DELETE FROM room WHERE street_number = ? , street_name = ? , city = ? , stateProvince = ? , zip = ? , room_number = ? ;";

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
        String sql = "UPDATE room SET street_number = ? , street_name = ? , city = ? , stateProvince = ? , zip = ? , room_number = ?, price = ? , capacity = ? , seaMountainView = ? , problemsDamages = ? WHERE street_number = ? , street_name = ? , city = ? , stateProvince = ? , zip = ? , room_number = ?;";

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
            stmt.setString(5,room.getZip());
            stmt.setInt(6, room.getRoom_number() );
            stmt.setInt(7,room.getPrice());
            stmt.setInt(8,room.getCapacity());

            if(room.getSeaMountainView().equals("YES")){
                stmt.setBoolean(9,true);
            }
            else{
                stmt.setBoolean(9,false);
            }

            stmt.setString(10, room.getProblemsDamages());

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




}
