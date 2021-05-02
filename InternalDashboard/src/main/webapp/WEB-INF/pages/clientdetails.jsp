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
 
</head>
<body>
<div class="sidenav">
   <!-- Menu Section Starts -->
  <section>
  <div class="logo"> <a href="#"><img src="resources/images/logo.jpeg"  alt="Nisg" title="Nisg" width="175" height="150" style="border-radius: 15%;" /></a> </div>
  <button class="dropdown-btn">Select Program 
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="#">NIUM</a>
    <a href="#">MM</a>
  </div>
  <a href="/fetchCustomerDetails">Client Details</a>
  <a href="/mmlogout">Logout</a>  
</div>
</section>

      <div class="main">
<h1>Client details</h1>

<form action="/UserList" method="POST">

  <label for="fname">Client name:</label>
  <input type="text" id="fname" name="fname" value="Stylopay"><br><br>
  <label for="email">EmailID:</label>
  <input type="text" id="email" name="email" value="support@stylopay.com"><br><br>
   <label for="agentcode">Agent Code:</label>
  <input type="text" id="agentcode" name="agentcode" value="Agent_Code"><br><br>
   <label for="subagentcode">Sub Agent Code:</label>
  <input type="text" id="subagentcode" name="subagentcode" value="Sub_Agent_code"><br><br>
  <input type="submit" value="Submit">
</form>
</div>

<script src="resources/js/jquery.js"></script>
<script src="resources/js/dashboard.js"></script>
</body>
</html>
    

