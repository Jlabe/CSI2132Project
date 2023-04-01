package com.demo;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;

public class EditRoomServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, IOException {
        String streetNumber = request.getParameter("street_number");
        String streetName = request.getParameter("street_name");
        String city = request.getParameter("city");
        String stateProvince = request.getParameter("state_province");
        String zip = request.getParameter("zip");
        String roomNumber = request.getParameter("room_number");

        RoomService roomService = new RoomService();
        Room room = null;
        try {
            room = roomService.getRoomByUniqueIdentifiers(streetNumber, streetName, city, stateProvince, zip, roomNumber);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        request.setAttribute("room", room);

        RequestDispatcher dispatcher = request.getRequestDispatcher("edit_room.jsp");
        dispatcher.forward(request, response);
    }
}

