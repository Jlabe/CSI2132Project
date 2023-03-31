package com.demo;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, IOException {
        String room_street_number = request.getParameter("hidden_street_number");
        String room_street_name = request.getParameter("hidden_street_name");
        String room_city = request.getParameter("hidden_city");
        String room_stateProvince = request.getParameter("hidden_stateProvince");
        String room_zip = request.getParameter("hidden_zip");
        String room_number = request.getParameter("hidden_room_number");
        String start_date = request.getParameter("hidden_start_date");
        String end_date = request.getParameter("hidden_end_date");

        String first_name = request.getParameter("first_name");
        String middle_name = request.getParameter("middle_name");
        String last_name = request.getParameter("last_name");
        String email = request.getParameter("email");
        String phone_number = request.getParameter("phone_number");
        String ssn = request.getParameter("ssn");
        String customer_street_number = request.getParameter("street_number");
        String customer_street_name = request.getParameter("street_name");
        String apartment_number = request.getParameter("apartment_number");
        String customer_city = request.getParameter("city");
        String customer_state_province = request.getParameter("state_province");
        String customer_zip = request.getParameter("zip");

        ArrayList<String> bookingData = new ArrayList<>();
        bookingData.add(room_street_number);
        bookingData.add(room_street_name);
        bookingData.add(room_city);
        bookingData.add(room_stateProvince);
        bookingData.add(room_zip);
        bookingData.add(room_number);
        bookingData.add(start_date);
        bookingData.add(end_date);
        bookingData.add(first_name);
        bookingData.add(middle_name);
        bookingData.add(last_name);
        bookingData.add(email);
        bookingData.add(phone_number);
        bookingData.add(ssn);
        bookingData.add(customer_street_number);
        bookingData.add(customer_street_name);
        bookingData.add(apartment_number);
        bookingData.add(customer_city);
        bookingData.add(customer_state_province);
        bookingData.add(customer_zip);

        request.getSession().setAttribute("bookingData", bookingData);

        // Redirect to processBooking.jsp to handle the data
        RequestDispatcher dispatcher = request.getRequestDispatcher("processBooking.jsp");
        dispatcher.forward(request, response);
    }

}
