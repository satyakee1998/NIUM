<!DOCTYPE>
<html>
<head>
<title>Client Details</title>
<link rel="apple-touch-icon" sizes="180x180" href="https://upload.wikimedia.org/wikipedia/en/thumb/d/d3/Starbucks_Corporation_Logo_2011.svg/1200px-Starbucks_Corporation_Logo_2011.svg.png">
<link rel="icon" type="image/png" sizes="32x32" href="https://upload.wikimedia.org/wikipedia/en/thumb/d/d3/Starbucks_Corporation_Logo_2011.svg/1200px-Starbucks_Corporation_Logo_2011.svg.png">
<link rel="icon" type="image/png" sizes="16x16" href="https://upload.wikimedia.org/wikipedia/en/thumb/d/d3/Starbucks_Corporation_Logo_2011.svg/1200px-Starbucks_Corporation_Logo_2011.svg.png">
<link rel="manifest" href="resources/nisg/favicon_io/site.webmanifest">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="resources/css/bootstrap-min.css" rel="stylesheet" type="text/css">
<link href="resources/css/fontawesome.css" rel="stylesheet" type="text/css">
<link href="resources/css/style1.css" rel="stylesheet" type="text/css">
</head>

<body class="dashboardPage">
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
            <li class="dashboard"><a href="dashboard.html"><em class="fa fa-bank"></em> Dashboard</a></li>
            
            <li class="users active"><a href="/fetchCustomerDetails"><em class="fa fa-user"></em> Client Details</a></li>
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
    
    <h1>Client Details</h1>
    <br>
    <br>
      <!-- <form action="/UserList" method="POST">

  <label for="fname">Client name:</label>
  <input type="text" id="fname" name="fname" value="Stylopay"><br><br>
  <label for="email">EmailID:</label>
  <input type="text" id="email" name="email" value="support@stylopay.com"><br><br>
   <label for="agentcode">Agent Code:</label>
  <input type="text" id="agentcode" name="agentcode" value="Agent_Code"><br><br>
   <label for="subagentcode">Sub Agent Code:</label>
  <input type="text" id="subagentcode" name="subagentcode" value="Sub_Agent_code"><br><br>
  <input type="submit" value="MM">
 
  
</form> -->
<a href="/mmuserlist" class="blueButn">MM</a>
 <a href="/nisguserlist" class="blueButn">NIUM</a>
    </div>
    <!------ Right Main Section Ends ------>
    <div class="clearfix"></div>
    
  </div>
</div>
<script src="resources/js/jquery.js"></script> 
<script src="resources/js/bootstrap-min.js"></script> 
<script src="resources/js/dashboard.js"></script>
</body>
</html>