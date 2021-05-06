window.onload= function CustomerDetails ( )
{
	
	/*var temphas = document.getElementById("MemberID").value ;
*/
const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
	var temphas =  urlParams.get('member_ID');
	
     
      swal({
		   
		    icon: "resources/images/loader.gif",
		    button: false,
		    closeOnClickOutside: false,
		    closeOnEsc: false
		  });
	
					$.ajax({
						
					     type : "POST",
					     url : "/nisggetgetcustomer",
					     data : {customererid:temphas},
					     timeout : 100000,
					     
					     success : function(data) {	
					    	 
					    	 swal.close()
   
					    	 
						    	
						   var obj = JSON.parse(data);
						   
						    	
						    	
						    	
						    	
						    	 document.getElementById("customerfirstname").value =obj['firstName'];
						       // document.getElementById("accountid").value =obj['id'];
						    	 document.getElementById("customermiddlename").value =obj['middleName'];
						    		
						    	 document.getElementById("customerlastname").value =obj['lastName'];
					    		document.getElementById("customeremail").value =obj['email'];
						        document.getElementById("customerphone").value =obj['mobile'];	  	
						        document.getElementById("customerdob").value =obj['dateOfBirth'];
						         document.getElementById("cgender").value =obj['gender'];
						        
						        
						        /*address*/
						        document.getElementById("cdaddr").value =obj['deliveryAddress1'];
						        document.getElementById("cdaddrnew").value =obj['deliveryAddress2'];
						        document.getElementById("cdcity").value =obj['deliveryCity'];
						       //// document.getElementById("cdland").value =obj['deliveryLandmark'];
						        document.getElementById("cdstate").value =obj['deliveryState'];
						        document.getElementById("cdzip").value =obj['deliveryZipCode'];
				/*if (obj['deliveryCountry'] == null || obj['deliveryCountry'] =="" ) {       
                 document.getElementById("cdcountry").value =" ";
                  }*/
						        document.getElementById("cbaddr").value =obj['billingAddress1'];
						        document.getElementById("cbaddrnew").value =obj['billingAddress2'];
						        document.getElementById("cbcity").value =obj['billingCity'];
						      ////  document.getElementById("cbland").value =obj['billingLandmark'];
						        document.getElementById("cbstate").value =obj['billingState'];
						        document.getElementById("cbzip").value =obj['billingZipCode'];
/*if (obj['billingCountry'] == null || obj['billingCountry'] =="" ) {       
                 document.getElementById("cbcountry").value =" ";
                  }*/
                              ////   document.getElementById("cbcountry").value =obj['billingCountry'];

						        document.getElementById("cpaddr").value =obj['correspondenceAddress1'];
						        document.getElementById("cpaddrnew").value =obj['correspondenceAddress2'];
						        document.getElementById("cpcity").value =obj['correspondenceCity'];
						       //// document.getElementById("cpland").value =obj['correspondenceLandmark'];
						        document.getElementById("cpstate").value =obj['correspondenceState'];
						        document.getElementById("cpzip").value =obj['correspondenceZipCode'];
                             ///   document.getElementById("cpcountry").value =obj['correspondenceCountry'];

/*if (obj['correspondenceCountry'] == null || obj['correspondenceCountry'] =="" ) {       
                 document.getElementById("cpcountry").value = " ";
                  }*/

/*span*/
                               document.getElementById("cdaddrspan").innerHTML =obj['deliveryAddress1'];
						        document.getElementById("cdaddrnewspan").innerHTML =obj['deliveryAddress2'];
						        document.getElementById("cdcityspan").innerHTML =obj['deliveryCity'];
						      ///  document.getElementById("cdlandspan").innerHTML =obj['deliveryLandmark'];
						        document.getElementById("cdstatespan").innerHTML =obj['deliveryState'];
						        document.getElementById("cdzipspan").innerHTML =obj['deliveryZipCode'];
						      ///  document.getElementById("cdcountryspan").innerHTML =obj['deliveryCountry'];

						        document.getElementById("cbaddrspan").innerHTML =obj['billingAddress1'];
						        document.getElementById("cbaddrnewspan").innerHTML =obj['billingAddress2'];
						        document.getElementById("cbcityspan").innerHTML =obj['billingCity'];
						       //// document.getElementById("cblandspan").innerHTML =obj['billingLandmark'];
						        document.getElementById("cbstatespan").innerHTML =obj['billingState'];
						        document.getElementById("cbzipspan").innerHTML =obj['billingZipCode'];
                                //// document.getElementById("cbcountryspan").innerHTML =obj['billingCountry'];

						        document.getElementById("cpaddrspan").innerHTML =obj['correspondenceAddress1'];
						        document.getElementById("cpaddrnewspan").innerHTML =obj['correspondenceAddress2'];
						        document.getElementById("cpcityspan").innerHTML =obj['correspondenceCity'];
						       //// document.getElementById("cplandspan").innerHTML =obj['correspondenceLandmark'];
						        document.getElementById("cpstatespan").innerHTML =obj['correspondenceState'];
						        document.getElementById("cpzipspan").innerHTML =obj['correspondenceZipCode'];
                             ////   document.getElementById("cpcountryspan").innerHTML =obj['correspondenceCountry'];

						        
						        
						    		}		
			
					}
					    
				);
				return false ;
			}

///Fetch NIUM Wallet Balance//////
function getwalletbalance() {
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
	var tempcutomerhashid =  urlParams.get('member_ID');
	var tempwallethashid =  urlParams.get('wallet_hash_ID');
	

   



    $.ajax({

            type: "GET",
            url: "/NIUMWalletInfo",
            data: {
                CustomerHashID: tempcutomerhashid,
                WalletHashID: tempwallethashid
            },
            timeout: 100000,

            success: function(data) {


                
                var obj = JSON.parse(data);
                $('#walletbalancetable').empty()
                var table = $('#walletbalancetable');
                //					    		         

                for (var w = 0; w < obj.length; w++) {
                    var val = obj[w];

                    var USD = "$"; // US Dollar;
                    var EUR = "\u20AC";
                    var INR = "\u20B9";
                    var JPY = "\u00A5";
                    var IDR = "Rp";
                    var MYR = "RM";
                    var KRW = "\u20A9";
                    var TWD = "NT$";
                    var THB = "\u0E3F";
                    var GBP = "\u00A3";
                    var VND = "\u20AB";
                    if (val['curSymbol'] == 'SGD') {

                        var tab = '<tr><td align="center" valign="middle"> <img src=resources/nisg/images/sgdicon.png width=40 height=40> </td><td align="left" valign="middle" id="walletcurrency' + w + '" value="' + val['curSymbol'] + '" >' + val['curSymbol'] + "\n" + '</td><td align="left" valign="middle">' +
                            USD + " " + val['balance'] + "\n" + '</td><td align="left" valign="middle" >' + USD + " " + val['withHoldingBalance'] + "\n" + '</td></tr>';




                    } else if (val['curSymbol'] == 'USD') {
                        var tab = '<tr><td align="center" valign="middle"> <img src=resources/nisg/images/usdicon.png width=40 height=40> </td><td align="left" valign="middle" id="walletcurrency' + w + '" value="' + val['curSymbol'] + '" >' + val['curSymbol'] + "\n" + '</td><td align="left" valign="middle">' +
                            USD + " " + val['balance'] + "\n" + '</td><td align="left" valign="middle" >' + USD + " " + val['withHoldingBalance'] + "\n" + '</td></tr>';



                    } else if (val['curSymbol'] == 'GBP') {
                        var tab = '<tr><td align="center" valign="middle"> <img src=resources/nisg/images/gbpicon.png width=40 height=40> </td><td align="left" valign="middle" id="walletcurrency' + w + '" value="' + val['curSymbol'] + '" >' + val['curSymbol'] + "\n" + '</td><td align="left" valign="middle">' +
                            GBP + " " + val['balance'] + "\n" + '</td><td align="left" valign="middle" >' + GBP + " " + val['withHoldingBalance'] + "\n" + '</td></tr>';



                    } else if (val['curSymbol'] == 'EUR') {
                        var tab = '<tr><td align="center" valign="middle"> <img src=resources/nisg/images/euroicon.png width=40 height=40> </td><td align="left" valign="middle" id="walletcurrency' + w + '" value="' + val['curSymbol'] + '" >' + val['curSymbol'] + "\n" + '</td><td align="left" valign="middle">' +
                            EUR + " " + val['balance'] + "\n" + '</td><td align="left" valign="middle" >' + EUR + " " + val['withHoldingBalance'] + "\n" + '</td></tr>';



                    } else if (val['curSymbol'] == 'INR') {
                        var tab = '<tr><td align="center" valign="middle"> <img src=resources/nisg/images/inricon.png width=40 height=40> </td><td align="left" valign="middle" id="walletcurrency' + w + '" value="' + val['curSymbol'] + '" >' + val['curSymbol'] + "\n" + '</td><td align="left" valign="middle">' +
                            INR + " " + val['balance'] + "\n" + '</td><td align="left" valign="middle" >' + INR + " " + val['withHoldingBalance'] + "\n" + '</td></tr>';



                    } else if (val['curSymbol'] == 'JPY') {
                        var tab = '<tr><td align="center" valign="middle"> <img src=resources/nisg/images/jpyicon.png width=40 height=40> </td><td align="left" valign="middle" id="walletcurrency' + w + '" value="' + val['curSymbol'] + '" >' + val['curSymbol'] + "\n" + '</td><td align="left" valign="middle">' +
                            JPY + " " + val['balance'] + "\n" + '</td><td align="left" valign="middle" >' + JPY + " " + val['withHoldingBalance'] + "\n" + '</td></tr>';



                    } else if (val['curSymbol'] == 'AUD') {
                        var tab = '<tr><td align="center" valign="middle"> <img src=resources/nisg/images/audicon.png width=40 height=40> </td><td align="left" valign="middle" id="walletcurrency' + w + '" value="' + val['curSymbol'] + '" >' + val['curSymbol'] + "\n" + '</td><td align="left" valign="middle">' +
                            USD + " " + val['balance'] + "\n" + '</td><td align="left" valign="middle" >' + USD + " " + val['withHoldingBalance'] + "\n" + '</td></tr>';



                    } else if (val['curSymbol'] == 'HKD') {
                        var tab = '<tr><td align="center" valign="middle"> <img src=resources/nisg/images/hkdicon.png width=40 height=40> </td><td align="left" valign="middle" id="walletcurrency' + w + '" value="' + val['curSymbol'] + '" >' + val['curSymbol'] + "\n" + '</td><td align="left" valign="middle">' +
                            USD + " " + val['balance'] + "\n" + '</td><td align="left" valign="middle" >' + USD + " " + val['withHoldingBalance'] + "\n" + '</td></tr>';



                    } else if (val['curSymbol'] == 'IDR') {
                        var tab = '<tr><td align="center" valign="middle"> <img src=resources/nisg/images/idricon.png width=40 height=40> </td><td align="left" valign="middle" id="walletcurrency' + w + '" value="' + val['curSymbol'] + '" >' + val['curSymbol'] + "\n" + '</td><td align="left" valign="middle">' +
                            IDR + " " + val['balance'] + "\n" + '</td><td align="left" valign="middle" >' + IDR + " " + val['withHoldingBalance'] + "\n" + '</td></tr>';



                    } else if (val['curSymbol'] == 'MYR') {
                        var tab = '<tr><td align="center" valign="middle"> <img src=resources/nisg/images/myricon.png width=40 height=40> </td><td align="left" valign="middle" id="walletcurrency' + w + '" value="' + val['curSymbol'] + '" >' + val['curSymbol'] + "\n" + '</td><td align="left" valign="middle">' +
                            MYR + " " + val['balance'] + "\n" + '</td><td align="left" valign="middle" >' + MYR + " " + val['withHoldingBalance'] + "\n" + '</td></tr>';



                    } else if (val['curSymbol'] == 'KRW') {
                        var tab = '<tr><td align="center" valign="middle"> <img src=resources/nisg/images/krwicon.png width=40 height=40> </td><td align="left" valign="middle" id="walletcurrency' + w + '" value="' + val['curSymbol'] + '" >' + val['curSymbol'] + "\n" + '</td><td align="left" valign="middle">' +
                            KRW + " " + val['balance'] + "\n" + '</td><td align="left" valign="middle" >' + KRW + " " + val['withHoldingBalance'] + "\n" + '</td></tr>';



                    } else if (val['curSymbol'] == 'TWD') {
                        var tab = '<tr><td align="center" valign="middle"> <img src=resources/nisg/images/twdicon.png width=40 height=40> </td><td align="left" valign="middle" id="walletcurrency' + w + '" value="' + val['curSymbol'] + '" >' + val['curSymbol'] + "\n" + '</td><td align="left" valign="middle">' +
                            TWD + " " + val['balance'] + "\n" + '</td><td align="left" valign="middle" >' + TWD + " " + val['withHoldingBalance'] + "\n" + '</td></tr>';



                    } else if (val['curSymbol'] == 'THB') {
                        var tab = '<tr><td align="center" valign="middle"> <img src=resources/nisg/images/thbicon.png width=40 height=40> </td><td align="left" valign="middle" id="walletcurrency' + w + '" value="' + val['curSymbol'] + '" >' + val['curSymbol'] + "\n" + '</td><td align="left" valign="middle">' +
                            THB + " " + val['balance'] + "\n" + '</td><td align="left" valign="middle" >' + THB + " " + val['withHoldingBalance'] + "\n" + '</td></tr>';



                    } else if (val['curSymbol'] == 'VND') {
                        var tab = '<tr><td align="center" valign="middle"> <img src=resources/nisg/images/vndicon.png width=40 height=40> </td><td align="left" valign="middle" id="walletcurrency' + w + '" value="' + val['curSymbol'] + '" >' + val['curSymbol'] + "\n" + '</td><td align="left" valign="middle">' +
                            VND + " " + val['balance'] + "\n" + '</td><td align="left" valign="middle" >' + VND + " " + val['withHoldingBalance'] + "\n" + '</td></tr>';



                    }


                    /*var tab='<tr><td align="center" valign="middle"> <img src=resources/nisg/images/usdicon.png width=40 height=40> </td><td align="left" valign="middle" id="walletcurrency'+w+'" value="'+val['curSymbol']+'" >'+val['curSymbol']+"\n"+'</td><td align="left" valign="middle">'
						    						+val['balance']+"\n"+'</td><td align="left" valign="middle" >'+val['withHoldingBalance']+"\n"+'</td></tr><tr><td height="10"></td></tr>';
						    						
										    		 */
                    $('#walletbalancetable').append(tab)



                }


            }

        }

    );

  
    return false;
}

/// Fetch NIUM Get Exchange Wallet///
function seerate(){
	/*const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
	var tempcutomerhashid =  urlParams.get('member_ID');
	var tempwallethashid =  urlParams.get('wallet_hash_ID');*/
	
	
	
	/*var  tempcus=   document.getElementById("cus").value;
	var tempwall= document.getElementById("wall").value ;*/

	/*=val['customerHashId']*/
	
			var temppocket= "DEFAULT" ;
  			var tempchannel= "Prefund";
		
  	var tempamount= document.getElementById("famount").value ;
      var tempscurrency = document.getElementById("source").innerHTML ;
     var tempdcurrency= document.getElementById("desti").innerHTML ;
      
  if ( document.getElementById("famount").value == "")
  { 
	 
	  swal("","Please enter Amount","info")
	  transfertocustomer.abort();
  }	
		

																  
																  
																  $.ajax({
																				
																			     type : "POST",
																			    url : "/nisggetrate",
													 data : {sourcecurrency:tempscurrency,amount:tempamount,destinationcurrency:tempdcurrency},
												 timeout : 100000,
																			     
																			     success : function(data)
																			     
																		     
																			     
														                             {					
																			    	 
																			    	/// swal.close()
																			   		 
																			    	 var obj = JSON.parse(data);	
															 var  X =   ( parseFloat(obj['exchangeRate']).toFixed(2) * tempamount) ;
																			    /*	 if(obj['status'] == 'BAD_REQUEST')
																			    	 {
																			    		 swal(obj['status'] +"  "+ "Reason"+obj['message'] )
															.then((value) => {
					  	    													return getwalletbalance();
					  	    															});
																
																			    	 }
																	    	 
																	    	 
																	    	 else if  (obj['status'] =='INTERNAL_SERVER_ERROR')
																	    		 { 
																	    		 swal("",obj['status'] +"  "+ "Reason"+obj['message'],"info" )
																				.then((value) => {
					  	    														return getwalletbalance();
					  	    														});
																	    		 
																	    		 }*/
																	    		
																	    	
																	    	 
																	    	 
													
																	    	 
																	    	 
																	    	 
																	    	 
																	    	 
																	    	
														if (document.getElementById("source").innerHTML == document.getElementById("desti").innerHTML )
														{
															document.getElementById("rate").innerHTML = " ";
															document.getElementById("rcvd").value=tempamount;
														}			
														else { 			
																		document.getElementById("rate").innerHTML =  tempamount +" "+ tempdcurrency+" "  +"="+" "+ parseFloat(X).toFixed(2) +" "+tempscurrency
														document.getElementById("rcvd").value=		parseFloat(X).toFixed(2) ;
														}
																	    		 
																	    		 },
																	     error : function(e) {
																	         console.log("ERROR: ", e);
																	         display(e);
																	     },
																	     done : function(e) {
																	         console.log("DONE");
																	     } 
																	     
																	 });
							
										
										return false ;
											}


/////NIUM Get Exchange Rate(Apna Javascript)///
function exchangerate()
{
	$.ajax({
		type :'GET',
		url :'/NIUMExchangeRate',
		timeout : 100000,
		
		success : function(data) {


				var obj = JSON.parse(data);
				
				var table = $('#exchangeratebody');
				
				$('#exchangeratebody').empty()
				
				
				
				
										
                                        
				document.getElementById("sourcecurrency").value = obj['sourceCurrencyCode'];
				document.getElementById("sourceamt").value = obj['sourceAmount'];
				document.getElementById("destinationcurrency").value =obj['destinationCurrencyCode'];
				document.getElementById("destinationamt").value =obj['destinationAmount'];
				document.getElementById("exchangerte").value =obj['exchangeRate'];
				document.getElementById("netexchangerte").value =obj['netExchangeRate'];
				document.getElementById("markuprte").value =obj['markupRate'];
				document.getElementById("markupamt").value =obj['markupAmount'];
				document.getElementById("scalingfact").value =obj['scalingFactor'];
				document.getElementById("quoteid").value =obj['quoteId'];
				document.getElementById("expiry").value =obj['expiryDate'];
												
				
				
}

});

}



