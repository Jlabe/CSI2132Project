<%@ page import="com.demo.Customer" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Edit Customer</title>
</head>
<body>
<div class="container">
  <h1>Edit Customer</h1>
  <form action="UpdateCustomerServlet" method="POST">
      <% Customer customer = (Customer) request.getAttribute("customer"); %>
    <input type="hidden" name="ssn" value="<%= customer.getSSN() %>">
    <label for="first_name">First Name:</label>
    <input type="text" name="first_name" value="<%= customer.getFirst_name() %>"><br>
    <label for="middle_name">Middle Name:</label>
    <input type="text" name="middle_name" value="<%= customer.getMiddle_name() %>"><br>
    <label for="last_name">Last Name:</label>
    <input type="text" name="last_name" value="<%= customer.getLast_name() %>"><br>
    <label for="street_number">Street Number:</label>
    <input type="text" name="street_number" value="<%= customer.getStreet_number() %>"><br>
    <label for="street_name">Street Name:</label>
    <input type="text" name="street_name" value="<%= customer.getStreet_name() %>"><br>
    <label for="apt_number">Apartment Number:</label>
    <input type="number" name="apt_number" value="<%= customer.getApt_number() %>"><br>
    <label for="city">City:</label>
    <input type="text" name="city" value="<%= customer.getCity() %>"><br>
    <label for="stateProvince">State/Province:</label>
    <input type="text" name="stateProvince" value="<%= customer.getStateProvince() %>"><br>
    <label for="zip">Zip:</label>
    <input type="text" name="zip" value="<%= customer.getZip() %>"><br>
    <label for="registration_date">Registration Date:</label>
    <input type="text" name="registration_date" value="<%= customer.getRegistration_date() %>"><br>
    <button type="submit">Update</button>
  </form>
</div>

</body>
</html>