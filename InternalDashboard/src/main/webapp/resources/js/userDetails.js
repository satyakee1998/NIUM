//Fetch UserDetails//
window.onload=function FetchUserDetails()
{
var userID = document.getElementById('CusHasID').value;
/*swal({
 title: "Loading...",
text: " Please Wait....",
icon: "resources/images/loader.gif",
button: false,
closeOnClickOutside: false,
closeOnEsc: false
});*/
$.ajax({
type :'GET',
url :'/userDetails',
data:{newuserID:userID},
timeout : 100000,

success : function(data) {
/*swal.close()*/


var obj = JSON.parse(data);
var respoObj= obj['responseObject'];
var dateofRegis = respoObj['date'];
var str =dateofRegis['registration'].toString();
var identity= respoObj['identification'];
var usermobile = respoObj['mobile'];
var username = respoObj['name'];
var userstatus = respoObj['status'];

document.getElementById('dob').value = respoObj['birthday'];
document.getElementById('registerDate').value = str.substr(0,str.length-18);
document.getElementById('IdNo').value = identity['number'];
document.getElementById('IdIssue').value = identity['issue'];
document.getElementById('IdExpiry').value = identity['expiry'];
document.getElementById('IdType').value = identity['type'];
document.getElementById('gender').value = respoObj['gender'];
document.getElementById('title').value = respoObj['title'];
document.getElementById('fname').value = username['first'];
document.getElementById('lname').value = username['last'];
document.getElementById('pname').value = username['preferred'];
document.getElementById('mname').value = username['middle'];
document.getElementById('issueC').value = respoObj['countryofissue'];
document.getElementById('Code').value = usermobile['country_code'];
document.getElementById('MoNo').value = usermobile['number'];
document.getElementById('email').value = respoObj['email'];
document.getElementById('status_active').value = userstatus['is_active'];
document.getElementById('status_text').value = userstatus['text'];

if(respoObj['birthday'] == null){
document.getElementById('dob').value = "NA" ;
}else{
document.getElementById('dob').value = respoObj['birthday']; 
}

if(dateofRegis['registration'] == null){
document.getElementById('registerDate').value = "NA" ;
}else{
document.getElementById('registerDate').value = dateofRegis['registration']; 
}

if(identity['IdNo'] == null){
document.getElementById('IdNo').value = "NA" ;
}else{
document.getElementById('IdNo').value = identity['number'];
}
if(identity['IdIssue'] == null){
document.getElementById('IdIssue').value = "NA" ;
}else{
document.getElementById('IdIssue').value = identity['issue'];
}
if(identity['IdExpiry'] == null){
document.getElementById('IdExpiry').value = "NA" ;
}else{
document.getElementById('IdExpiry').value = identity['expiry'];
}
if(identity['IdType'] == null){
document.getElementById('IdType').value = "NA" ;
}else{
document.getElementById('IdType').value =identity['type'];
}
if(respoObj['gender'] == null){
document.getElementById('respoObj').value = "NA" ;
}else{
document.getElementById('respoObj').value = respoObj['gender'];
}
if(respoObj['title'] == null){
document.getElementById('title').value = "NA" ;
}else{
document.getElementById('title').value = respoObj['title'];
}
if(username['fname'] == null){
document.getElementById('fname').value = "NA" ;
}else{
document.getElementById('fname').value = username['first'];
}
if(username['lname'] == null){
document.getElementById('lname').value = "NA" ;
}else{
document.getElementById('lname').value = username['last'];
}
if(username['pname'] == null){
document.getElementById('pname').value = "NA" ;
}else{
document.getElementById('pname').value = username['preferred'];
}
if(username['mname'] == null){
document.getElementById('mname').value = "NA" ;
}else{
document.getElementById('mname').value = username['middle'];
}
if(respoObj['issueC'] == null){
document.getElementById('issueC').value = "NA" ;
}else{
document.getElementById('issueC').value = respoObj['countryofissue'];
}
if(usermobile['Code'] == null){
document.getElementById('Code').value = "NA" ;
}else{
document.getElementById('Code').value = usermobile['country_code'];
}
if(usermobile['MoNo'] == null){
document.getElementById('MoNo').value = "NA" ;
}else{
document.getElementById('MoNo').value = usermobile['number'];
}
if(respoObj['email'] == null){
document.getElementById('email').value = "NA" ;
}else{
document.getElementById('email').value = respoObj['email'];
}
if(userstatus['status_active'] == null){
document.getElementById('status_active').value = "NA" ;
}else{
document.getElementById('status_active').value =userstatus['is_active'];
}
if(userstatus['status_text'] == null){
document.getElementById('status_text').value = "NA" ;
}else{
document.getElementById('status_text').value =userstatus['text'];
}
}
});
}
///Fetch NIUM Wallet Balance//////
function getwalletbalance() {
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
	var tempcutomerhashid =  urlParams.get('Customer_has_ID');
	var tempwallethashid =  urlParams.get('wallet_hash_ID');
	

   /* var tempcutomerhashid = document.getElementById("newcustomerhas").value;
    var tempwallethashid = document.getElementById("newwallethas").value;
*/

    /*var custoname = document.getElementById("custoname").value;*/


   /* swal({
        text: "Fetching " + custoname + "'s Wallet Info",
        icon: "resources/loader.gif",
        button: false,
        closeOnClickOutside: false,
        closeOnEsc: false
    });*/


    $.ajax({

            type: "GET",
            url: "/NIUMWalletInfo",
            data: {
                CustomerHashID: tempcutomerhashid,
                WalletHashID: tempwallethashid
            },
            timeout: 100000,

            success: function(data) {


                /*swal.close()*/
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
///fetch getcard by id//
	function GetCardsById() {
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
	var memberid =  urlParams.get('member_ID');
	var hiddencard = "";
	var activateCard = "";
	
    swal({
 title: "Loading...",
text: " Please Wait....",
icon: "resources/images/loader.gif",
button: false,
closeOnClickOutside: false,
closeOnEsc: false
});


   


    $.ajax({

        type: "GET",
        url: "/walletInfo",
        data: {member_Id:memberid},
        timeout: 100000,
        success: function(data) {
            swal.close()
            var obj = JSON.parse(data);

            if (obj['isError'] == true) {

                swal("Sorry!", "Wallet Not Found")
                GetCardsById.abort();
            } else {
                var respoObj = obj['responseObject'];

                if (respoObj['cards'] != null) {


                    var cardId = respoObj['cards'];
                         /*hiddencard = cardId[0]['id'];*/
                        /*alert(hiddencard);*/
                        for (var a=0; a < cardId.length; a++) {
                        var Cardval = cardId[a];
                       document.getElementById('hiddencardid').value = Cardval['id'];


                        var hiddencard = document.getElementById("hiddencardid").value;
                        $.ajax({

                                type: "POST",
                                url: "/mmcustomercardsid",
                                data: {hiddencard:hiddencard},
                                timeout: 100000,

                                success: function(data) {

                                    var obj = JSON.parse(data);
                                    if (obj['isError'] == true) {

                                        swal("Here's a message!", "Card Not Found")
                                        GetCardsById.abort();

                                    } else if (obj['status'] == 400) {
                                       swal("Here's a message!", "Card Not Found")
                                        GetCardsById.abort();
                                    } else {

                                        var respObj = obj['responseObject'];
                                        var cardDate = respObj['date'];

                                        var cardHolder = respObj['holder'];

                                        var cardType = respObj['type'];

                                        var cardStatus = respObj['status'];

                                        var table = $('#usercardlist');
                                      /*  $('#usercardlist').empty()*/ //clear the table
                                        if (cardType['name'] == 'StyloPay Virtual Card') {



                                            var tab = '<tr><td align="left" valign="middle" id="holderName' + a + '" value="' + cardHolder['name'] + '" >' + cardHolder['name'] + "\n" + '</td><td align="left" valign="middle"id="maskedcard' + a + '" value="' + respObj['number'] + '">' +
                                                respObj['number'] + "\n" + '</td><td align="left"  valign="middle" id="cardName' + a + '" value="' + cardType['name'] + '">' + cardType['name'] + "\n" + '</td><td align="left"  valign="middle" id="cardStatus>' +
                                                "<span class='statusActiveCard'>Active</span>" + "\n" + '</td><td align="left" valign="middle" id="createdAt' + a + '" value="' + cardDate['issued'] + '">' +
                                                cardDate['issued'] + "\n" + '</td><td align="left" valign="middle">' +
                                                "<a href='#' onclick='return select(" + '"' + respObj['id'] + '"' + ',' + '"' + respObj['activation_code'] + '"' + ','+ '"' + cardStatus['text'] + '"' +")' class='actionActivateCard'  data-toggle='modal' data-target='#blockCardButton'>Activated</a> </td></tr>";

                                            if (respObj['number']) {
                                                document.getElementById('addbutton').style.display = 'none';
                                                document.getElementById('addbutton').style.display = 'block';
                                            }
                                            document.getElementById('usercardid').value = respObj['id'];
                                            
                                            
                                            
                                        } else if (cardType['name'] == 'StyloPay Physical Card' && cardStatus['text'] == 'pending activation') {
                                            var tab = '<tr><td align="left" valign="middle" id="holderName' + a + '" value="' + cardHolder['name'] + '" >' + cardHolder['name'] + "\n" + '</td><td align="left" valign="middle"id="maskedcard' + a + '" value="' + respObj['number'] + '">' +
                                                respObj['number'] + "\n" + '</td><td align="left"  valign="middle" id="cardName' + a + '" value="' + cardType['name'] + '">' + cardType['name'] + "\n" + '</td><td align="left"  valign="middle" id="cardStatus>' +
                                                "<span class='statusInactiveCard'>Active</span>" + "\n" + '</td><td align="left" valign="middle" id="createdAt' + a + '" value="' + cardDate['issued'] + '">' +
                                                cardDate['issued'] + "\n" + '</td><td align="left" valign="middle">' +
                                                "<a href='#' onclick='return select(" + '"' + respObj['id'] + '"' + ',' + '"' + respObj['activation_code'] + '"' + ")' class='actionBlockCard'  data-toggle='modal' data-target='#blockCardButton'>Activate</a> </td></tr>";

                                            document.getElementById('activatecard').value = respObj['activation_code'];
                                            document.getElementById('usercardid').value = respObj['id'];
                                            
                                            
                                            
                                        } else if (cardType['name'] == 'StyloPay Physical Card' && cardStatus['text'] == 'inactive') {
                                            var tab = '<tr><td align="left" valign="middle" id="holderName' + a + '" value="' + cardHolder['name'] + '" >' + cardHolder['name'] + "\n" + '</td><td align="left" valign="middle"id="maskedcard' + a + '" value="' + respObj['number'] + '">' +
                                                respObj['number'] + "\n" + '</td><td align="left"  valign="middle" id="cardName' + a + '" value="' + cardType['name'] + '">' + cardType['name'] + "\n" + '</td><td align="left"  valign="middle" id="cardStatus>' +
                                                "<span class='statusInactiveCard'>Active</span>" + "\n" + '</td><td align="left" valign="middle" id="createdAt' + a + '" value="' + cardDate['issued'] + '">' +
                                                cardDate['issued'] + "\n" + '</td><td align="left" valign="middle">' +
                                                "<a href='#' onclick='return select(" + '"' + respObj['id'] + '"' + ',' + '"' + respObj['activation_code'] + '"' + ")' class='actionBlockCard'  data-toggle='modal' data-target='#blockCardButton'>Activate</a> </td></tr>";

                                            document.getElementById('activatecard').value = respObj['activation_code'];
                                            document.getElementById('usercardid').value = respObj['id'];
                                        }
                                        
                                        
                                        
                                        
                                        
                                        else if (cardType['name'] == 'StyloPay Physical Card' && cardStatus['text'] == 'active') {

                                            var tab = '<tr><td align="left" valign="middle" id="holderName' + a + '" value="' + cardHolder['name'] + '" >' + cardHolder['name'] + "\n" + '</td><td align="left" valign="middle"id="maskedcard' + a + '" value="' + respObj['number'] + '">' +
                                                respObj['number'] + "\n" + '</td><td align="left"  valign="middle" id="cardName' + a + '" value="' + cardType['name'] + '">' + cardType['name'] + "\n" + '</td><td align="left"  valign="middle" id="cardStatus>' +
                                                "<span class='statusActiveCard'>Active</span>" + "\n" + '</td><td align="left" valign="middle" id="createdAt' + a + '" value="' + cardDate['issued'] + '">' +
                                                cardDate['issued'] + "\n" + '</td><td align="left" valign="middle">' +
	                                                "<a href='#' onclick='return select(" + '"' + respObj['id'] + '"' + ',' + '"' + respObj['activation_code'] + '"' + ','+ '"' + cardStatus['text'] + '"' +")' class='actionActivateCard'  data-toggle='modal' data-target='#blockCardButton'>Activated</a> </td></tr>";


                                             document.getElementById('usercardid').value = respObj['id'];
                                        } else {

                                        }


                                        /*document.getElementById('usercardid').value = respObj['id'];*/

                                        $('#usercardlist').append(tab)


                                    }

                                }

                            }

	

                        );

                    }
                } else {
                    swal("Sorry!", "Failed! While Fetching Card Info")
                
                }
            } 
        }

    });
    }
    /*select function*//* Activation card*/
    function select (Ucardid,activateCard,status)

{
 
	var activenum= activateCard;
	
	var cardId= Ucardid;
	
	
	if ( status=="active")
{
		swal ( "Congratulation!", "Card is already Activated")
		
		
}
else if ( status=="locked")
{
		swal ( "OOPS!", "Your Card is Locked")
		
		
}
	
	else if(status=="pending activation" || status=="inactive" )
	{
	
	   $.ajax({
	  	     type : "POST",
	  	     url : "/activatephycard",
	  	   data : {activenum:activenum,cardId:cardId},
	  	     timeout : 100000,
	  	  
	  	     success : function(data) {	
	  	    	 
	  	    	swal.close() 
	  	    	 
	  	    	var obj = JSON.parse(data);
	  	    	
	  	    	 if (obj['isError'] == true ) {   
	  				
			    	 swal("Failed")	
			
		}
	  	    	 else{
	  	    	
	  	    	
	  			swal("Physical Card Activate Successfully",{
			    	  buttons: false,
			    	  timer: 12000,
			    	})
			    	setTimeout(function(){
			    		return getcustomercards();
		    			}, 2000);
	  	    	 }
	 	    	
	  	    	},
	  	   
	  	 });

	}

}

//Assign Physical Card

function assignphysical( )

{

var accountnum = document.getElementById("acc").value ;
var userID = document.getElementById('MemberID').value;

if ( document.getElementById("acc").value == "")
{
swal ( " ", "Please enter Proxy Number", "info")
assignphysical.abort();
}
/* swal({

text: "Loading...",
icon: "resources/loader.gif",
button: false,
closeOnClickOutside: false,
closeOnEsc: false
});*/



$.ajax({

type : "POST",
url : "/mmassignphysical",
data : {accountnum:accountnum},
timeout : 100000,

success : function(data)
{
var obj = JSON.parse(data);
if (obj['isError'] == true ) {

swal("Failed",obj['message'], {
/*buttons: "Back",
icon: "info",*/

});
assignphysical.abort();



}
else {
swal("Success ","Physical Card Added Successfully", {
buttons: false,
icon: "success",
timer: 2000,
});

}

},
error : function(e) {
console.log("ERROR:");
},
done : function(e) {
console.log("DONE");
}
});
}
    
   
/////Fetch kyc details
function FetchUserKYCDetails()
{
var userID = document.getElementById('MemberID').value;

$.ajax({
type :'POST',
url :'/mmgetgetcustomerkyc',
data:{memberId:userID},
timeout : 100000,

success : function(data) {

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

if(obj[`kyc_Uploaded_Flag_Y`] == null){
document.getElementById('kyc_Uploaded_Flag_Y').value = "NA" ;
}else{
document.getElementById('kyc_Uploaded_Flag_Y').value = obj[`kyc_Uploaded_Flag_Y`] ;
}

if(obj[`kyc_Not_Approved_Pending_Expired_Fraud_Etc_Comment`] == null){
document.getElementById('kyc_Not_Approved_Pending_Expired_Fraud_Etc_Comment').value = "NA" ;
}else{
document.getElementById('kyc_Not_Approved_Pending_Expired_Fraud_Etc_Comment').value = obj[`kyc_Not_Approved_Pending_Expired_Fraud_Etc_Comment`] ;
}
}
});
}
