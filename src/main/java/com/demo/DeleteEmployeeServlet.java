package com.demo;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String worker_ssn = request.getParameter("worker_ssn");

        EmployeeService employeeService = new EmployeeService();
        try {
            employeeService.deleteEmployee(worker_ssn);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect("insertions.jsp");
    }
}
