//Fetch UserDetails//
window.onload=function FetchUserDetails()
{
var element = document.getElementById("users");
$('users').addClass('active');
element.classList.add("active");
var userid = document.getElementById("memberId").value ;
document.getElementById('lname').value ;
document.getElementById('pname').value ;
document.getElementById('Code').value;
document.getElementById('MoNo').value;
document.getElementById('title').value ;
document.getElementById('dob').value;

swal({
// title: "Loading...",
text: "Please Wait...",
icon: "resources/images/loader.gif",
button: false,
closeOnClickOutside: false,
closeOnEsc: false
});
var userID = document.getElementById('MemberID').value;

$.ajax({
type :'GET',
url :'/userDetails',
data:{newuserID:userID},
timeout : 100000,
success : function(data) {
swal.close()
var obj = JSON.parse(data);
var respoObj= obj['responseObject'];
var dateofRegis = respoObj['date'];
var identity= respoObj['identification'];
var usermobile = respoObj['mobile'];
var username = respoObj['name'];
var userstatus = respoObj['status'];

if(respoObj['birthday'] == null){
document.getElementById('dob').value = "NA" ;
}else{
document.getElementById('dob').value = respoObj['birthday'];
}
if(respoObj['id'] == null){
document.getElementById('NoId').value = "NA" ;
}else{
document.getElementById('NoId').value = respoObj['id'];
}
if(dateofRegis['registration'] == null){
document.getElementById('registerDate').value = "NA" ;
}else{
document.getElementById('registerDate').value = dateofRegis['registration'].substr(0,10) ;
}
if(identity['number'] == null){
document.getElementById('IdNo').value = "NA" ;
}else{
document.getElementById('IdNo').value = identity['number'];
}
if(identity['type'] == null){
document.getElementById('IdType').value = "NA" ;
}else{
document.getElementById('IdType').value =identity['type'];
}
if(respoObj['gender'] == null){
document.getElementById('gender').value = "NA" ;
}else{
document.getElementById('gender').value = respoObj['gender'];
}
if(respoObj['title'] == null){
document.getElementById('title').value = "NA" ;
}else{
document.getElementById('title').value = respoObj['title'];
}
if(username['first'] == null){
document.getElementById('fname').value = "NA";
}
else{
document.getElementById('fname').value = username['first'];
}

if(username['last'] == null){
document.getElementById('lname').value = "NA" ;
}else{
document.getElementById('lname').value = username['last'];
}
if(username['preferred'] == null){
document.getElementById('pname').value = "NA" ;
}else{
document.getElementById('pname').value = username['preferred'];
}

if(usermobile['country_code'] == null){
document.getElementById('Code').value = "NA" ;
}else{
document.getElementById('Code').value = usermobile['country_code'];
}
if(usermobile['number'] == null){
document.getElementById('MoNo').value = "NA" ;
}else{
document.getElementById('MoNo').value = usermobile['number'];
}
if(respoObj['email'] == null){
document.getElementById('email').value = "NA" ;
}else{
document.getElementById('email').value = respoObj['email'];
}
if(userstatus['is_active'] == null){
document.getElementById('status_active').value = "NA" ;
}else{
document.getElementById('status_active').value =userstatus['is_active'];
}
if(userstatus['text'] == null){
document.getElementById('status_text').value = "NA" ;
}else{
document.getElementById('status_text').value =userstatus['text'];
}
}
});
}
//update profile
function updateProfiledetails(){

var fnamee = document.getElementById('fname').value;

if(document.getElementById("fname").value == "")
{
swal(" ", "Please Enter your First Name", "info")
getRecipientEmail.abort();
}
var lnamee = document.getElementById('lname').value ;
var pnamee = document.getElementById('pname').value ;
var customerphonecodee = document.getElementById('Code').value;
var MoNoe = document.getElementById('MoNo').value;
var customertitlee = document.getElementById('title').value ;
var dobe = document.getElementById('dob').value;


swal({
title: "Updating...",
icon: "resources/images/loader.gif",
button: false,
closeOnClickOutside: false,
closeOnEsc: false
});

$.ajax({
type : "POST",
url : "/mmupdateDetail",
data : {firstname:fnamee,title:customertitlee,prefferedname:pnamee,lastname:lnamee,phonecode:customerphonecodee,phone:MoNoe,dob:dobe},
timeout : 100000,
success : function(data) {

swal.close()

var obj = JSON.parse(data);

if(obj['isError'] == true)
{
swal(obj['message']);
return;
}
else{

swal("Success",obj['message'])
.then((value) => {
return FetchUserDetails();
});
}
},

});

}
///fetch User Address
function FetchAddressInfo(){

swal({
// title: "Loading...",
text: "Please Wait...",
icon: "resources/images/loader.gif",
button: false,
closeOnClickOutside: false,
closeOnEsc: false
});
$.ajax({
type :'GET',
url :'/AddressInfo',
timeout : 100000,

     success : function(data) {
     swal.close()
     
       var obj = JSON.parse(data);
         var repo = obj['responseObject'];
		 var repoAdd= repo['data'];
		 var useradd= JSON.parse(repoAdd);
		                         /*for the user address*/
					    	 	document.getElementById("address_1").innerHTML =useradd['address_1'];
						        document.getElementById("address_2").innerHTML =useradd['address_2'];
						        document.getElementById("usercity").innerHTML =useradd['city'];
						        document.getElementById("userstate").innerHTML =useradd['state'];
						         document.getElementById("codecountry").innerHTML =useradd['country_code'];
						        document.getElementById("usercountry").innerHTML =useradd['country'];
							    document.getElementById("userpostal_code").innerHTML =useradd['zipcode'];
							    
							     /*for the update address*/
							    document.getElementById("Uaddress1").value =useradd['address_1'];
						        document.getElementById("Uaddress2").value =useradd['address_2'];
						        document.getElementById("Ucity").value =useradd['city'];
						        document.getElementById("Ustate").value =useradd['state'];
						        document.getElementById("Ucountry").value =useradd['country'];
							    document.getElementById("Upostalcode").value =useradd['zipcode'];
							       
							    }
							    
							    });
							    
							   }
	////update address						   
 function updateAddressdetail(){
	
	
	var address1 = document.getElementById("Uaddress1").value;
		if(document.getElementById("Uaddress1").value == "")
	{ 
			swal(" ", "Please enter user address", "info")
			getRecipientEmail.abort();
	}
	var address2 = document.getElementById("Uaddress2").value;
		if(document.getElementById("Uaddress1").value == "")
	{ 
			swal(" ", "Please enter user address", "info")
			getRecipientEmail.abort();
	}
	var city = document.getElementById("Ucity").value;
		if(document.getElementById("Ucity").value == "")
	{ 
			swal(" ", "Please enter city", "info")
			getRecipientEmail.abort();
	}
	var postalcode = document.getElementById("Upostalcode").value;
		if(document.getElementById("Upostalcode").value == "")
	{ 
			swal(" ", "Please enter postal code", "info")
			getRecipientEmail.abort();
	}
	
		var state = document.getElementById("Ustate").value;
		if(document.getElementById("Ustate").value == "")
	{ 
			swal(" ", "Please enter state", "info")
			getRecipientEmail.abort();
	}
	var country = document.getElementById("Ucountry").value;
		if(document.getElementById("Ucountry").value == "")
	{ 
			swal(" ", "Please enter country", "info")
			getRecipientEmail.abort();
	}
	
	swal({
	    title: "Updating...",
	    icon: "resources/images/loader.gif",
	    button: false,
	    closeOnClickOutside: false,
	    closeOnEsc: false
	  });
	
	$.ajax({
 	     type : "POST",
 	     url : "/mmupdateAddressdetails",
 	    data : {address1:address1, address2:address2, city:city, postalcode:postalcode, state:state, country:country},
 	     timeout : 100000,
 	     success : function(data) {	
 	    	 
 	    	 swal.close()
 	    	var obj = JSON.parse(data);
 	    	
 	    	 if(obj['isError'] == true)
 			 {
 				 swal(obj['message']);
 				 return;
 			 }
 			 else{
 				
 	    	swal("Success",obj['message'])
 	    	.then((value) => {
 	    		return FetchAddressInfo(  );
	    		});
 			 }
 	    	},

 	 });
	
}

							   

//Fetch WalletInfo//
function FetchWalletInfo(){
swal({
// title: "Loading...",
text: "Please Wait...",
icon: "resources/images/loader.gif",
button: false,
closeOnClickOutside: false,
closeOnEsc: false
});

$.ajax({
type :'GET',
url :'/walletInfo',
timeout : 100000,

success : function(data) {
swal.close()

var obj = JSON.parse(data);

var respObj = obj['responseObject'];

var funds = respObj['funds'];

var holding = funds['withholding'];
var SGD = "S$" ; /*SGD Dollar;*/

var available = funds['available'];
$('#walletbalancetable').empty()
var table = $('#walletbalancetable');

var tab='<tr><td align="center" valign="middle"> <img src=resources/images/sgd.jpg width=40 height=40> </td><td align="left" valign="middle" id="walletcurrency" value="'+holding['currency']+'" >'+holding['currency']+"\n"+'</td><td align="left" valign="middle">'
+SGD+" "+available['amount']+"\n"+'</td><td align="left" valign="middle" >'+SGD+" "+holding['amount']+"\n"+'</td></tr><tr><td height="10"></td></tr>';

$('#walletbalancetable').append(tab)
}

});
}
/*get wallet transaction history*/

function GetUserTransaction( )
{
var news = "1" ;

document.getElementById("starting").value = "1" ;
document.getElementById("tpvalue").innerHTML = 1 ;
document.getElementById("back").style.display="none";

swal({
// title: "Loading...",
text: "Please Wait...",
icon: "resources/images/loader.gif",
button: false,
closeOnClickOutside: false,
closeOnEsc: false
});

var table = $('#myTableTransaction');
$('#myTableTransaction').empty()
$.ajax({
type :'GET',
url :'/mmgetusertransaction',
data : {pagenum:news},
timeout : 100000,
success : function(data) {
swal.close()

var obj = JSON.parse(data);

var respoObj= obj['responseObject'];
var trans = respoObj['transactions'];

$('#myTableTransaction').empty() //clear the table
for(var x=0; x<trans.length; x++)
{
var val =trans[x];

var details =obj['details'];

/*clear the table*/

if (val['status'] == 'Success' ) {
var str =val['date'].toString();
var tab='<tr><td align="left" valign="middle">'+(x+1)+"\n"+'</td><td id="indicator'+x+'" value="'+val['indicator']+'" align="left" valign="middle">'+val['indicator']+"\n"+'</td><td align="left" valign="middle">'
+str.substr(0,str.length-15)+"\n"+'</td><td align="left" valign="middle">'
+val['amount']+"\n"+'</td><td align="left" valign="middle">'
+val['balance']+"\n"+'</td><td align="left" valign="middle">'
+val['currency']+"\n"+'</td><td align="left" valign="middle"><span class="greenText">'
+val['status']+"\n"+'</span></td></tr>';
}

else {
var str = val['date'].toString();
var tab='<tr><td align="left" valign="middle">'+(x+1)+"\n"+'</td><td id="indicator'+x+'" value="'+val['indicator']+'" align="left" valign="middle">'+val['indicator']+"\n"+'</td><td align="left" valign="middle">'
+str.substr(0,str.length-15)+"\n"+'</td><td align="left" valign="middle">'
+val['amount']+"\n"+'</td><td align="left" valign="middle">'
+val['balance']+"\n"+'</td><td align="left" valign="middle">'
+val['currency']+"\n"+'</td><td align="left" valign="middle"><span class="redText">'
+val['status']+"\n"+'</span></td></tr>'
}


$('#myTableTransaction').append(tab)
}
}
});
}

function front( )

{

var starting = document.getElementById("starting").value ;
var start = parseInt(starting) ;
var news = start + 1;

document.getElementById("starting").value = news ;
document.getElementById("tpvalue").innerHTML = news ;
if (news <= 1 ){
document.getElementById("back").style.display="none";
}
else {
document.getElementById("back").style.display="inline-block";
}

swal({
title: "Loading...",
text: "Please wait",
icon: "resources/images/loader.gif",
button: false,
closeOnClickOutside: false,
closeOnEsc: false
});

var table = $('#myTableTransaction');
$('#myTableTransaction').empty()
$.ajax({

type : "GET",
url : "/mmgetusertransaction",
data : {pagenum:news},
timeout : 100000,

success : function(data) {

swal.close()
var obj = JSON.parse(data);

var respoObj = obj['responseObject'];
if(respoObj['transactions'] == "") {


swal("No Transaction Found!", {
buttons: "Back",
icon: "info",

});
$('#myTableTransaction').empty() //clear the table
getwallettransaction.abort();

}

// var respoObj = obj['responseObject'];

if(respoObj['code']== 503)
{
swal(respoObj['description'])
}
else{

var trans = respoObj['transactions'];
$('#myTableTransaction').empty() //clear the table
for(var x=0; x<trans.length; x++)
{
var val =trans[x];

var details =obj['details'];

/*clear the table*/

if (val['status'] == 'Success' ) {
var str = val['date'].toString();

var tab='<tr><td align="left" valign="middle">'+(x+1)+"\n"+'</td><td id="indicator'+x+'" value="'+val['indicator']+'" align="left" valign="middle">'+val['indicator']+"\n"+'</td><td align="left" valign="middle">'
+str.substr(0,str.length-15)+"\n"+'</td><td align="left" valign="middle">'
+val['amount']+"\n"+'</td><td align="left" valign="middle">'
+val['balance']+"\n"+'</td><td align="left" valign="middle">'
+val['currency']+"\n"+'</td><td align="left" valign="middle"><span class="greenText">'
+val['status']+"\n"+'</span></td></tr>';
}

else {
var str = val['date'].toString();
var tab='<tr><td align="left" valign="middle">'+(x+1)+"\n"+'</td><td id="indicator'+x+'" value="'+val['indicator']+'" align="left" valign="middle">'+val['indicator']+"\n"+'</td><td align="left" valign="middle">'
+str.substr(0,str.length-15)+"\n"+'</td><td align="left" valign="middle">'
+val['amount']+"\n"+'</td><td align="left" valign="middle">'
+val['balance']+"\n"+'</td><td align="left" valign="middle">'
+val['currency']+"\n"+'</td><td align="left" valign="middle"><span class="redText">'
+val['status']+"\n"+'</span></td></tr>'
}


$('#myTableTransaction').append(tab)
}

}
}

}



);


}

function back( )

{
var starting = document.getElementById("starting").value ;
var start = parseInt(starting) ;
var news = start - 1;

document.getElementById("starting").value = news ;
document.getElementById("tpvalue").innerHTML = news ;
if (news <= 1 ){
document.getElementById("back").style.display="none";
}
else {
document.getElementById("back").style.display="inline-block";
}
swal({
title: "Loading...",
text: "Please wait",
icon: "resources/images/loader.gif",
button: false,
closeOnClickOutside: false,
closeOnEsc: false
});

var table = $('#myTableTransaction');
$('#myTableTransaction').empty()
$.ajax({

type : "GET",
url : "/mmgetusertransaction",
data : {pagenum:news},
timeout : 100000,

success : function(data) {

swal.close()
var obj = JSON.parse(data);

var respoObj = obj['responseObject'];
if(respoObj['transactions'] == '{}') {


swal("No Transaction Found!", {
buttons: "Back",
icon: "info",

});
getwallettransaction.abort();

}

if(respoObj['code']== 503)
{
swal(respoObj['description'])
}
else{

var trans = respoObj['transactions'];
for(var x=0; x<trans.length; x++)
{
var val =trans[x];

var details =obj['details'];

/*clear the table*/

if (val['status'] == 'Success' ) {
var str = val['date'].toString();

var tab='<tr><td align="left" valign="middle">'+(x+1)+"\n"+'</td><td id="indicator'+x+'" value="'+val['indicator']+'" align="left" valign="middle">'+val['indicator']+"\n"+'</td><td align="left" valign="middle">'
+str.substr(0,str.length-15)+"\n"+'</td><td align="left" valign="middle">'
+val['amount']+"\n"+'</td><td align="left" valign="middle">'
+val['balance']+"\n"+'</td><td align="left" valign="middle">'
+val['currency']+"\n"+'</td><td align="left" valign="middle"><span class="greenText">'
+val['status']+"\n"+'</span></td></tr>';
}

else {
var str = val['date'].toString();
var tab1='<tr><td align="left" valign="middle">'+(x+1)+"\n"+'</td><td id="indicator'+x+'" value="'+val['indicator']+'" align="left" valign="middle">'+val['indicator']+"\n"+'</td><td align="left" valign="middle">'
+str.substr(0,str.length-15)+"\n"+'</td><td align="left" valign="middle">'
+val['amount']+"\n"+'</td><td align="left" valign="middle">'
+val['balance']+"\n"+'</td><td align="left" valign="middle">'
+val['currency']+"\n"+'</td><td align="left" valign="middle"><span class="redText">'
+val['status']+"\n"+'</span></td></tr>'
}


$('#myTableTransaction').append(tab)
}

}
}

}



);

}


//transfer to customer
function transfertocustomer( ){
	
	var tempamount= document.getElementById("famount").value ;
      
	if ( document.getElementById("famount").value == "")
  { 
	  swal("Please enter Amount")
	  transfertocustomer.abort();
  }	
		
		swal({
		 
			text: "Loading...",
			icon: "resources/loader.gif",
			button: false,
			closeOnClickOutside: false,
			closeOnEsc: false
		  });
											  
											  $.ajax({
													 type : "POST",
													 url : "/mmtransfertowall",
													 data : {amount:tempamount},
														  timeout : 100000,
													 success : function(data) {	
														 
													
														swal.close()
														
														
														
														 var obj = JSON.parse(data);	
													
														var msg = obj['description'];
														if (obj['id'] != null){
															
																 swal("Sucessful","Transferred Successfully")
							  	    		.then((value) => {
							  	    			location.reload();
						
						});
														}
														
														
														else if(obj['code'] == 400) {
															swal("Failed","Lifetime count limit reached")
															.then((value) => {
																location.reload();	
														
														});
															
														}
														
														else if(obj['isError'] == true){
															swal("Failed","Transferred Failed")
															.then((value) => {
																location.reload();
														
														});
															
														}
														
														
															}
														 
													 });								
													
												}





/////Fetch kyc details
function FetchUserKYCDetails()
{
swal({
// title: "Loading...",
text: "Please Wait...",
icon: "resources/images/loader.gif",
button: false,
closeOnClickOutside: false,
closeOnEsc: false
});

var userID = document.getElementById('MemberID').value;

$.ajax({
type :'POST',
url :'/mmgetgetcustomerkyc',
data:{memberId:userID},
timeout : 100000,

success : function(data) {
swal.close()

var obj = JSON.parse(data);

document.getElementById('memberId').value= obj['memberId'];
document.getElementById('kyc_Not_Approved_Pending_Expired_Fraud_Etc_Comment').value= obj['kyc_Not_Approved_Pending_Expired_Fraud_Etc_Comment'];
document.getElementById('fourStopRec').value= obj['fourStopRec'];
document.getElementById('kyc_Uploaded_Flag_Y').value= obj['kyc_Uploaded_Flag_Y'];
document.getElementById('fourStopId').value=obj[`fourStopId`]
if(obj[`fourStopId`] == null){
document.getElementById('fourStopId').value = "NA" ;
}else{
document.getElementById('fourStopId').value = obj[`fourStopId`] ;
}

if(obj[`fourStopRec`] == null){
document.getElementById('fourStopRec').value = "NA" ;
}else{
document.getElementById('fourStopRec').value = obj[`fourStopRec`] ;
}


if(obj[`kyc_Not_Approved_Pending_Expired_Fraud_Etc_Comment`] == null){
document.getElementById('kyc_Not_Approved_Pending_Expired_Fraud_Etc_Comment').value = "NA" ;
}else{
document.getElementById('kyc_Not_Approved_Pending_Expired_Fraud_Etc_Comment').value = obj[`kyc_Not_Approved_Pending_Expired_Fraud_Etc_Comment`] ;
}

if(obj[`kyc_Uploaded_Flag_Y`] == null){
document.getElementById('kyc_Uploaded_Flag_Y').value = " Kyc Not Uploaded" ;
}else{
document.getElementById('kyc_Uploaded_Flag_Y').value = "Kyc Uploaded" ;
}


}
});
}
