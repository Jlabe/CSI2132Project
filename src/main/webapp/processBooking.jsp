<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="com.demo.*" %>
<%@ page import="java.sql.Date" %>

<%
  String firstName = request.getParameter("first_name");
  System.out.println(firstName);
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

  //TODO convert into sql date
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


  int streetNumberRoom = Integer.parseInt(request.getParameter("hidden_street_number"));
  String streetNameRoom = request.getParameter("hidden_street_name");
  String cityRoom = request.getParameter("hidden_city");
  String stateProvinceRoom = request.getParameter("hidden_stateProvince");
  String zipRoom = request.getParameter("hidden_zip");
  int roomNumber = Integer.parseInt(request.getParameter("hidden_room_number"));
  String start_date = request.getParameter("hidden_start_date");
  String end_date = request.getParameter("hidden_end_date");

  LocalDate startDateLocal = LocalDate.parse(start_date);
  LocalDate endDateLocal = LocalDate.parse(end_date);

  Date startDateSql = Date.valueOf(startDateLocal);
  Date endDateSql = Date.valueOf(endDateLocal);
  Date currentDateSql = Date.valueOf(LocalDate.now());

  RoomBooking roomBooking = new RoomBooking(
          streetNumberRoom,
          streetNameRoom,
          cityRoom,
          stateProvinceRoom,
          zipRoom,
          roomNumber,
          currentDateSql,
          startDateSql,
          endDateSql,
          ssn
  );

  RoomBookingService roomBookingService = new RoomBookingService();
  roomBookingService.createRoomBooking(roomBooking);
%>
