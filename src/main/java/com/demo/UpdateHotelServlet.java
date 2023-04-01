package com.demo;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class UpdateHotelServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int hotel_street_number = Integer.valueOf(request.getParameter("hotel_street_number"));
        String hotel_street_name = request.getParameter("hotel_street_name");
        String hotel_city = request.getParameter("hotel_city");
        String hotel_state_province = request.getParameter("hotel_state_province");
        String  hotel_zip = request.getParameter("hotel_zip");
        int hotel_num_of_rooms = Integer.valueOf(request.getParameter("hotel_num_of_rooms"));
        String hotel_contact_email = request.getParameter("hotel_contact_email");
        String hotel_category = request.getParameter("hotel_category");
        String hotel_chain = request.getParameter("hotel_chain");

        HotelService hotelService = new HotelService();
        Hotel hotel = new Hotel(
                hotel_chain,
                hotel_street_number,
                hotel_street_name,
                hotel_city,
                hotel_state_province,
                hotel_zip,
                hotel_num_of_rooms,
                hotel_contact_email,
                hotel_category

        );

        try {
            hotelService.updateHotel(hotel);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        response.sendRedirect("insertions.jsp");
    }

}

