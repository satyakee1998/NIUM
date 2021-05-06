 window.onload = function getprefundbalance () 
 {
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
			     url : "/mmgetprebalance",
			     timeout : 100000,
			 
			     success : function(data) {	
			    	 
			    	 swal.close()
				    	var balance = JSON.parse(data);
			    	 var  SGD = "S$" ;
		            
			    	 document.getElementById("sgd").value = SGD+" "+ balance["sgd"] ;
			    	
			}	
			       
			     }
			
			 );
			 
 }
 