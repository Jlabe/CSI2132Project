<%@ page import="com.demo.Customer" %>
<%@ page import="com.demo.Employee" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Edit Employee</title>
</head>
<body>
<div class="container">
  <h1>Edit Employee</h1>
  <form action="UpdateEmployeeServlet" method="POST">
    <% Employee employee = (Employee) request.getAttribute("employee"); %>
    <label for="worker_ssn">Worker SSN:</label>
    <input type="text" name="worker_ssn" value="<%= employee.getWorker_ssn() %>">
    <label for="manager_ssn">Manager SSN:</label>
    <input type="text" name="manager_ssn" value="<%= employee.getManager_ssn() %>">
    <label for="first_name">First Name:</label>
    <input type="text" name="first_name" value="<%= employee.getFirst_name() %>"><br>
    <label for="middle_name">Middle Name:</label>
    <input type="text" name="middle_name" value="<%= employee.getMiddle_name() %>"><br>
    <label for="last_name">Last Name:</label>
    <input type="text" name="last_name" value="<%= employee.getLast_name() %>"><br>
    <label for="street_number">Street Number:</label>
    <input type="number" name="street_number" value="<%= employee.getStreet_number() %>"><br>
    <label for="street_name">Street Name:</label>
    <input type="text" name="street_name" value="<%= employee.getStreet_name() %>"><br>
    <label for="apt_number">Apartment Number:</label>
    <input type="number" name="apt_number" value="<%= employee.getApt_number() %>"><br>
    <label for="city">City:</label>
    <input type="text" name="city" value="<%= employee.getCity() %>"><br>
    <label for="stateProvince">State/Province:</label>
    <input type="text" name="stateProvince" value="<%= employee.getStateProvince() %>"><br>
    <label for="zip">Zip:</label>
    <input type="text" name="zip" value="<%= employee.getZip() %>"><br>
    <button type="submit">Update</button>
  </form>
</div>

</body>
</html>