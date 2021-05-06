

 function requestprefund( ){
		
	
								
	var tempbankref=  document.getElementById("bankref").value;
		var tempclientacc = document.getElementById("clientacc").value;
		var tempcomments=document.getElementById("comments").value ;
		var tempcurrency= document.getElementById("currency").value;
		var date= document.getElementById("transferdate").value;
		var tempaccountnum= document.getElementById("accountnum").value;
		var temprqid= "";
		var tempamount=  document.getElementById("amount").value;
		
		
		
		 var tempdate=new Date().toISOString().slice(0,10);
		 
		 if(document.getElementById("amount").value == "")
			{ 
			
			swal(" ", "Please enter amount", "info")
		getRecipientEmail.abort();
			}
		 
		 if(document.getElementById("transferdate").value == "")
			{ 
			
			swal(" ", "Please enter Transfer Date", "info")
		getRecipientEmail.abort();
			}
		
		swal({
		    title: "Loading...",
		    text: "Please wait",
		    icon: "resources/images/loader.gif",
		    button: false,
		    closeOnClickOutside: false,
		    closeOnEsc: false
		  });

						$.ajax({
												     type : "POST",
												     url : "/mmpostprefund",
												     data : {bankReferenceNumber:tempbankref,clientAccountNumber:tempclientacc,comments:tempcomments,currencyCode:tempcurrency,dateOfTransfer:tempdate,AccountNumber:tempaccountnum,amount:tempamount,requesterId:temprqid},
													      timeout : 100000,
												     success : function(data) {	
												    	 
												    	 
												    	swal.close()
												    	 var obj = JSON.parse(data);	
												    	 if(obj['status'] ==  'INTERNAL_SERVER_ERROR')
												    	 {
												    		 swal(obj['status'] +"  "+ "Reason"+ " :" + obj['message'] +  "  ...." + obj['errors'] )
												    	 }
												    	 
												    	 else if  (obj['status'] == 'BAD_REQUEST' )
												    		 {
												    		 
												    		 {
													    		 swal(obj['status'] +"  "+ "Reason"+ " :" + obj['message'] +  "  ...." + obj['errors'] )
													    	 }
												    		 }
												    	 
												    	 else if  (obj['isError'] == true )
											    		 {
											    		 
											    		 {
												    		 swal("Prefund Request Failed" )
												    		 setTimeout(function(){
																   window.location.reload(1);
//																   window.location.href = '/mmprefundlist';
																}, 5000);
												    	 }
											    		 }
												    	 
												    	 else
												    	 {
												    			swal("Prefund Request Successful");
												    			setTimeout(function(){
//												    				 window.location.reload(1);
												    				window.location.href = '/mmprefundlist';
																	}, 5000);
												    	 }
												    		 
												    		 },
												    
												 });		
											  
												
											}
												     
												     

	
