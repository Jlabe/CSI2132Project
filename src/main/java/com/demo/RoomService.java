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

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
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
                        rs.getString("problems_damages")
                );
                rooms.add(room);
            }

            return rooms;
        }catch (Exception e) {
            // throw any errors occurred
            throw new Exception(e.getMessage());
        }finally {
            db.close();
        }
    }

}
