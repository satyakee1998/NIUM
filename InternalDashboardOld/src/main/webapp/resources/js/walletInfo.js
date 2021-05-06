function FetchWalletInfo(){
$.ajax({
type :'GET',
url :'/walletInfo',
timeout : 100000,

success : function(data) {

var obj = JSON.parse(data);

var respoObj= obj['responseObject'];
var FundInfo = respoObj['funds'];
var AvalBal= FundInfo['available'];
var HoldingBal = FundInfo['withholding'];


document.getElementById('curType').value = AvalBal['currency'];
document.getElementById('avlBal').value = AvalBal['amount'];
document.getElementById('IdNo').value = HoldingBal['amount'];

}
});
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
			icon: "resources/images/loader.gif",
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

