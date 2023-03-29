package com.demo;

import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

//@WebServlet("/searchRooms")
public class SearchRoomsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String startDate = request.getParameter("start_date");
        String endDate = request.getParameter("end_date");
        int roomCapacity = Integer.parseInt(request.getParameter("room_capacity"));
        String area = request.getParameter("area");
        String hotelChain = request.getParameter("hotel_chain");
        String hotelCategory = request.getParameter("hotel_category");
        int totalRooms = Integer.parseInt(request.getParameter("total_rooms"));
        double roomPrice = Double.parseDouble(request.getParameter("room_price"));

        ArrayList<String> formData = new ArrayList<>();
        formData.add(startDate);
        formData.add(endDate);
        formData.add(Integer.toString(roomCapacity));
        formData.add(area);
        formData.add(hotelChain);
        formData.add(hotelCategory);
        formData.add(Integer.toString(totalRooms));
        formData.add(Double.toString(roomPrice));

        request.getSession().setAttribute("formData", formData);

        // Redirect to the same page to display the results
        response.sendRedirect("index.jsp");
    }
}
