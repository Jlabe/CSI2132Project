package com.demo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class FindRoom {
    public List<Room> getRoomFromSearch(ArrayList<String> formData) throws Exception {


        String check_in_dateValue = formData.get(0);
        String check_out_dateValue = formData.get(1);
        int capacityValue = Integer.parseInt(formData.get(2));
        String cityValue = formData.get(3);
        String hotelChainValue = formData.get(4);
        String hotelCategoryValue = "";
        if (formData.get(5).equals("1")){
            hotelCategoryValue = "Budget";
        } else if (formData.get(5).equals("2")) {
            hotelCategoryValue = "Mid-range";
        }else {
            hotelCategoryValue = "Luxury";
        }
        int totalRoomsValue = Integer.parseInt(formData.get(6));
        double roomPriceValue = Double.parseDouble(formData.get(7));

        String sql = "SELECT *\n" +
                "FROM room, hotel, room_renting\n" +
                "WHERE check_in_date = ?" +
                "  AND check_out_date = ?" +
                "  AND CAST(capacity AS INTEGER) = ?" +
                "  AND room.city = ?" +
                "  AND chain_name = ?" +
                "  AND category = ?" +
                "  AND CAST(num_of_rooms AS INTEGER) = ?" +
                "  AND CAST(price AS INTEGER) <= ?;";

        ConnectionDB db = new ConnectionDB();

        List<Room> rooms = new ArrayList<>();

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setDate(1, java.sql.Date.valueOf(check_in_dateValue));
            stmt.setDate(2, java.sql.Date.valueOf(check_out_dateValue));
            stmt.setInt(3, capacityValue);
            stmt.setString(4, cityValue);
            stmt.setString(5, hotelChainValue);
            stmt.setString(6, hotelCategoryValue);
            stmt.setInt(7, totalRoomsValue);
            stmt.setDouble(8, roomPriceValue);



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
