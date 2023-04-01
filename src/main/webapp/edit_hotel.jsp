<%@ page import="com.demo.Hotel" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Edit Hotel</title>
</head>
<body>
<div class="container">
  <h1>Edit Hotel</h1>
  <form action="UpdateHotelServlet" method="POST">
    <% Hotel hotel = (Hotel) request.getAttribute("hotel"); %>
    <label for="hotel_chain">Chain name:</label>
    <input type="text" name="hotel_chain" value="<%= hotel.getChain_name() %>"><br>
    <label for="hotel_street_number">Street Number:</label>
    <input type="number" name="hotel_street_number" value="<%= hotel.getStreet_number() %>"><br>
    <label for="hotel_street_name">Street Name:</label>
    <input type="text" name= "hotel_street_name" value="<%= hotel.getStreet_name() %>"><br>
    <label for="hotel_city">City:</label>
    <input type="text" name="hotel_city" value="<%= hotel.getCity() %>"><br>
    <label for="hotel_state_province">Province/State:</label>
    <input type="text" name="hotel_state_province" value="<%= hotel.getStateProvince() %>"><br>
    <label for="hotel_zip">Zip:</label>
    <input type="text" name="hotel_zip" value="<%= hotel.getZip() %>"><br>
    <label for="hotel_num_of_rooms">Number of Rooms:</label>
    <input type="number" name="hotel_num_of_rooms" value="<%= hotel.getNum_of_rooms() %>"><br>
    <label for="hotel_contact_email">Contact Email:</label>
    <input type="text" name="hotel_contact_email" value="<%= hotel.getContact_email() %>"><br>
    <label for="hotel_category">Category:</label>
    <input type="text" name="hotel_category" value="<%= hotel.getCategory() %>"><br>
    <button type="submit">Update</button>
  </form>
</div>

</body>
</html>
