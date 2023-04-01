package com.demo;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class DeleteHotelServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int street_number = Integer.parseInt(request.getParameter("street_number"));
        String street_name = request.getParameter("street_name");
        String city = request.getParameter("city");
        String state_province = request.getParameter("state_province");
        String zip = request.getParameter("zip");
        String chain_name = request.getParameter("chain_name");

        HotelService hotelService = new HotelService();
        try {
            hotelService.deleteHotel(street_number, street_name, city, state_province, zip);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        response.sendRedirect("insertions.jsp");
    }
}
