<%@page import="com.dashboard.controller.ClientController"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/sidebar.css" type="text/css">
<link href="resources/css/dashboard.css" rel="stylesheet" type="text/css">
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="sidenav">
 <!-- Logo Section Starts -->
<%--  <section class="logo"> <a href="#"><img src="<%= session.getAttribute("Logo") %>"  alt="MM" width="226" height="182" /></a> </section> --%>
  <!-- Logo Section Ends -->
   <!-- Menu Section Starts -->
  <section>
  <div class="logo"> <a href="#"><img src="resources/images/NIUM.png"  alt="Nisg" title="Nisg" width="175" height="150" style="border-radius: 15%;" /></a> </div>
  <button class="dropdown-btn">Select Program 
    <i class="fa fa-caret-down"></i>
  </button>
  <!-- <div class="dropdown-container">
    <a href="#">NIUM</a>
    <a href="#">MM</a>
  </div> -->
  <a href="/fetchCustomerDetails">Client Details</a>
  <a href="/mmlogout">Logout</a>  
</div>
</section>

      <div class="main">
<h1>USER LIST</h1>

<body onload="FetchUserList();">
<div class="container">
<table class="tablemanager">
<thead>
<tr>
<th>Serial No:</th>
<th id="userId">Customer Hash ID</th>
<th>First Name</th>
<th>Middle Name</th>
<th>Last Name</th>
<th>Email</th>
<th>Phone Number</th>
<th>More</th>
</tr>
</thead>
<tbody id="body"></tbody>
</table>
</div>
</div>
<script src="resources/js/jquery.js"></script>
<script src="resources/js/dashboard.js"></script>
<script src="resources/js/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/sweetalert.min.js"></script>
<script src="resources/js/list.js"></script>
<script src="resources/js/tablemanager.js"></script>

</body>
</html>
    

