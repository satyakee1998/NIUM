<!DOCTYPE>
<html>
<head>
<title>Internal Dashboard</title>
<link rel="apple-touch-icon" sizes="180x180" href="https://upload.wikimedia.org/wikipedia/en/thumb/d/d3/Starbucks_Corporation_Logo_2011.svg/1200px-Starbucks_Corporation_Logo_2011.svg.png">
<link rel="icon" type="image/png" sizes="32x32" href="https://upload.wikimedia.org/wikipedia/en/thumb/d/d3/Starbucks_Corporation_Logo_2011.svg/1200px-Starbucks_Corporation_Logo_2011.svg.png">
<link rel="icon" type="image/png" sizes="16x16" href="https://upload.wikimedia.org/wikipedia/en/thumb/d/d3/Starbucks_Corporation_Logo_2011.svg/1200px-Starbucks_Corporation_Logo_2011.svg.png">
<link rel="manifest" href="resources/nisg/favicon_io/site.webmanifest">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="resources/css/bootstrap-min.css" rel="stylesheet" type="text/css">
<link href="resources/css/fontawesome.css" rel="stylesheet" type="text/css">
<link href="resources/css/style1.css" rel="stylesheet" type="text/css">
</head>

<body class="dashboardPage" onload="getprefundbalance();">
<div class="container-fluid">
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
            <li class="dashboard active"><a href="dashboard.html"><em class="fa fa-bank"></em> Dashboard</a></li>
            
            <li class="users"><a href="/fetchCustomerDetails"><em class="fa fa-user"></em> Client Details</a></li>
            
            <li class="prefund"><a href="prefund.html"><em class="fa fa-money"></em> Prefund</a></li>
            
            
            <li class="logout"><a href="/logout"><em class="fa fa-sign-out"></em> Logout</a></li>
          </ul>
        </div>
      </section>
      <!-- Menu Section Ends --> 
    </div>
    <!------ Left Menu Section Ends ------> 
    
    <!------ Right Main Section Starts ------>
    <div class="col-xl-10 col-lg-10 col-md-9 col-sm-12 rightMainSection">
              	<div class="col-xl-10 dashboardContent">
            	<h1>Welcome</h1>
                <div class="dashBoxHolder">
                	<!-- Your Balance Section Starts -->
                	<div class="col-xl-7 col-lg-7 col-md-7 float-left whBox dashBalance">
                    	<h2>Prefund Balance</h2>
                        <ul>
                        	<li>
                            	<p class="balIconSec"><img src="resources/images/sgdi.png" alt="MM" title="MM" width="40" height="40"/></p>
                            	<p class="balCnameSec">SGD</p>
                                <input type="text" class="dashBalAmount"  id="sgd" readonly>
                                <p class="clearfix"></p>
                            </li>
                        </ul>
                    </div>
                    <!-- Your Balance Section Ends -->
                    
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
    <!------ Right Main Section Ends ------>
    <div class="clearfix"></div>
    
  </div>

<script src="resources/js/jquery.js"></script> 
<script src="resources/js/jquery-3.5.0.js"></script>
<script src="resources/js/bootstrap-min.js"></script> 
<script src="resources/js/dashboard.js"></script>
<script src="resources/js/getprefundbalance.js"></script>
<script src="resources/js/sweetalert.min.js"></script>
</body>
</html>