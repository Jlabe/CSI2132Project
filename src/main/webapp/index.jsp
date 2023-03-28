<!DOCTYPE html>
<html lang="en">
<!-- Include navbar.jsp -->
<jsp:include page="navbar.jsp" />
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
    </style>
</head>
<body>
<h1>Find a Room</h1>
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
        <option value="1">1 Star</option>
        <option value="2">2 Stars</option>
        <option value="3">3 Stars</option>
        <option value="4">4 Stars</option>
        <option value="5">5 Stars</option>
    </select>

    <label for="total_rooms">Total Rooms in Hotel:</label>
    <input type="number" name="total_rooms" id="total_rooms" min="1" required>

    <label for="room_price">Room Price (max):</label>
    <input type="number" name="room_price" id="room_price" min="0" required>
    <button type="submit">Search</button>
</form>
</body>
</html>
