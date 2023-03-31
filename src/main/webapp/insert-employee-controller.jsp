<%--
  Created by IntelliJ IDEA.
  User: jeyas
  Date: 3/31/2023
  Time: 1:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="com.demo.EmployeeService" %>
<%@ page import="com.demo.Employee" %>
<%@ page import="com.demo.Message" %>
<%@ page import="java.util.ArrayList" %>

<%
    int employee_aptNumber;
    // get values from the request
    String ssn = request.getParameter("employee_ssn");

    String manager_ssn = request.getParameter("manager_ssn");
    String firstName = request.getParameter("employee_first_name");
    String middleName = request.getParameter("employee_middle_name");
    String lastName = request.getParameter("employee_last_name");
    int street_number = Integer.valueOf(request.getParameter("employee_street_number"));
    String street_name = request.getParameter("employee_street_name");
    String employee_city = request.getParameter("employee_city");
    String employee_stateProvince = request.getParameter("employee_stateProvince");
    if(request.getParameter("employee_aptNumber").trim().equals("")){
        employee_aptNumber = -1;
    }
    else{
        employee_aptNumber = Integer.valueOf(request.getParameter("employee_aptNumber"));
    }

    String employee_zip = request.getParameter("employee_zip");

    System.out.println("LOLLLLL! Submit works!");

    EmployeeService employeeService = new EmployeeService();
    // create student object
    Employee employee  = new Employee(ssn,manager_ssn,firstName,middleName,lastName,street_number,street_name,employee_aptNumber, employee_city,employee_stateProvince, employee_zip);

    Message msg;
    // try to create a new student
    try {
        String value = employeeService.createEmployee(employee);
        // if the value contains error/Error then this is an error message
        if (value.contains("Error") || value.contains("error")) msg = new Message("error", value);
            // else the employee was successfully created
        else msg = new Message("success", value);
    } catch (Exception e) {
        e.printStackTrace();
        msg = new Message("error", "Something went wrong!");
    }

    // create an arraylist of messages and append the new message
    ArrayList<Message> messages = new ArrayList<>();
    messages.add(msg);

    // set session attribute named messages to messages value
    session.setAttribute("messages", messages);
    // redirect to index
    response.sendRedirect("index.jsp");
%>
