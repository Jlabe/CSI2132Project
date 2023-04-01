<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.demo.*" %>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="navbar.jsp" />

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Management</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
            max-width: 900px;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }
        .table-responsive {
            max-height: 400px; /* Adjust the max-height according to your preference */
            overflow-y: auto;
        }
    </style>
</head>

<body>

<%
    ArrayList<Message> messages;

    if ((ArrayList<Message>) session.getAttribute("messages") == null) messages = new ArrayList<>();
    else messages = (ArrayList<Message>) session.getAttribute("messages");

    String msgField = "";
    for (Message m : messages) {
        msgField += "{\"type\":\"" + m.type + "\",\"value\":\"" + m.value.replaceAll("['\"]+", "") + "\"},";
    }

    session.setAttribute("messages", new ArrayList<Message>());

    RoomService roomService = new RoomService();
    List<Room> rooms = null;
    try {
        rooms = roomService.getRooms();
    } catch (Exception e) {
        e.printStackTrace();
    }

    HotelService hotelService = new HotelService();
    List<Hotel> hotels = null;
    try {
        hotels = hotelService.getHotels();
    } catch (Exception e) {
        e.printStackTrace();
    }

    CustomerService customerService = new CustomerService();
    List<Customer> customers = null;
    try {
        customers = customerService.getCustomer();
    } catch (Exception e) {
        e.printStackTrace();
    }

    EmployeeService employeeService = new EmployeeService();
    List<Employee> employees = null;
    try {
        employees = employeeService.getEmployee();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

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
    <!-- Add table to display Room data -->
    <% if (customers.size() == 0) { %>
    <h1 style="margin-top: 5rem;">No Rooms found!</h1>
    <% } else { %>
    <div class="table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th></th>
                <th></th>
                <th>SSN</th>
                <th>First Name</th>
                <th>Middle Name</th>
                <th>Last Name</th>
                <th>Street Number</th>
                <th>Street Name</th>
                <th>Apartment Number</th>
                <th>City</th>
                <th>State/Province</th>
                <th>Zip</th>
                <th>Registration Date</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (Customer customer : customers) { %>
            <tr>
                <td>
                    <form action="DeleteCustomerServlet" method="POST">
                        <input type="hidden" name="ssn" value="<%= customer.getSSN() %>">
                        <button type="submit" class="btn btn-danger">DELETE</button>
                    </form>
                </td>
                <td><form action="EditCustomerServlet" method="POST">
                    <input type="hidden" name="ssn" value="<%= customer.getSSN() %>">
                    <button type="submit" class="btn btn-primary">EDIT</button>
                </form></td>
                <td><%= customer.getSSN() %></td>
                <td><%= customer.getFirst_name() %></td>
                <td><%= customer.getMiddle_name() %></td>
                <td><%= customer.getLast_name() %></td>
                <td><%= customer.getStreet_number() %></td>
                <td><%= customer.getStreet_name() %></td>
                <td><%= customer.getCity() %></td>
                <td><%= customer.getStateProvince() %></td>
                <td><%= customer.getZip() %></td>
                <td><%= customer.getRegistration_date() %></td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
    <% } %>
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
    <!-- Add table to display Room data -->
    <% if (employees.size() == 0) { %>
    <h1 style="margin-top: 5rem;">No Rooms found!</h1>
    <% } else { %>
    <div class="table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th></th>
                <th></th>
                <th>Worker SSN</th>
                <th>Manager SSN</th>
                <th>First Name</th>
                <th>Middle Name</th>
                <th>Last Name</th>
                <th>Street Number</th>
                <th>Street Name</th>
                <th>Apartment Number</th>
                <th>City</th>
                <th>State/Province</th>
                <th>Zip</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (Employee employee : employees) { %>
            <tr>
                <td>
                    <form action="DeleteEmployeeServlet" method="POST">
                        <input type="hidden" name="worker_ssn" value="<%= employee.getWorker_ssn() %>">
                        <button type="submit" class="btn btn-danger">DELETE</button>
                    </form>
                </td>
                <td><form action="EditEmployeeServlet" method="POST">
                    <input type="hidden" name="worker_ssn" value="<%= employee.getWorker_ssn() %>">
                    <button type="submit" class="btn btn-primary">EDIT</button>
                </form></td>
                <td><%= employee.getWorker_ssn() %></td>
                <td><%= employee.getManager_ssn() %></td>
                <td><%= employee.getFirst_name() %></td>
                <td><%= employee.getMiddle_name() %></td>
                <td><%= employee.getLast_name() %></td>
                <td><%= employee.getStreet_number() %></td>
                <td><%= employee.getStreet_name() %></td>
                <td><%= employee.getCity() %></td>
                <td><%= employee.getStateProvince() %></td>
                <td><%= employee.getZip() %></td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
    <% } %>
</div>

<div class="container">
    <h2>Hotel</h2>
    <form id="hotel-form" action="InsertHotelServlet" method="POST">
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
    <!-- Add table to display Room data -->
    <% if (hotels.size() == 0) { %>
    <h1 style="margin-top: 5rem;">No Rooms found!</h1>
    <% } else { %>
    <div class="table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th></th>
                <th></th>
                <th>Street Number</th>
                <th>Street Name</th>
                <th>City</th>
                <th>State/Province</th>
                <th>Zip</th>
                <th>Number Of Rooms</th>
                <th>Contact Email</th>
                <th>Category</th>
                <th>Chain Name</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (Hotel hotel : hotels) { %>
            <tr>
                <td>
                    <form action="DeleteHotelServlet" method="POST">
                        <input type="hidden" name="street_number" value="<%= hotel.getStreet_number() %>">
                        <input type="hidden" name="street_name" value="<%= hotel.getStreet_name() %>">
                        <input type="hidden" name="city" value="<%= hotel.getCity() %>">
                        <input type="hidden" name="state_province" value="<%= hotel.getStateProvince() %>">
                        <input type="hidden" name="zip" value="<%= hotel.getZip() %>">
                        <input type="hidden" name="chain_name" value="<%= hotel.getChain_name() %>">
                        <button type="submit" class="btn btn-danger">DELETE</button>
                    </form>
                </td>
                <td><a href="">EDIT</a></td>
                <td><%= hotel.getStreet_number() %></td>
                <td><%= hotel.getStreet_name() %></td>
                <td><%= hotel.getCity() %></td>
                <td><%= hotel.getStateProvince() %></td>
                <td><%= hotel.getZip() %></td>
                <td><%= hotel.getNum_of_rooms() %></td>
                <td><%= hotel.getContact_email() %></td>
                <td><%= hotel.getCategory() %></td>
                <td><%= hotel.getChain_name() %></td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
    <% } %>
</div>

<div class="container">
    <h2>Room</h2>
    <form id="room-form" action="InsertRoomServlet" method="POST">
        <label for="room_street_number">Room Street Number:</label>
        <input type="number" name="room_street_number" id="room_street_number" required>
        <label for="room_street_name">Room Street Name: </label>
        <input type="text" name="room_street_name" id="room_street_name" required>
        <label for="room_city">Room City: </label>
        <input type="text" name="room_city" id="room_city" required>
        <label for="room_state_province">Room State/Province: </label>
        <input type="text" name="room_state_province" id="room_state_province" required>
        <label for="room_zip">Room Zip: </label>
        <input type="text" name="room_zip" id="room_zip" required>
        <label for="room_number">Room Number: </label>
        <input type="number" name="room_number" id="room_number" required>
        <label for="room_price">Room Price: </label>
        <input type="number" name="room_price" id="room_price" required>
        <label for="room_capacity">Room Capacity: </label>
        <input type="number" name="room_capacity" id="room_capacity" required>
        <label for="room_sea_mountain_view">Room Sea/Mountain View: </label>
        <input type="text" name="room_sea_mountain_view" id="room_sea_mountain_view" required>
        <label for = "room_problems_damages"> Problems and Damages: </label>
        <input type="text" name="room_problems_damages" id="room_problems_damages" required>
        <label for = "room_check_in_date"> Check in date: </label>
        <input type="text" name="room_check_in_date" id= "room_check_in_date" required>
        <label for = "room_check_out_date"> Check out date: </label>
        <input type="text" name="room_check_out_date" id= "room_check_out_date" required>
        <button type="submit">Save</button>
    </form>
</div>

<div class="container">
    <!-- Add table to display Room data -->
    <% if (rooms.size() == 0) { %>
    <h1 style="margin-top: 5rem;">No Rooms found!</h1>
    <% } else { %>
    <div class="table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th></th>
                <th></th>
                <th>Street Number</th>
                <th>Street Name</th>
                <th>City</th>
                <th>State/Province</th>
                <th>Zip</th>
                <th>Room Number</th>
                <th>Price</th>
                <th>Capacity</th>
                <th>Sea/Mountainview</th>
                <th>Problems/Damages</th>
                <th>Check In Date</th>
                <th>Check Out Date</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (Room room : rooms) { %>
            <tr>
                <td><form action="DeleteRoomServlet" method="POST">
                    <input type="hidden" name="street_number" value="<%= room.getStreet_number() %>">
                    <input type="hidden" name="street_name" value="<%= room.getStreet_name() %>">
                    <input type="hidden" name="city" value="<%= room.getCity() %>">
                    <input type="hidden" name="state_province" value="<%= room.getStateProvince() %>">
                    <input type="hidden" name="zip" value="<%= room.getZip() %>">
                    <input type="hidden" name="room_number" value="<%= room.getRoom_number() %>">
                    <button type="submit" class="btn btn-danger">DELETE</button>
                </form>
                </td>
                <td>
                <td>
                    <form action="EditRoomServlet" method="POST">
                        <input type="hidden" name="street_number" value="<%= room.getStreet_number() %>">
                        <input type="hidden" name="street_name" value="<%= room.getStreet_name() %>">
                        <input type="hidden" name="city" value="<%= room.getCity() %>">
                        <input type="hidden" name="state_province" value="<%= room.getStateProvince() %>">
                        <input type="hidden" name="zip" value="<%= room.getZip() %>">
                        <input type="hidden" name="room_number" value="<%= room.getRoom_number() %>">
                        <button type="submit" class="btn btn-primary">EDIT</button>
                    </form>
                </td>
                </td>
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
            </tbody>
        </table>
    </div>
    <% } %>
</div>


</body>
</html>