 window.onload = function showprefund () 
 
 {/*
	 var element = document.getElementById("prefunda");
		$('prefunda').addClass('active');
	  element.classList.add("active");
		var checklogmail=  document.getElementById("checklogmail").value;
		 
			 if (sessionStorage.getItem("lastemail") != checklogmail ) 

	{
	window.location.href = '/invalidsession';
	}  */
	 
	 swal({
		    title: "Loading...",
		    text: "Please wait",
		    icon: "resources/images/loader.gif",
		    button: false,
		    closeOnClickOutside: false,
		    closeOnEsc: false
		  });
	 
			$.ajax({
				
			     type : "GET",
			     url : "/mmshowprefund",
			     timeout : 100000,
			 
			     success : function(data) {	
			    	swal.close()
				    	var obj = JSON.parse(data);
				    	
				    	 if(obj['status'] == 'INTERNAL_SERVER_ERROR')
				    	 {
				    		 swal(obj['status'] +"  "+ "Reason"+  " " +obj['message'] )
				    	 }
			         var table =  $('#body');
			        
			         
			         for(var p=0; p<obj.length; p++)
			    		{
			    		var val =obj[p];
			    	
			    			  
			    		if (val['status'] == 'Approved'){ 
			    		
			    		var tab='<tr><td align="left" valign="middle" >'+'<img src=resources/images/sgdicon.png width=40 height=40 alt=Country title=Country>'+"\n"+'</td><td align="left" valign="middle" id="prefundid'+p+'" value="'+val['amount']+" "+"SGD"+'" ><span class="mobTableHeading"></span>'+val['amount']+" "+"SGD"+"\n"+'</td><td align="left" valign="middle"><span class="mobTableHeading"></span>'
				 +val['id']+"\n"+'</td><td align="left" valign="middle"><span class="mobTableHeading"></span>'
					  +val['bankReferenceNumber']+"\n"+'</td><td align="left" valign="middle"><span class="mobTableHeading"></span>'
			+val['dateOfTransfer']+"\n"+'</td><td align="left" valign="middle"><span class="mobTableHeading"></span>'
						 +'<span class="statusApproved">Approved</span>'+"\n"+'</td><td align="left" valign="middle"><span class="mobTableHeading"></span>'
						 +val['comments']+"\n"+'</td></tr>';
					}
				else	if (val['status'] == 'Declined'){ 
			    		
			    		var tab='<tr><td align="left" valign="middle" >'+'<img src=resources/images/sgdicon.png width=40 height=40 alt=Country title=Country>'+"\n"+'</td><td align="left" valign="middle" id="prefundid'+p+'" value="'+val['amount']+" "+"SGD"+'" ><span class="mobTableHeading"></span>'+val['amount']+" "+"SGD"+"\n"+'</td><td align="left" valign="middle">'
				 +val['id']+"\n"+'</td><td align="left" valign="middle">'
					  +val['bankReferenceNumber']+"\n"+'</td><td align="left" valign="middle">'
			+val['dateOfTransfer']+"\n"+'</td><td align="left" valign="middle">'
						 +'<span class="statusDecline">Declined</span>'+"\n"+'</td><td align="left" valign="middle">'
						 +val['comments']+"\n"+'</td></tr>';
					}
						else	if (val['status'] == 'Pending'){ 
			    		
			    		var tab='<tr><td align="left" valign="middle" >'+'<img src=resources/images/sgdicon.png width=40 height=40 alt=Country title=Country>'+"\n"+'</td><td align="left" valign="middle" id="prefundid'+p+'" value="'+val['amount']+" "+"SGD"+'" >'+val['amount']+" "+"SGD"+"\n"+'</td><td align="left" valign="middle">'
				 +val['id']+"\n"+'</td><td align="left" valign="middle">'
					  +val['bankReferenceNumber']+"\n"+'</td><td align="left" valign="middle">'
			+val['dateOfTransfer']+"\n"+'</td><td align="left" valign="middle">'
						 +'<span class="statusPending">Pending</span>'+"\n"+'</td><td align="left" valign="middle">'
						 +val['comments']+"\n"+'</td></tr>';
					}
					
			    		
					    		$('#body').append(tab)
					    		}
			}	
			       
			     }
			 );
 

 /*var validNumber = new RegExp(/^[0-9]*(\.[0-9]{0,2})?$/);
 var lastValid = document.getElementById("famount").value;
 function validateNumber(elem) {
   if (validNumber.test(elem.value)) {
     lastValid = elem.value;
   } else {
     elem.value = lastValid;
   }
 }
 
 
 function exportF(elem) {
	  var table = document.getElementById("prefundTable");
	  var html = table.outerHTML;
	  var url = 'data:application/vnd.ms-excel,' + escape(html); // Set your html table into url 
	  elem.setAttribute("href", url);
	  elem.setAttribute("download", "PrefundRequests.xls"); // Choose the file name
	  return false;
	}*/
	
	$(".tablemanager").tablemanager({
firstSort: [[3,0],[2,0],[1,'asc']],
disable: ["last"],
appendFilterby: true,
debug: true,
vocabulary: {
voc_filter_by: "Filter By",
voc_type_here_filter: "Filter...",
voc_show_rows: "Rows Per Page",
},
pagination: true,
showrows: [5,10,20,50,100],
})
}