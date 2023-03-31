<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="com.demo.RoomService" %>
<%@ page import="com.demo.Room" %>
<%@ page import="com.demo.Message" %>
<%@ page import="java.util.ArrayList" %>


<!DOCTYPE html>
<html lang="en">

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
<h1>Hotel Management Insertions</h1>
<div class="container">
    <h2>Customer</h2>
    <form id="customer-form" action="insert-customer-controller.jsp" method="POST">
        <label for="customer_ssn">Customer SSN/SIN:</label>
        <input type="text" id="customer_ssn" name="customer_ssn" pattern="^\d{9}$" title="Please enter a 9-digit number" required>
        <label for="customer_first_name">Customer First Name:</label>
        <input type = "text" name = "customer_first_name" id = "customer_first_name" required>
        <label for="customer_middle_name">Customer Middle Name:</label>
        <input type = "text" name = "customer_middle_name" id = "customer_middle_name">
        <label for="customer_last_name">Customer Last Name:</label>
        <input type = "text" name = "customer_last_name" id = "customer_last_name" required>
        <label for="customer_street_number">Customer Street Number:</label>
        <input type = "number" name = "customer_street_number" id = "customer_street_number" required>
        <label for="customer_street_name">Customer Street Name:</label>
        <input type = "text" name = "customer_street_name" id = "customer_street_name" required>
        <label for="customer_city">Customer City:</label>
        <input type = "text" name = "customer_city" id = "customer_city" required>
        <label for="customer_stateProvince">Customer State/Province:</label>
        <input type = "text" name = "customer_stateProvince" id = "customer_stateProvince" required>
        <label for="customer_aptNumber">Customer Apartment Number:</label>
        <input type = "number" name = "customer_aptNumber" id = "customer_aptNumber" >
        <label for="customer_zip">Customer Zip:</label>
        <input type = "text" name = "customer_zip" id = "customer_zip" required>
        <label for="customer_registration_date">Customer Registration Date:</label>
        <input type = "text" name = "customer_registration_date" id = "customer_registration_date" required>
        <button type="submit">Insert Customer</button>

    </form>
</div>

<div class="container">
    <h2>Employee</h2>
    <form id="employee-form" action="insert-employee-controller.jsp" method="POST">
        <label for="employee_ssn">Employee SSN/SIN:</label>
        <input type="text" name="employee_ssn" id="employee_ssn" required>
        <label for="manager_ssn">Manager SSN/SIN:</label>
        <input type = "text" name = "manager_ssn" id = "manager_ssn" required>
        <label for="employee_first_name">Employee First Name:</label>
        <input type = "text" name = "employee_first_name" id = "employee_first_name" required>
        <label for="employee_middle_name">Employee Middle Name:</label>
        <input type = "text" name = "employee_middle_name" id = "employee_middle_name">
        <label for="employee_last_name">Employee Last Name:</label>
        <input type = "text" name = "employee_last_name" id = "employee_last_name" required>
        <label for="employee_street_number">Employee Street Number:</label>
        <input type = "text" name = "employee_street_number" id = "employee_street_number" required>
        <label for="employee_street_name">Employee Street Name:</label>
        <input type = "text" name = "employee_street_name" id = "employee_street_name" required>
        <label for="employee_city">Employee City:</label>
        <input type = "text" name = "employee_city" id = "employee_city" required>
        <label for="employee_stateProvince">Employee State/Province:</label>
        <input type = "text" name = "employee_stateProvince" id = "employee_stateProvince" required>
        <label for="employee_aptNumber">Employee Apartment Number:</label>
        <input type = "text" name = "employee_aptNumber" id = "employee_aptNumber">
        <label for="employee_zip">Employee Zip:</label>
        <input type = "text" name = "employee_zip" id = "employee_zip" required>
        <button type="submit">Insert Employee</button>
    </form>
</div>

<div class="container">
    <h2>Hotel</h2>
    <form id="hotel-form" action="insert-hotel-controller.jsp" method="POST">
        <label for="hotel_street_number">Hotel Street Number: </label>
        <input type="text" name="hotel_street_number" id="hotel_street_number" required>
        <label for="hotel_street_name">Hotel Street Name: </label>
        <input type="text" name="hotel_street_name" id="hotel_street_name" required>
        <label for="hotel_city">Hotel City: </label>
        <input type="text" name="hotel_city" id="hotel_city" required>
        <label for="hotel_state_province">Hotel State/Province: </label>
        <input type="text" name="hotel_state_province" id="hotel_state_province" required>
        <label for="hotel_zip">Hotel Zip: </label>
        <input type="text" name="hotel_zip" id="hotel_zip" required>
        <label for="hotel_num_of_rooms">Hotel Number of Rooms: </label>
        <input type="text" name="hotel_num_of_rooms" id="hotel_num_of_rooms" required>
        <label for="hotel_contact_email">Hotel Contact Email: </label>
        <input type="text" name="hotel_contact_email" id="hotel_contact_email" required>
        <label for="hotel_category">Hotel Category: </label>
        <input type="text" name="hotel_category" id="hotel_category" required>
        <label for="hotel_chain">Hotel Chain: </label>
        <input type="text" name="hotel_chain" id="hotel_chain" required>
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


