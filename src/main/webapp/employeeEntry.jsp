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
        List<RoomBooking> roomBookingList = new ArrayList<>();

        roomBookingList = roomBookingService.getRoomBookings();

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
                    <input type="hidden" name="check_in_date" value="<%= roomBooking.getCheck_in_date() %>">
                    <input type="hidden" name="check_out_date" value="<%= roomBooking.getCheck_out_date() %>">
                    <input type="hidden" name="ssn" value="<%= roomBooking.getSsn() %>">
                    <button type="submit" class="edit-button">Edit</button>
                </form>

            </li>
            <% } %>
        </ul>
    </div>

    <div class="right">
        <h2>Rent a Room</h2>
        <form id="rent-room-form">
            <label for="customer_name">Customer Name:</label>
            <input type="text" name="customer_name" id="customer_name" required>

            <!-- Add other fields for user information -->

            <label for="payment">Payment:</label>
            <input type="number" name="payment" id="payment" required>

            <button type="submit">Rent Room</button>
        </form>
    </div>
</div>
</body>
</html>