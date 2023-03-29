<%--
  Created by IntelliJ IDEA.
  User: jeyas
  Date: 3/29/2023
  Time: 1:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="com.demo.CustomerService" %>
<%@ page import="com.demo.Customer" %>
<%@ page import="com.demo.Message" %>
<%@ page import="java.util.ArrayList" %>

<%
    // get values from the request
    String ssn = request.getParameter("customer_ssn");

    String firstName = request.getParameter("customer_first_name");
    String middleName = request.getParameter("customer_middle_name");
    String lastName = request.getParameter("customer_last_name");
    int street_number = Integer.valueOf(request.getParameter("customer_street_number"));
    String street_name = request.getParameter("customer_street_name");
    String customer_city = request.getParameter("customer_city");
    String customer_stateProvince = request.getParameter("customer_stateProvince");
    int customer_aptNumber = Integer.valueOf(request.getParameter("customer_aptNumber"));
    String customer_zip = request.getParameter("customer_zip");
    String customer_registration_date = request.getParameter("customer_registration_date");


    CustomerService customerService = new CustomerService();
    // create student object
    Customer customer  = new Customer(ssn,firstName,middleName,lastName,street_number,street_name,customer_city,customer_stateProvince, customer_aptNumber, customer_zip, customer_registration_date);

    Message msg;
    // try to create a new student
    try {
        String value = customerService.createCustomer(customer);
        // if the value contains error/Error then this is an error message
        if (value.contains("Error") || value.contains("error")) msg = new Message("error", value);
            // else the student was successfully created
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