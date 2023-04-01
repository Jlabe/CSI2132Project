<%@ page import="java.util.ArrayList" %>
<%@ page import="com.demo.Room" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<!-- Include navbar.jsp -->
<jsp:include page="navbar.jsp" />

<%
    com.demo.RoomService roomService = new com.demo.RoomService();
    com.demo.FindRoom roomSearch = new com.demo.FindRoom();
    java.util.List<com.demo.Room> rooms = null;
    try {
        rooms = roomService.getRooms();
    } catch (Exception e) {
        throw new RuntimeException(e);
    }

    ArrayList<String> formData = (ArrayList<String>) request.getSession().getAttribute("formData");

    List<Room> roomsThatFitTheSearchCriteria = new ArrayList<>();

    if (formData == null) {
        roomsThatFitTheSearchCriteria = rooms;
    } else {
        try {
            roomsThatFitTheSearchCriteria = roomSearch.getRoomFromSearch(formData);
            System.out.println(roomsThatFitTheSearchCriteria);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        request.getSession().removeAttribute("formData");
    }
    System.out.println(formData);

%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Room Booking</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        form {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }
        h1 {
            text-align: center;
            margin-bottom: 30px;
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
        }
        p {
            text-align: center;
            margin-bottom: 30px;
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
            border: 1px solid #ccc
        }

        button {
            display: inline-block;
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            margin-top: 10px;
            text-transform: uppercase;
        }
        button:hover {
            background-color: #0056b3;
        }

        .table-container {
            max-height: 400px; /* Adjust this value to set the desired height of the container */
            overflow-y: auto;
            border: 1px solid #ccc;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<h1>Find a Room</h1>
<p>
    To use this tool, enter the values in the following form that
    fit the criteria of the room you are searching for and press search.
</p>
<form action="searchRooms" method="POST">
    <label for="start_date">Start Date:</label>
    <input type="date" name="start_date" id="start_date" required>

    <label for="end_date">End Date:</label>
    <input type="date" name="end_date" id="end_date" required>

    <label for="room_capacity">Room Capacity:</label>
    <input type="number" name="room_capacity" id="room_capacity" min="1" required>

    <label for="area">Area:</label>
    <input type="text" name="area" id="area" required>

    <label for="hotel_chain">Hotel Chain:</label>
    <input type="text" name="hotel_chain" id="hotel_chain" required>

    <label for="hotel_category">Hotel Category:</label>
    <select name="hotel_category" id="hotel_category" required>
        <option value="">Choose a category</option>
        <option value="1">Budget</option>
        <option value="2">Mid-range</option>
        <option value="3">Luxury</option>
    </select>

    <label for="total_rooms">Total Rooms in Hotel:</label>
    <input type="number" name="total_rooms" id="total_rooms" min="1" required>

    <label for="room_price">Room Price (max):</label>
    <input type="number" name="room_price" id="room_price" min="0" required>
    <button type="submit">Search</button>
</form>
<h2>Available Rooms</h2>

<% if (formData != null) { %>
<div style="max-width: 800px; margin: 0 auto;">
    <p>
        <strong>With the following criteria:</strong><br>
        Start Date: <%= formData.get(0) %><br>
        End Date: <%= formData.get(1) %><br>
        Room Capacity: <%= formData.get(2) %><br>
        Area: <%= formData.get(3) %><br>
        Hotel Chain: <%= formData.get(4) %><br>
        Hotel Category: <%= formData.get(5) %><br>
        Total Rooms in Hotel: <%= formData.get(6) %><br>
        Room Price: <%= formData.get(7) %>
    </p>
</div>
<% } %>

<div style="max-width: 800px; margin: 0 auto;">

    <% if (roomsThatFitTheSearchCriteria.isEmpty()) { %>
    <p>There are no available rooms that fit this criteria.</p>
    <% } else { %>
    <div class="table-container">
        <table border="1" cellpadding="10" cellspacing="0" style="width: 100%;">
            <tr>
                <th></th>
                <th>Street Number</th>
                <th>Street Name</th>
                <th>City</th>
                <th>State/Province</th>
                <th>Zip</th>
                <th>Room Number</th>
                <th>Price</th>
                <th>Capacity</th>
                <th>Sea/Mountain View</th>
                <th>Problems/Damage</th>
                <th>Check In Date</th>
                <th>Check Out Date</th>
            </tr>
            <% for (com.demo.Room room : roomsThatFitTheSearchCriteria) { %>
            <tr>
                <td><a href="booking.jsp?street_number=<%= room.getStreet_number() %>&street_name=<%= room.getStreet_name() %>&city=<%= room.getCity() %>&stateProvince=<%= room.getStateProvince() %>&zip=<%= room.getZip() %>&room_number=<%= room.getRoom_number() %>&check_in_date=<%= room.getCheck_in_date() %>&check_out_date=<%= room.getCheck_out_date() %>">Book Room</a></td>
                <td><%= room.getStreet_number() %></td>
                <td><%= room.getStreet_name() %></td>
                <td><%= room.getCity() %></td>
                <td><%= room.getStateProvince() %></td>
                <td><%= room.getZip() %></td>
                <td><%= room.getRoom_number() %></td>
                <td><%= room.getPrice() %></td>
                <td><%= room.getCapacity() %></td>
                <td><%= room.getSeaMountainView() %></td>
                <td><%= room.getProblemsDamages() %></td>
                <td><%= room.getCheck_in_date() %></td>
                <td><%= room.getCheck_out_date() %></td>
            </tr>
            <% } %>


        </table>
    </div>
    <% } %>

</div>


</div>
</body>
</html>
