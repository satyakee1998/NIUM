
<%@page import="com.dashboard.controller.ClientController"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>





<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html>
<head>
<title>User Lists</title>
<link rel="apple-touch-icon" sizes="180x180" href="https://upload.wikimedia.org/wikipedia/en/thumb/d/d3/Starbucks_Corporation_Logo_2011.svg/1200px-Starbucks_Corporation_Logo_2011.svg.png">
<link rel="icon" type="image/png" sizes="32x32" href="https://upload.wikimedia.org/wikipedia/en/thumb/d/d3/Starbucks_Corporation_Logo_2011.svg/1200px-Starbucks_Corporation_Logo_2011.svg.png">
<link rel="icon" type="image/png" sizes="16x16" href="https://upload.wikimedia.org/wikipedia/en/thumb/d/d3/Starbucks_Corporation_Logo_2011.svg/1200px-Starbucks_Corporation_Logo_2011.svg.png">
<link rel="manifest" href="resources/nisg/favicon_io/site.webmanifest">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="resources/css/bootstrap-min.css" rel="stylesheet" type="text/css">
<link href="resources/css/fontawesome.css" rel="stylesheet" type="text/css">
<link href="resources/css/style1.css" rel="stylesheet" type="text/css">
<link href="resources/css/style.css" rel="stylesheet" type="text/css">

</head>

<body class="dashboardPage" onload="NiumFetchUserList();">
<!-- <div class="container-fluid"> -->
  <div class="row"> 
    <!------ Left Menu Section Starts ------>
     <jsp:include page="sidebar.jsp"></jsp:include>
    <!------ Left Menu Section Ends ------> 
   
    <!------ Right Main Section Starts ------>
    <div class="col-xl-10 col-lg-10 col-md-9 col-sm-12 rightMainSection">
    <h1 style="text-align: center;">USER LIST</h1>
    <br>
    <br>


<div class="container">
<table class="tablemanager">
<thead>
<tr>
<th>Serial No:</th>
<th id="userId">Member ID</th>
<th>First Name</th>
<th>Middle Name</th>
<th>Last Name</th>
<th>Email</th>
<th>More</th>
</tr>
</thead>
<tbody id="body"></tbody>
</table>
      
    </div>
    <!------ Right Main Section Ends ------>
    <div class="clearfix"></div>
    
  </div>
</div>
<script src="resources/js/jquery.js"></script> 
<script src="resources/js/sweetalert.min.js"></script>
<script src="resources/js/dashboard.js"></script>
<script src="resources/js/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="resources/js/nisglist.js"></script>
<script src="resources/js/tablemanager.js"></script>
</body>
</html>