<%--
  Created by IntelliJ IDEA.
  User: jeyas
  Date: 3/31/2023
  Time: 1:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="com.demo.HotelService" %>
<%@ page import="com.demo.Hotel" %>
<%@ page import="com.demo.Message" %>
<%@ page import="java.util.ArrayList" %>

<%
  // get values from the request
  int hotel_street_number = Integer.valueOf(request.getParameter("hotel_street_number"));
  String hotel_street_name = request.getParameter("hotel_street_name");
  String hotel_city = request.getParameter("hotel_city");
  String hotel_state_province = request.getParameter("hotel_state_province");
  String  hotel_zip = request.getParameter("hotel_zip");
  int hotel_num_of_rooms = Integer.valueOf(request.getParameter("hotel_num_of_rooms"));
  String hotel_contact_email = request.getParameter("hotel_contact_email");
  String hotel_category = request.getParameter("hotel_category");
  String hotel_chain = request.getParameter("hotel_chain");

  System.out.println("LOLLLLL! Submit works!");

  HotelService hotelService = new HotelService();
  // create student object
  Hotel hotel  = new Hotel(hotel_chain,hotel_street_number, hotel_street_name,hotel_city, hotel_state_province, hotel_zip, hotel_num_of_rooms, hotel_contact_email, hotel_category);

  Message msg;
  // try to create a new hotel
  try {
    String value = hotelService.createHotel(hotel);
    // if the value contains error/Error then this is an error message
    if (value.contains("Error") || value.contains("error")) msg = new Message("error", value);
      // else the hotel was successfully created
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
  response.sendRedirect("employeeEntry.jsp");
%>
