
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
      <div class="col-xl-12 topBottomPadding"> 
        <!-- Heading Search Section Starts -->
        <div class="headingSection">
          <div class="preFundBackBtn">
     	  	<a href="/mmprefundlist"><img src="resources/images/userbackbtn.png" width="9" height="15" alt="Back" title="Back"></a>
          </div>
          <h1>New prefund request</h1>
          <div class="clearfix"></div>
        </div>
        <!-- Heading Search Section Ends --> 
    <div class="newPrefundReq">
        	<form>
                <div class="newPrefundReqLeft">
                    <h2>Request amount &amp; currency</h2>
                    <div class="convertCurrencyInputSec">
                        <div class="currencyInputSelectHolder">
                            <input type="number" min="0" oninput="validateNumber(this);" id="amount" step="0.01" placeholder="Enter Amount" />
                            <div class="customDropDown"> 
                                 <select name="options" id="currency">
                                    <option class="sgd" value="SGD" style="background-image:url('resources/images/sgdi.png');">SGD</option> 
                                    
                                 </select>
                             </div>  
                              <input  type="hidden" value="" id="accountnum"/>
                        </div>
                        <label>Date of transfer</label>
                    	<input type="date" name="date" id="transferdate">
                    </div>
                </div>
                <div class="newPrefundReqRight">
                    <h2>Optional details</h2>
                    <label>Bank Reference number</label>
                    <input type="text" name="bankRefNum" maxlength="20" id="bankref" onPaste="return false;" onkeypress="return ((event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123) || event.charCode == 8 || event.charCode == 32 || (event.charCode >= 48 && event.charCode <= 57));">
                    <label>Client account number</label>
                    <input type="text" name="clientAccNum" maxlength="20" id="clientacc" onPaste="return false;" onkeypress="return ((event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123) || event.charCode == 8 || event.charCode == 32 || (event.charCode >= 48 && event.charCode <= 57));">
                    <label>Comments</label>
                    <textarea name="comments" maxlength="100" placeholder="Max 100 Character" id="comments" onPaste="return false;" onkeypress="return ((event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123) || event.charCode == 8 || event.charCode == 32 || (event.charCode >= 48 && event.charCode <= 57));"></textarea>
                    <br>
                    <br>
                    <br>
                    <input type="button" onclick="requestprefund()" value="Request" class="blueButton">
                </div>
            </form>
            <div class="clearfix"></div>
        </div>
        <!-- New Prefund Request Ends --> 
    </div>
    
    
    <!------ Right Main Section Ends ------>
    <div class="clearfix"></div>
  </div>
</div>
</div>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script> 
<script src="resources/js/bootstrap-min.js"></script> 
<script src="resources/js/dashboard.js"></script>
<script src="resources/js/session.js"></script>
 <script src="resources/js/sweetalert.min.js"></script>
<script src="resources/js/postfund.js"></script>
<script src="resources/js/jquery-3.5.0.js" ></script>
<script src="resources/js/fundpre.js"></script>
<script src="resources/js/custom.js"></script>

</body>
</html>
