package com.demo;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class InsertRoomServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int room_street_number = Integer.valueOf(request.getParameter("room_street_number"));
        String room_street_name = request.getParameter("room_street_name");
        String room_city = request.getParameter("room_city");
        String room_state_province = request.getParameter("room_state_province");
        String room_zip = request.getParameter("room_zip");
        int room_number = Integer.valueOf(request.getParameter("room_number"));
        double price = Double.valueOf(request.getParameter("room_price"));
        int capacity = Integer.valueOf(request.getParameter("room_capacity"));
        String room_sea_mountain_view = request.getParameter("room_sea_mountain_view");
        String room_problems_damages = request.getParameter("room_problems_damages");
        String check_in_date = request.getParameter("room_check_in_date");
        String check_out_date = request.getParameter("room_check_out_date");

        java.sql.Date check_in_date_date_version = java.sql.Date.valueOf(check_in_date);
        java.sql.Date check_out_date_date_version = java.sql.Date.valueOf(check_out_date);

        RoomService roomService = new RoomService();

        // create room object
        Room room  = new Room(room_street_number, room_street_name,room_city, room_state_province,room_zip,room_number, price,capacity, room_sea_mountain_view, room_problems_damages, check_in_date_date_version, check_out_date_date_version);

        try {
            roomService.createRoom(room);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        response.sendRedirect("insertions.jsp");
    }

}
