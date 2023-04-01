package com.demo;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;

public class UpdateRoomServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get room details from the request
        int streetNumber = Integer.parseInt(request.getParameter("street_number"));
        String streetName = request.getParameter("street_name");
        String city = request.getParameter("city");
        String stateProvince = request.getParameter("state_province");
        String zip = request.getParameter("zip");
        int roomNumber = Integer.parseInt(request.getParameter("room_number"));
        double price = Double.parseDouble(request.getParameter("price"));
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        String sea_mountain_view = request.getParameter("sea_mountain_view");
        String problemsDamages = request.getParameter("problems_damages");
        Date checkInDate = Date.valueOf(request.getParameter("check_in_date"));
        Date checkOutDate = Date.valueOf(request.getParameter("check_out_date"));

        Room room = new Room(
                streetNumber,
                streetName,
                city,
                stateProvince,
                zip,
                roomNumber,
                price,
                capacity,
                sea_mountain_view,
                problemsDamages,
                checkInDate,
                checkOutDate
        );

        // Update the room in the database
        RoomService roomService = new RoomService();
        try {
            roomService.updateRoom(room);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        response.sendRedirect("insertions.jsp");
    }
}
