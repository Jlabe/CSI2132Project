<%@ page import="java.util.List" %>
<%@ page import="com.demo.RoomBooking" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.demo.RoomRentingService" %>
<%@ page import="com.demo.RoomRenting" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="navbar.jsp" />
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Update</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            margin-bottom: 30px;
        }
        .container {
            display: flex;
            justify-content: space-between;
            max-width: 1200px;
            margin: 50px auto;
            padding: 30px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }
        .left, .right {
            width: 48%;
        }
        .booking-list {
            list-style-type: none;
            padding: 0;
        }
        .booking-item {
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            background-color: #f5f5f5;
        }
        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }
        input[type="text"], input[type="number"], input[type="date"], select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            display: inline-block;
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            margin-top: 15px;
            text-transform: uppercase;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>

    <%
        com.demo.RoomBookingService roomBookingService = new com.demo.RoomBookingService();
        com.demo.RoomService roomService = new com.demo.RoomService();
        List<RoomBooking> roomBookingList = new ArrayList<>();

        roomBookingList = roomBookingService.getRoomBookings();

        //TODO Add a search for rooms functions

    %>

</head>
<body>
<h1>Employee entry</h1>

<div class="container">
    <div class="left">
        <h2>Bookings</h2>
        <ul class="booking-list">
            <% for (RoomBooking roomBooking : roomBookingList) { %>
            <li class="booking-item">
                <%= roomBooking.getStreet_name() %>,
                <%= roomBooking.getCity() %>,
                <%= roomBooking.getState_province() %>,
                <%= roomBooking.getZip() %>,
                Room: <%= roomBooking.getRoom_number() %>,
                Check-in: <%= roomBooking.getCheck_in_date() %>,
                Check-out: <%= roomBooking.getCheck_out_date() %>
                <form method="POST" action="RentingServlet" class="renting-form">
                    <input type="hidden" name="street_number" value="<%= roomBooking.getStreet_number() %>">
                    <input type="hidden" name="street_name" value="<%= roomBooking.getStreet_name() %>">
                    <input type="hidden" name="city" value="<%= roomBooking.getCity() %>">
                    <input type="hidden" name="state_province" value="<%= roomBooking.getState_province() %>">
                    <input type="hidden" name="zip" value="<%= roomBooking.getZip() %>">
                    <input type="hidden" name="room_number" value="<%= roomBooking.getRoom_number() %>">
                    <input type="hidden" name="booking_date" value="<%= roomBooking.getBooking_date() %>">
                    <input type="hidden" name="check_in_date" value="<%= roomBooking.getCheck_in_date() %>">
                    <input type="hidden" name="check_out_date" value="<%= roomBooking.getCheck_out_date() %>">
                    <input type="hidden" name="ssn" value="<%= roomBooking.getSsn() %>">
                    <label for="worker_ssn">Worker SSN:</label>
                    <input type="text" name="worker_ssn">
                    <button type="submit" class="edit-button">Convert to Renting</button>
                </form>

            </li>
            <% } %>
        </ul>
    </div>

    <div class="right">
        <h2>Rent a Room</h2>
        <form method="POST" action="RentingServlet" id="rent-room-form">
            <label for="street_number">Street Number:</label>
            <input type="number" name="street_number" id="street_number" required>
            <label for="street_name">Street Name:</label>
            <input type="text" name="street_name" id="street_name" required>
            <label for="city">City:</label>
            <input type="text" name="city" id="city" required>
            <label for="state_province">State/Province:</label>
            <input type="text" name="state_province" id="state_province" required>
            <label for="zip">Zip:</label>
            <input type="text" name="zip" id="zip" required>
            <label for="room_number">Room Number:</label>
            <input type="number" name="room_number" id="room_number" required>
            <label for="check_in_date">Check In Date:</label>
            <input type="date" name="check_in_date" id="check_in_date" required>
            <label for="check_out_date">Check Out Date:</label>
            <input type="date" name="check_out_date" id="check_out_date" required>
            <label for="worker_ssn">Worker SSN:</label>
            <input type="text" name="worker_ssn" id="worker_ssn" required>
            <label for="ssn">Customer SSN:</label>
            <input type="text" name="ssn" id="ssn" required>
            <button type="submit">Rent Room</button>
        </form>
    </div>
</div>
</body>
</html>