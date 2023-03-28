<!DOCTYPE html>
<html lang="en">
<!-- Include navbar.jsp -->
<jsp:include page="navbar.jsp" />

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Management</title>
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
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }
        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }
        input[type="text"], input[type="number"], input[type="date"], select
        {
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
        form {
            margin-bottom: 30px;
        }
    </style>

</head>
<body>
<h1>Hotel Management</h1>
<div class="container">
    <h2>Customer</h2>
    <form id="customer-form">
        <label for="customer_name">Customer Name:</label>
        <input type="text" name="customer_name" id="customer_name" required>

        <!-- Add other customer-related fields here -->

        <button type="submit">Save</button>
    </form>
</div>

<div class="container">
    <h2>Employee</h2>
    <form id="employee-form">
        <label for="employee_name">Employee Name:</label>
        <input type="text" name="employee_name" id="employee_name"required>
        <!-- Add other employee-related fields here -->

        <button type="submit">Save</button>
    </form>
</div>

<div class="container">
    <h2>Hotel</h2>
    <form id="hotel-form">
        <label for="hotel_name">Hotel Name:</label>
        <input type="text" name="hotel_name" id="hotel_name" required>

        <!-- Add other hotel-related fields here -->

        <button type="submit">Save</button>
    </form>
</div>

<div class="container">
    <h2>Room</h2>
    <form id="room-form">
        <label for="room_number">Room Number:</label>
        <input type="number" name="room_number" id="room_number" required>

        <!-- Add other room-related fields here -->

        <button type="submit">Save</button>
    </form>
</div>

<script>
    // Add JavaScript code to handle form submission, delete and update operations.
    // You may use AJAX to interact with the server and update the page without refreshing.
</script>
</body>
</html>


