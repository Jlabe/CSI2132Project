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
</head>
<body>
<h1>Employee entry</h1>

<div class="container">
    <div class="left">
        <h2>Bookings</h2>
        <ul class="booking-list">
            <!-- Replace these static booking items with dynamic content fetched from your server -->
            <li class="booking-item">
                Booking 1
                <button>Edit</button>
            </li>
            <li class="booking-item">
                Booking 2
                <button>Edit</button>
            </li>
            <li class="booking-item">
                Booking 3
                <button>Edit</button>
            </li>
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
