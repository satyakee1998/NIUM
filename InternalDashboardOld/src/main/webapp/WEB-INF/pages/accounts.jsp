
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
<title><%= session.getAttribute("DashBoardName") %> Sponsored Accounts</title>
<link rel="apple-touch-icon" sizes="180x180" href="<%= session.getAttribute("Logo") %>">
<link rel="icon" type="image/png" sizes="32x32" href="<%= session.getAttribute("Logo") %>">
<link rel="icon" type="image/png" sizes="16x16" href="<%= session.getAttribute("Logo") %>">
<link rel="manifest" href="resources/favicon_io/site.webmanifest">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="resources/css/bootstrap-min.css" rel="stylesheet" type="text/css">
<link href="resources/css/style1.css" rel="stylesheet" type="text/css">
<link href="resources/css/style.css" rel="stylesheet" type="text/css">

</head>

<body class="newPrefundReqPage" onload="showprefund();">
<input type="hidden" value="<%= session.getAttribute("email") %>" id="checklogmail">       
         
<div class="container-fluid">
  <div class="row"> 
    <!------ Left Menu Section Starts ------>
          <jsp:include page="sidebar.jsp"></jsp:include>
    <!------ Left Menu Section Ends ------> 
    
    <!------ Right Main Section Starts ------>

			<div class="col-xl-10 col-lg-10 col-md-9 col-sm-12 rightMainSection">
				<div class="row">
					<!-- Tab Button Section Starts -->
					<div class="col-xl-2 col-lg-2 col-md-2 userTabBtnSec float-left">
						<div class="userTabBtnSecTop">
							<h1>Account Details</h1>
							<img src="resources/images/logo2.jpeg" width="150" height="150"
								alt="Account Holder" title="Account Holder">
						</div>
						<div class="userTabBtnSecBottom">
							<ul class="tabList">
								<li><a href="#tab1" class="link">Personal info</a></li>
								<li><a href="#tab2" onclick="FetchAddressInfo()"
									class="link">Address Info</a></li>
								<li><a href="#tab3" onclick="FetchWalletInfo()"
									class="link active">Wallet Info</a></li>
								<li><a href="#tab4" onclick="GetUserTransaction()"
									class="link">Transaction Info</a></li>
								<li><a onclick="FetchUserKYCDetails()" href="#tab5"
									class="link">Kyc Status</a></li>
							</ul>
						</div>
					</div>
					<!-- Tab Button Section Ends -->
			<div class="col-xl-10 col-lg-10 col-md-10 userTabContentSec float-right">
    <div class="modal-content">
      <div class="modal-body">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
        <div class="innerTransferModal">
          <div class="transferModalLeft float-left">
            <h2>Transfer fund to </h2>
      
    
            <div class="transferModalNameandImage" id="Fstname" ><img src="resources/images/profileicon-png.png" width="45" height="45" alt="Registered Account"  title="Registered Account"><%= session.getAttribute("firstname") %></div>
            <div class="transferModalFundingChannel">
              <h3>funding channel</h3>
              <select>
                <option>Prefund</option>
             
              </select>
            </div>
          </div>
          <div class="transferModalRight float-right">
            <div class="convertCurrencyInputSec">
              <h3>source currency</h3>
              <div class="currencyInputSelectHolder">
                <input type="number" min="0" id="famount" placeholder="Enter Amount" oninput="validateNumber(this);" />
                <div class="customDropDown">
                  <select name="options">
                    <option class="sgd" value="sgd" style="background-image:url('resources/images/sgdi.png')">SGD</option>
                  </select>
                </div>
                <div class="customslectText">
                  <p>available balance <span id="availabebalnce">S$ <%= session.getAttribute("Singurrency") %></span></p>
                </div>
              </div>
              <div class="height30"></div>
              <div class="height30"></div>
              <button type="button"  onclick="transfertocustomer()"> Send </button>
            </div>
          </div>
          <div class="clearfix"></div>
        </div>
      </div>
</div>			

<script type="text/javascript" src="resources/js/jquery.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap-min.js"></script>
	<script src="resources/js/jquery-3.5.0.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="resources/js/userDetails.js"></script>
	<script src="resources/js/sweetalert.min.js"></script>
	<script src="resources/js/walletInfo.js"></script>

</body>
</html>
