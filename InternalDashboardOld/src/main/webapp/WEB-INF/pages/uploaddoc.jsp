
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
<title>Upload Document To MM</title>
<link rel="apple-touch-icon" sizes="180x180" href="<%= session.getAttribute("Logo") %>">
<link rel="icon" type="image/png" sizes="32x32" href="<%= session.getAttribute("Logo") %>">
<link rel="icon" type="image/png" sizes="16x16" href="<%= session.getAttribute("Logo") %>">
<link rel="manifest" href="resources/favicon_io/site.webmanifest">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="resources/css/bootstrap-min.css" rel="stylesheet" type="text/css">
<link href="resources/css/style1.css" rel="stylesheet" type="text/css">

</head>

<body >
<input type="hidden" value="<%= session.getAttribute("email") %>" id="checklogmail">
<div class="container-fluid">
  <div class="row"> 
    <!------ Left Menu Section Starts ------>
    <jsp:include page="sidebar.jsp"></jsp:include>
         
    <!------ Left Menu Section Ends ------> 
    
    <!------ Right Main Section Starts ------>
    <div class="col-xl-10 col-lg-10 col-md-9 col-sm-12 rightMainSection">
      <!-- Add Customer Page Starts -->
      <div class="col-xl-9 addCustSection">
      	 <div class="headingSection">
            <form method="POST" action="/UserList">
										<div class="userBackBtn">
                                           <button class="btns">Back</button>
                                        </div>
                                        </form>
         	<h1>Upload  documents</h1>
            <div class="clearfix"></div>
           
         </div>
 									
         
         
         <form method="POST" action="/mmUploadDocs" id="msform" modelAttribute="fileupload" enctype="multipart/form-data">
         	
           
           
                 <!-- Kyc POA Div Starts -->
                                    <div id="kycPoaInfoContainer">
                     
                                         <div class="form-group">
                                            <label class="control-label">Upload document* [2MB Max] [pdf/jpg/png accepted]</label>
                                            <input type="file" name="files" onchange="Filevalidationz()" accept="image/*,.pdf" id="uploadDocument" required class="form-control">
                                        </div>
                                        
                                    </div>
                                    <!-- Kyc POA Info Div Ends -->
                  
               <button type="submit" class="blueButton">Submit</button>
            	
            
         </form>
      </div>
      <!-- Add Customer Page Ends -->
    </div>
    <!------ Right Main Section Ends ------>
    <div class="clearfix"></div>
      </div>
</div>
<script src="resources/js/jquery.js"></script> 
<script src="resources/js/bootstrap-min.js"></script> 
<script src="resources/js/dashboard.js"></script>
 <script src="resources/js/sweetalert.min.js"></script>
 <script src="resources/js/session.js"></script>
  <script src="resources/js/copyAddress.js"></script>
</body>
</html>