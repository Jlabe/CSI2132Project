package com.demo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

//@WebServlet("/RentingServlet")
public class RentingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RoomRentingService roomRentingService = new RoomRentingService();

        // Extract the necessary attributes from the request
        int street_number = Integer.parseInt(request.getParameter("street_number"));
        String street_name = request.getParameter("street_name");
        String city = request.getParameter("city");
        String stateProvince = request.getParameter("state_province");
        String zip = request.getParameter("zip");
        int room_number = Integer.parseInt(request.getParameter("room_number"));

        String check_in_date = request.getParameter("check_in_date");
        String check_out_date = request.getParameter("check_out_date");

        LocalDate startDateLocal = LocalDate.parse(check_in_date);
        LocalDate endDateLocal = LocalDate.parse(check_out_date);

        Date startDateSql = Date.valueOf(startDateLocal);
        Date endDateSql = Date.valueOf(endDateLocal);


        //TODO remove this later
        street_number = 12;
        String worker_ssn = "401214567";
        String ssn = request.getParameter("ssn");

        // ... other attributes

        // Create the RoomRenting object
        RoomRenting roomRenting = new RoomRenting(
                street_number,
                street_name,
                city,
                stateProvince,
                zip,
                room_number,
                startDateSql,
                endDateSql,
                worker_ssn,
                ssn);

        // Call the createRoomRenting method
        try {
            roomRentingService.createRoomRenting(roomRenting);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        response.sendRedirect("employeeEntry.jsp");
    }
}
