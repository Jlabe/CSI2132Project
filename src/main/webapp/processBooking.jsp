<%@ page import="com.demo.Customer" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="com.demo.EmployeeService" %>
<%@ page import="com.demo.CustomerService" %>

<%
  String firstName = request.getParameter("first_name");
  String middleName = request.getParameter("middle_name");
  String lastName = request.getParameter("last_name");
  String email = request.getParameter("email");
  String phoneNumber = request.getParameter("phone_number");
  String ssn = request.getParameter("ssn");
  int streetNumber = Integer.parseInt(request.getParameter("street_number"));
  String streetName = request.getParameter("street_name");
  int apartmentNumber = Integer.parseInt(request.getParameter("apartment_number"));
  String customerCity = request.getParameter("city");
  String customerStateProvince = request.getParameter("state_province");
  String customerZip = request.getParameter("zip");

  LocalDate currentDate = LocalDate.now();
  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
  String registrationDate = currentDate.format(formatter);

  Customer customer = new Customer(
          ssn,
          firstName,
          middleName,
          lastName,
          streetNumber,
          streetName,
          customerCity,
          customerStateProvince,
          apartmentNumber,
          customerZip,
          registrationDate
  );

  CustomerService customerService = new CustomerService();
  customerService.createCustomer(customer);
%>
