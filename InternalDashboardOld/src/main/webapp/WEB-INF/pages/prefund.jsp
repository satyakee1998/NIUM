
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
<title>PreFund</title>
<link rel="apple-touch-icon" sizes="180x180" href="https://upload.wikimedia.org/wikipedia/en/thumb/d/d3/Starbucks_Corporation_Logo_2011.svg/1200px-Starbucks_Corporation_Logo_2011.svg.png">

<link rel="icon" type="image/png" sizes="16x16" href="https://upload.wikimedia.org/wikipedia/en/thumb/d/d3/Starbucks_Corporation_Logo_2011.svg/1200px-Starbucks_Corporation_Logo_2011.svg.png">
<link rel="manifest" href="resources/nisg/favicon_io/site.webmanifest">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="resources/css/bootstrap-min.css" rel="stylesheet" type="text/css">
<link href="resources/css/fontawesome.css" rel="stylesheet" type="text/css">
<link href="resources/css/style1.css" rel="stylesheet" type="text/css">
<link href="resources/css/style.css" rel="stylesheet" type="text/css">

</head>

<body class="dashboardPage" onload="showprefund();">
<!-- <div class="container-fluid"> -->
  <div class="row"> 
        <!------ Left Menu Section Starts ------>
    <div class="col-xl-2 col-lg-2 col-md-3 col-sm-12 leftMenuSection"> 
      <!-- Logo Section Starts -->
      <section class="logo"> <a href="#"><img src="resources/images/logo.jpeg"  alt="Nisg" title="Nisg" width="226" height="182" /></a> </section>
      <!-- Logo Section Ends --> 
      
      <!-- Menu Section Starts -->
      <section class="navigationMenu"> 
        <!-- Mobile Menu icon Starts -->
        <div class="mobileMenuIcon"> <a href="#"><img src="resources/nisg/images/hammenuicon.png" alt="Navigation" title="Navigation" width="40" height="24"></a> </div>
        <!-- Mobile Menu icon Ends -->
        <div class="navCustomWrapper"> <span class="mobmenuclose"><img src="resources/nisg/images/mob-menucloseicon.png" width="225" height="225" alt="Close" title="close" /></span>
          <ul class="navCustom">
            <li id="home"><a href="dashboard.html"><em class="fa fa-bank"></em> Dashboard</a></li>
            
            <li id="users"><a href="/fetchCustomerDetails"><em class="fa fa-user"></em> Client Details</a></li>
            
            <li class="prefund active"><a href="#"><em class="fa fa-money"></em> Prefund</a></li>
            
           <li id="logout"><a href="/logout"><em class="fa fa-sign-out"></em> Logout</a></li>
          </ul>
        </div>
      </section>
      <!-- Menu Section Ends --> 
    </div>
    <!------ Left Menu Section Ends ------> 
    
    <!------ Right Main Section Starts ------>
    <div class="col-xl-10 col-lg-10 col-md-9 col-sm-12 rightMainSection">
    
    <br>
    <br>


<div class="container">
 <div class="headingSection">
          <h1>Prefund requests</h1>
<a href="/mmprefundrequest" class="blueButn">create new request</a>
          <div>
          </div>
          <div class="clearfix"></div>
        </div>
<table class="tablemanager" id="prefundTable" border="0" width="100%" align="center" cellpadding="0" cellspacing="0">
                	<thead>
                    	<tr>
                        	<th align="left" valign="middle">&nbsp;</th>
                     <th align="left" valign="middle">Amount</th>
                            <th align="left" valign="middle">Request ID</th>
                            <th align="left" valign="middle">Bank reference number</th>
                            <th align="left" valign="middle">Date of request</th>
                            <th align="left" valign="middle">Status</th>
                            <th align="left" valign="middle">Comments</th>
                        </tr>
                    </thead>
                	<tbody id="body">
                        
                    </tbody>
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
<script src="resources/js/fundpre.js"></script>
<script src="resources/js/tablemanager.js"></script>
</body>
</html>