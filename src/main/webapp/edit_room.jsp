<%@ page import="com.demo.Room" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Edit Room</title>
</head>
<body>
<div class="container">
  <h1>Edit Room</h1>
  <form action="UpdateRoomServlet" method="POST">
    <% Room room = (Room) request.getAttribute("room"); %>
    <input type="number" name="street_number" value="<%= room.getStreet_number() %>">
    <label for="street_number">Street Number:</label>
    <input type="text" name="street_name" value="<%= room.getStreet_name() %>">
    <label for="street_name">Street Name:</label>
    <input type="text" name="city" value="<%= room.getCity() %>">
    <label for="city">City:</label>
    <input type="text" name="state_province" value="<%= room.getStateProvince() %>">
    <label for="state_province">State/Province:</label>
    <input type="text" name="zip" value="<%= room.getZip() %>">
    <label for="zip">Zip:</label>
    <input type="number" name="room_number" value="<%= room.getRoom_number() %>">
    <label for="price">Price:</label>
    <input type="number" name="price" value="<%= room.getPrice() %>" required><br>
    <label for="capacity">Capacity:</label>
    <input type="number" name="capacity" value="<%= room.getCapacity() %>" required><br>
    <label for="sea_mount_view">Sea/Mountain View:</label>
    <input type="text" name="sea_mount_view" value="<%= room.getSeaMountainView() %>" required><br>
    <label for="problems_damages">Problems/Damages:</label>
    <input type="text" name="problems_damages" value="<%= room.getProblemsDamages() %>" required><br>
    <label for="check_in_date">Check In Date:</label>
    <input type="date" name="check_in_date" value="<%= room.getCheck_in_date() %>" required><br>
    <label for="check_out_date">Check Out Date:</label>
    <input type="date" name="check_out_date" value="<%= room.getCheck_out_date() %>" required><br>
    <button type="submit">Update</button>
  </form>
</div>
</body>
</html>
