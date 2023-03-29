<%@ page import="com.demo.Room" %>
<%@ page import="com.demo.RoomService" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Room Booking</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 0 auto;
            padding: 1rem;
        }

        h1, h2 {
            color: #333;
        }

        .room-info, .booking-form {
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            padding: 1rem;
            margin-bottom: 1rem;
            border-radius: 4px;
        }

        form {
            display: grid;
            gap: 1rem;
        }

        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<jsp:include page="navbar.jsp" />
    <%
    String street_number = request.getParameter("street_number");
    String street_name = request.getParameter("street_name");
    String city = request.getParameter("city");
    String stateProvince = request.getParameter("stateProvince");
    String zip = request.getParameter("zip");
    String room_number = request.getParameter("room_number");

    com.demo.RoomService roomService = new com.demo.RoomService();
    com.demo.Room room = null;
    try {
        room = roomService.getRoomByUniqueIdentifiers(street_number, street_name, city, stateProvince, zip, room_number);
    } catch (Exception e) {
        throw new RuntimeException(e);
    }
%>
<h1>Book Room <%= room.getRoom_number() %></h1>

<!-- Room Information Section -->
<div class="room-info">
    <h2>Room Information</h2>
    <p>Room Number: <%= room.getRoom_number() %></p>
    <p>Price: <%= room.getPrice() %></p>
    <p>Capacity: <%= room.getCapacity() %></p>
    <%--<p>View: <%= room.getView() %></p>--%>
    <%--<p>Extendables: <%= room.getExtendables() %></p>--%>
</div>

<!-- Booking Form -->
<div class="booking-form">
    <h2>Booking Information</h2>
    <form action="processBooking.jsp" method="post">
        <%--<input type="hidden" name="room_id" value="<%= room.getId() %>" />--%>
        <label for="first_name">First Name:</label>
        <input type="text" id="first_name" name="first_name" required>
        <label for="last_name">Last Name:</label>
        <input type="text" id="last_name" name="last_name" required>
        <label for="email">Email Address:</label>
        <input type="email" id="email" name="email" required>
        <label for="phone_number">Phone Number:</label>
        <input type="tel" id="phone_number" name="phone_number" required>
            <label for="ssn">Social Security Number:</label>
            <input type="text" id="ssn" name="ssn" required>
            <input type="submit" value="Book Room">
    </form>

</div>
</body>
</html>