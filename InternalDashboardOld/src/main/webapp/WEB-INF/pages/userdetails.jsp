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
<link href="resources/css/fontawesome.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" type="text/css"
	href="resources/css/daterangepicker.css" />
<link rel="stylesheet" href="resources/css/style1.css" type="text/css">
<title>User Details</title>
</head>
<body onload="FetchUserDetails">
	<input type="hidden" id="MemberID" value="${member_Id}">
	<input type="hidden" id="email_Id" value="${Uemail}">


	<input type="hidden" value="<%=session.getAttribute("email")%>"
		id="checklogmail">
		<!-- Add Fund Modal Starts -->
<div class="modal fade transferModal" id="addFundBtn" tabindex="-1" role="dialog" aria-labelledby="fundTransferModal" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
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
                    <option class="sgd" value="sgd" style="background-image:url('resources/images/sgdi.png');">SGD</option>
                  </select>
                </div>
                <div class="customslectText">
                  <p>available balance <span id="availabebalnce">S$ <%= session.getAttribute("Singurrency") %></span></p>
                </div>
              </div>
              <div class="height30"></div>
              <div class="height30"></div>
              <input type="button"  onclick="transfertocustomer()"class="blueButton" value="send">
            </div>
          </div>
          <div class="clearfix"></div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Add Fund Modal Ends -->


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
					<!-- User Back Button Starts -->
            	<!--<div class="userBackBtn">
                	<a href="/mminternalcustomer"><img src="resources/images/userbackbtn.png" width="9" height="15" alt="Back" title="Back"/></a> </div>
                 User Back Button Ends -->
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
									class="link">Wallet Info</a></li>
								<li><a href="#tab4" onclick="GetUserTransaction()"
									class="link"> Info</a></li>
								<li><a onclick="FetchUserKYCDetails()" href="#tab5"
									class="link">Kyc Status</a></li>
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
									<!-- User back button start here -->
									<form method="POST" action="/UserList">
										<div class="userBackBtn">
											<button class="btn">Back</button>
										</div>
									</form>
									<!-- User back button end here -->

									<!-- Personal info Form fields Starts -->
									<form action="#" method="post" enctype="multipart/form-data">
										<label>Registration Date</label> <input type="text"
											id="registerDate"> <label>Id:Number</label> <input
											type="text" id="NoId"> <label>Email</label> <input
											type="text" id="email"> <label>Identification:Number</label>
										<input type="text" id="IdNo"> <label>Identification:Type</label>
										<input type="text" id="IdType"> <label>Birthday</label>
										<input type="text" id="dob"> <label>Gender</label> <input
											type="text" id="gender"> <label>Title</label> <input
											type="text" id="title"> <label>First:Name</label> <input
											type="text" id="fname"> <label>Last:Name</label> <input
											type="text" id="lname"> <label>Preferred:Name</label>
										<input type="text" id="pname"> <label>Country_code</label>
										<input type="text" id="Code"> <label>Mobile:Number</label>
										<input type="text" id="MoNo"> <label>Status:Is_Active</label>
										<input type="text" id="status_active"> <label>Status:Text</label>
										<input type="text" id="status_text"> <input
											type="button" class="blueButton" value="Save Changes"
											onclick="updateProfiledetails()">
									</form>
									<!-- Personal info Form fields Ends -->
								</div>
							</div>

							<div class="tabs" id="tab2"></div>
							<h2 class="tabHead">Address Info</h2>
							<div class="tabs" id="tab2">
								<div class="tabAddressInfoCon">
									<!-- Delivery Address Container Starts -->
									<div class="addressInfoCon">
										<a href="#" class="editAddBtn"><img
											src="resources/images/editicon.png" width="20"
											height="20" alt="Edit" title="Edit"></a> <a href="#"
											class="closeEditBtn"><img
											src="resources/images/closeediticon.png" width="17"
											height="19" alt="Close" title="Close"></a>
										<h3>Delivery Address</h3>

										<div class="deliveryAddressDiv">
											<span id="address_1" class="flatno"></span> <span
												id="address_2" class="streetname"></span> <br> <span
												id="usercity" class="city"></span> <span id="userstate"
												class="state"></span> <br> <span id="usercountry"
												class="country"></span> <span id="codecountry"
												class="countrycode"></span> <span id="userpostal_code"
												class="zipcode"></span>
										</div>
										<br>

										<div class="deliveryAddressForm">
											<form>
												<label>Address 1</label> <input type="text" id="Uaddress1"
													onkeypress="return ((event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123) || event.charCode == 8 || event.charCode == 32 || (event.charCode >= 48 && event.charCode <= 57));">
												<label>Address 2</label> <input type="text" id="Uaddress2"
													onkeypress="return ((event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123) || event.charCode == 8 || event.charCode == 32 || (event.charCode >= 48 && event.charCode <= 57));">
												<label>City</label> <input type="text" id="Ucity"
													onkeypress="return ((event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123) || event.charCode == 8 || event.charCode == 32 || (event.charCode >= 48 && event.charCode <= 57));">
												<label>State</label> <input type="text" id="Ustate"
													onkeypress="return ((event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123) || event.charCode == 8 || event.charCode == 32 || (event.charCode >= 48 && event.charCode <= 57));">
												<label>Country</label> <input type="text" id="Ucountry"
													onkeypress="return ((event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123) || event.charCode == 8 || event.charCode == 32 || (event.charCode >= 48 && event.charCode <= 57));">
												<label>Zipcode</label> <input type="text" id="Upostalcode"
													onkeypress="return ((event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123) || event.charCode == 8 || event.charCode == 32 || (event.charCode >= 48 && event.charCode <= 57));">
												<button type="button" onclick="updateAddressdetail()"
													class="blueButton">Save Changes</button>
											</form>
										</div>
									</div>
								</div>
							</div>

							<h2 class="tabHead">Tab 3</h2>
							<div class="tabs" id="tab3"></div>
							<h2 class="tabHead">Wallet info</h2>
							<div class="tabs" id="tab3">
								<div class="tabWalletInfoCon">
									<div class="headingSection">
										<h3>Wallet Balance</h3>
										<p><a href="#" class="blueButton" class="btn btn-primary" data-toggle="modal" data-target="#addFundBtn">Transfer</a></p> 
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
												<tr>
													<td align="center" valign="middle"><img
														src="resources/images/sgd.jpg" width="40" height="40"
														alt="USD" title="USD"></td>
													<td align="left" valign="middle"></td>
													<td align="left" valign="middle"><span
														class="mobTableHeading">balance</span></td>
													<td align="left" valign="middle"><span
														class="mobTableHeading" id="walletcurrency">holding
															balance</span></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<!-- <h2 class="tabHead">Tab 4</h2>
							<div class="tabs" id="tab4">Tab 4</div> -->
							<h2 class="tabHead">Transaction History</h2>
							<div class="tabs" id="tab4">
								<div class="tabTransacHistCon">
									<div class="headingSection">
										<!-- pagination starts -->
											<div class="dateNpagiCon">
											<input type="hidden" value="" id="starting">
											<div class = "paginationCon">
											"Showing Page"
											<span id = "tpvalue">1</span>
											<span onclick="back()" id="back" class="pagiBack" style="display: none;"><img src="resources/images/pagibackbtn.png" width="8" height="14" alt="Prev" title="Prev"></span>
											<span onclick="front()" id="front" class="pagiForw"><img src="resources/images/paginextbtn.png" width="8" height="14" alt="Next" title="Next"></span>
											</div>
											<div class="clearfix"></div>
											</div>



										<!-- Table Section Starts -->
										<div class="tableOuterOverflowHidden">

											<!-- Table Starts -->
											<table class="table table-striped"
												id="transactionHistoryTable" width="1150" border="0"
												align="center" cellpadding="0" cellspacing="0">
												<thead>
													<tr>
														<th align="left" valign="middle">Sln</th>
														<th align="left" valign="middle">Type</th>
														<th align="left" valign="middle">Date</th>
														<th align="left" valign="middle">Amount</th>
														<th align="left" valign="middle">Available Balance</th>
														<th align="left" valign="middle">Currency</th>
														<th align="left" valign="middle">Status</th>
													</tr>
												</thead>
												<tbody id="myTableTransaction">

												</tbody>
											</table>
											<!-- Table Ends -->
										</div>
										<!-- Table Section Ends -->
									</div>
								</div>
							</div>

							<h2 class="tabHead">Kyc status</h2>
							<div class="tabs" id="tab5">
								<div class="tabKycStatusCon">
									<div class="tabKycInfoCon">

										<!-- Kyc Personal Info Div Starts -->
										<form>
											<div id="kycPersonalInfoContainer">
												<div class="form-group">
													<label class="control-label">Member Id</label> <input
														type="text" id="memberId" disabled>
												</div>
												<div class="form-group">
													<label class="control-label">KYC Status</label> <input
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
													<label class="control-label">FourStop Status</label> <input
														type="text" id="fourStopRec" disabled>
												</div>
											</div>
										</form>
										<div id="box">
											<form method="GET" action="/uploadKyc">
												<div class="userBackBtn alignright">
													<button class="blueButton">Complete KYC FourStop</button>
												</div>
											</form>
											<form method="GET" action="/uploaddoc">
												<div class="userBackBtn alignleft">
													<button class="blueButton1">Upload Document to MM</button>
												</div>
											</form>
										</div>

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
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="resources/js/userDetails.js"></script>
	<script src="resources/js/custom.js"></script>
	<script src="resources/js/sweetalert.min.js"></script>
</body>

</html>