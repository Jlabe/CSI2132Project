package com.demo;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


public class EditCustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ssn = request.getParameter("ssn");

        CustomerService customerService = new CustomerService();
        Customer customer = null;
        try {
            customer = customerService.getCustomerByUniqueId(ssn);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        request.setAttribute("customer", customer);

        RequestDispatcher dispatcher = request.getRequestDispatcher("edit_customer.jsp");
        dispatcher.forward(request, response);
    }


}
