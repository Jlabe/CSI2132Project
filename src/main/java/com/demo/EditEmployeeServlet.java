package com.demo;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class EditEmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String worker_ssn = request.getParameter("worker_ssn");

        EmployeeService employeeService = new EmployeeService();
        Employee employee = null;
        try {
            employee = employeeService.getEmployeeByUniqueId(worker_ssn);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        request.setAttribute("employee", employee);

        RequestDispatcher dispatcher = request.getRequestDispatcher("edit_employee.jsp");
        dispatcher.forward(request, response);
    }


}