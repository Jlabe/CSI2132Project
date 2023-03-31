<%--
  Created by IntelliJ IDEA.
  User: jeyas
  Date: 3/31/2023
  Time: 1:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="com.demo.RoomService" %>
<%@ page import="com.demo.Room" %>
<%@ page import="com.demo.Message" %>
<%@ page import="java.util.ArrayList" %>

<%
  int room_street_number = Integer.valueOf(request.getParameter("room_street_number"));
  String room_street_name = request.getParameter("room_street_name");
  String room_city = request.getParameter("room_city");
  String room_state_province = request.getParameter("room_state_province");
  String room_zip = request.getParameter("room_zip");
  int room_number = Integer.valueOf(request.getParameter("room_number"));
  double price = Double.valueOf(request.getParameter("room_price"));
  int capacity = Integer.valueOf(request.getParameter("room_capacity"));
  String room_sea_mountain_view = request.getParameter("room_sea_mountain_view");
  String room_problems_damages = request.getParameter("room_problems_damages");
  String check_in_date = request.getParameter("room_check_in_date");
  String check_out_date = request.getParameter("room_check_out_date");

  java.sql.Date check_in_date_date_version = java.sql.Date.valueOf(check_in_date);
  java.sql.Date check_out_date_date_version = java.sql.Date.valueOf(check_in_date);


  System.out.println("LOLLLLL! Submit works!");

  RoomService roomService = new RoomService();
  // create student object
  Room room  = new Room(room_street_number, room_street_name,room_city, room_state_province,room_zip, price,capacity, room_sea_mountain_view, room_problems_damages, check_in_date_date_version, check_out_date_date_version);

  Message msg;
  // try to create a new student
  try {
    String value = roomService.createRoom(room);
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
