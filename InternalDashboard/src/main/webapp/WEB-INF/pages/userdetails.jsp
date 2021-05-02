<%@page import="com.dashboard.controller.ClientController"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="resources/css/bootstrap-min.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/style1.css" type="text/css">
<title>User Details</title>
</head>
<body onload="FetchUserDetails">
	<input type="hidden" id="MemberID" value="${member_Id}">
	<input type="hidden" id="email_Id" value="${Uemail}">
	<input type="hidden" id="hiddencardid" value=""> 
	<input type="hidden" id="usercardid" value="">
	<input type="hidden" id="activatecard" value=""> 
	<div class="modal fade" id="assignPhysicalCard" tabindex="-1" role="dialog" aria-labelledby="assignPhysicalCard" aria-hidden="true">
<div class="modal-dialog modal-dialog-centered" role="document">
<div class="modal-content">
<div class="modal-header">
<h2 class="modal-title" id="exampleModalLongTitle">Physical Card</h2>
<button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
</div>
<div class="modal-body">
<div class="row">
<div class="col-12">
<div class="card">
<div class="card-body">
<div class="row">
<div class="col-md-6">
<form action="#">
<div class="form-group">
<label >Proxy Number*</label>
<input id= "acc" onKeyPress="return ((event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123) || event.charCode == 8 || event.charCode == 32 || (event.charCode >= 48 && event.charCode <= 57));" type="number" placeholder="" id="accountnumber" class="form-control autonumber" >
</div>
</form>
</div>
<!-- end col -->
</div>
<!-- end row -->

</div>
<!-- end card-body-->
</div>
<!-- end card-->
</div>
<!-- end col -->
</div>
<!-- end row-->

</div>
<div class="modal-footer">
<button type="button" class="btn borderButton" data-dismiss="modal">Close</button>
<button type="button" onClick="assignphysical()" class="btn blueButton">Assign</button>
</div>
</div>
</div>
</div>
	<div class="container-fluid">
		<div class="row">

			<div class="col-xl-2 col-lg-2 col-md-3 col-sm-12 sidenav">
				<div class="logo">
					<a href="#"><img src="resources/images/logo.jpeg" alt="Nisg"
						title="Nisg" width="175" height="150"
						style="border-radius: 15%; width: 100%; height: auto;" /></a>
				</div>
				<button class="dropdown-btn">
					Select Program <i class="fa fa-caret-down"></i>
				</button>
				<div class="dropdown-container">
					<a href="#">NIUM</a> <a href="#">MM</a>
				</div>
				<a href="#client-details">Client Details</a> <a href="#user-details">User
					List</a> <a href="#user-details">User Details</a>
			</div>

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
								<li><a href="#tab2" class="link">Address info</a></li>
								<li><a href="#tab3" onclick="getwalletbalance()" class="link">Wallet info</a></li>
								<li><a href="#tab4" onclick="GetCardsById()" class="link">Card info</a></li>
								<li><a onclick="FetchUserKYCDetails()" href="#tab5"
									class="link">Kyc status</a></li>
							</ul>
						</div>
					</div>
					<!-- Tab Button Section Ends -->

					<!-- Tab Content Section Starts -->
					<div
						class="col-xl-10 col-lg-10 col-md-10 userTabContentSec float-right">
						<div class="tabcon">
							<h2 class="tabHead">Personal info</h2>
							<div class="tabs" id="tab1">
								<div class="tabPersonalInfoCon">
									<!-- User Back Button Starts -->
									<form method="POST" action="/UserList">
										<div class="userBackBtn">
											<button class="btn">Back</button>
										</div>
									</form>
									<!-- User Back Button Ends -->
									<h3>User details</h3>
									<!-- Personal info Form fields Starts -->
									<form action="#" method="post" enctype="multipart/form-data">
										<label>Registration Date</label> <input type="text"
											id="registerDate"> <label>Identification:Number</label>
										<input type="text" id="IdNo"> <label>Identification:Issue</label>
										<input type="text" id="IdIssue"> <label>Identification:Expiry</label>
										<input type="text" id="IdExpiry"> <label>Identification
											Type</label> <input type="text" id="IdType"> <label>Birthday</label>
										<input type="text" id="dob"> <label>Gender</label> <input
											type="text" id="gender"> <label>Title</label> <input
											type="text" id="title"> <label>First Name</label> <input
											type="text" id="fname"> <label>Middle Name</label>
										<input type="text" id="mname"> <label>Last
											Name</label> <input type="text" id="lname"> <label>Preferred
											Name</label> <input type="text" value="" id="pname"> <label>Country
											of Issue</label> <input type="text" id="issueC"> <label>country_code</label>
										<input type="text" id="Code"> <label>Mobile
											Number</label> <input type="text" id="MoNo"> <label>Email</label>
										<input type="text" id="email"> <label>Status:Is_Active</label>
										<input type="text" id="status_active"> <label>Status:Text</label>
										<input type="text" id="status_text">
									</form>
									<!-- Personal info Form fields Ends -->
								</div>
							</div>
					
                    
							<h2 class="tabHead">Wallet information</h2>
							<div class="tabs" id="tab3">
								<div class="tabWalletInfoCon">
									<div class="headingSection">
										<h3>Wallet balance</h3>
										<div class="clearfix"></div>
									</div>
									<div class="walletBalTable">
										<table class="table table-striped" cellpadding="0"
											cellspacing="0" width="100%" border="0" align="center">
											<thead>
												<tr>
													<th>&nbsp;</th>
													<th>Currency</th>
													<th>Balance</th>
													<th>Holding balance</th>
												</tr>
											</thead>
											<tbody id="walletbalancetable">
												<!-- <tr>
													<td align="center" valign="middle"><img src="resources/images/sgd.jpg" width="40" height="40"
														alt="USD" title="USD"></td>
													<td align="left" valign="middle"></td>
													<td align="left" valign="middle"><span
														class="mobTableHeading">balance</span></td>
													<td align="left" valign="middle"><span
														class="mobTableHeading" id="walletcurrency">holding
															balance</span></td>
												</tr> -->
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<!-- Card Info Starts -->
							<h2 class="tabHead">Card Info</h2>
								<div class="tabs" id="tab4">
									<div class="tabCardInfoCon">
										<div class="headingSection">
											<h3>All Cards</h3>
												<p><a href="#" class="blueButton" data-toggle="modal" data-target="#assignPhysicalCard" id="acc">Assign Physical Card</a></p>
													<p><a href="#" class="borderButton" onclick="createcard()" id="addbutton">Add Virtual Card</a></p>
										<!-- User Back Button Starts -->
									<form method="POST" action="/UserList">
										<div class="userBackBtn">
											<button class="btn">Back</button>
										</div>
									</form>
									<!-- User Back Button Ends -->
<div class="clearfix"></div>
</div>
<div class="tableOuterOverflowHidden">
<!-- Table Starts -->
<table class="table table-striped" id="cardInfoTable" border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<thead>
<tr>
<th align="left" valign="middle" id="holderName" >Card Holder Name</th>
<th align="left" valign="middle" id="maskedcard" >Card Number</th>
<th align="left" valign="middle" id="cardName" >Card Name</th>
<!-- <th align="left" valign="middle" id="cardStatus" >Card Status</th> -->
<th align="left" valign="middle" id="createdAt" >Date Created</th>
<th align="left" valign="middle" id="action">Actions</th>

</thead>

<tbody id= "usercardlist">

</tbody>

</table>
<!-- Table Ends -->
</div>
<!-- Table Section Ends -->
</div>
</div>


							<!-- <h2 class="tabHead">Tab 5</h2> -->
							<h2 class="tabHead">Kyc status</h2>
							<div class="tabs" id="tab5">
								<div class="tabKycStatusCon">
									<div class="tabKycInfoCon">
										<h4>Kyc User Details</h4>
										<form>
											<!-- Kyc Personal Info Div Starts -->
											<div id="kycPersonalInfoContainer">
												<div class="form-group">
													<label class="control-label">Member Id</label> <input
														type="text" id="memberId" disabled>
												</div>
												<div class="form-group">
													<label class="control-label">KYC Uploaded</label> <input
														type="text" id="kyc_Uploaded_Flag_Y" disabled>
												</div>
												<div class="form-group">
													<label class="control-label">KYC Not Approved
														Comment</label> <input type="text"
														id="kyc_Not_Approved_Pending_Expired_Fraud_Etc_Comment"
														disabled>
												</div>
												<div class="form-group">
													<label class="control-label">FourStopId</label> <input
														type="text" id="fourStopId" disabled>
												</div>
												<div class="form-group">
													<label class="control-label">FourStopRec</label> <input
														type="text" id="fourStopRec" disabled>
												</div>
											</div>
										</form>



									</div>
								</div>
							</div>
							<!-- Tab Content Section Ends -->
							<div class="clearfix"></div>
						</div>


					</div>

					<div class="clearfix"></div>

				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="resources/js/jquery.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap-min.js"></script>
	<script src="resources/js/dashboard.js"></script>
	<script src="resources/js/jquery-3.5.0.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/userDetails.js"></script>
	<script type="text/javascript" src="resources/js/sweetalert.min.js"></script>
	

	
</body>

</html>