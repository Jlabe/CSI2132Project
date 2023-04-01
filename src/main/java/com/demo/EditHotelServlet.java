package com.demo;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


public class EditHotelServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int hotel_street_number = Integer.valueOf(request.getParameter("hotel_street_number"));
        String hotel_street_name = request.getParameter("hotel_street_name");
        String hotel_city = request.getParameter("hotel_city");
        String hotel_state_province = request.getParameter("hotel_state_province");
        String  hotel_zip = request.getParameter("hotel_zip");

        HotelService hotelService = new HotelService();
        Hotel hotel = null;
        try {
            hotel = hotelService.getHotelByUniqueId(hotel_street_number,hotel_street_name,hotel_city,hotel_state_province,hotel_zip);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        request.setAttribute("hotel", hotel);
        RequestDispatcher dispatcher = request.getRequestDispatcher("edit_hotel.jsp");
        dispatcher.forward(request, response);
    }

}
