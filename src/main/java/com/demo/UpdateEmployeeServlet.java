package com.demo;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class UpdateEmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String worker_ssn = request.getParameter("worker_ssn");
        String manager_ssn = request.getParameter("manager_ssn");
        String firstName = request.getParameter("first_name");
        String middleName = request.getParameter("middle_name");
        String lastName = request.getParameter("last_name");
        int streetNumber = Integer.parseInt(request.getParameter("street_number"));
        String streetName = request.getParameter("street_name");
        int aptNumber = Integer.parseInt(request.getParameter("apt_number"));
        String city = request.getParameter("city");
        String stateProvince = request.getParameter("stateProvince");
        String zip = request.getParameter("zip");

        EmployeeService employeeService = new EmployeeService();
        Employee employee = new Employee(
                worker_ssn,
                manager_ssn,
                firstName,
                middleName,
                lastName,
                streetNumber,
                streetName,
                aptNumber,
                city,
                stateProvince,
                zip
        );

        try {
            employeeService.updateEmployee(employee);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        response.sendRedirect("insertions.jsp");
    }
}
