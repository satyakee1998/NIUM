 <!-- Logo Section Starts -->
 <section class="logo"> <a href="#"><img src="<%= session.getAttribute("Logo") %>"  alt="MM" title="MM" width="226" height="182" /></a> </section>
  <!-- Logo Section Ends -->
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
  <a href="/userlist">User List</a>
  <a href="#user-details">User Details</a>
  <a href="/mmlogout">Logout</a>  
</div>
</section>