package com.demo;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class UpdateCustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ssn = request.getParameter("ssn");
        String firstName = request.getParameter("first_name");
        String middleName = request.getParameter("middle_name");
        String lastName = request.getParameter("last_name");
        int streetNumber = Integer.parseInt(request.getParameter("street_number"));
        String streetName = request.getParameter("street_name");
        int aptNumber = Integer.parseInt(request.getParameter("apt_number"));
        String city = request.getParameter("city");
        String stateProvince = request.getParameter("stateProvince");
        String zip = request.getParameter("zip");
        String registrationDate = request.getParameter("registration_date");

        CustomerService customerService = new CustomerService();
        Customer customer = new Customer(
                ssn,
                firstName,
                middleName,
                lastName,
                streetNumber,
                streetName,
                city,
                stateProvince,
                aptNumber,
                zip,
                registrationDate
        );

        try {
            customerService.updateCustomer(customer);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        response.sendRedirect("insertions.jsp");
    }

}
