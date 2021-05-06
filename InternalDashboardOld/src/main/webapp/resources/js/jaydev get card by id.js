function getcustomercards( )
{
var memberId = document.getElementById("memberId").value;

swal({
title: "Loading...",
text: "Please wait",
icon: "resources/loader.gif",
button: false,
closeOnClickOutside: false,
closeOnEsc: false
});


$.ajax({

type : "GET",
url : "/mmwalletbalance",
data : {memberId:memberId},
timeout : 100000,
success : function(data) {
swal.close()
var obj = JSON.parse(data);
var respoObj = obj['responseObject'];

if (obj['isError'] == true) {

swal("Failed! ","User Wallet not found", {
buttons: "Back",
icon: "info",

});
getcustomercards.abort();
}
if (respoObj['code'] == '403') {

swal("Failed! ",respoObj['code'], {
buttons: "Back",
icon: "info",

});
getcustomercards.abort();
}

else{


if (respoObj['cards'] != null){


var cardId = respoObj['cards'];
$('#usercardlist').empty() //clear the table
for(var a=0; a<cardId.length; a++)
{
var Cardval =cardId[a];
document.getElementById('hiddencardid').value = Cardval['id'];


var hiddencard = document.getElementById("hiddencardid").value ;

swal({
title: "Loading...",
text: "Please wait",
icon: "resources/loader.gif",
button: false,
closeOnClickOutside: false,
closeOnEsc: false
});
$.ajax({

type : "GET",
url : "/mmcustomercardsid",
data : {hiddencard:hiddencard},
timeout : 100000,

success : function(data) {

swal.close()
var obj = JSON.parse(data);
if (obj['isError'] == true ) {

swal("Failed!","Fetching card details" , {
buttons: "Back",
icon: "info",

});
getcustomercards.abort();

}

else{

var responseDetails = obj['responseObject'];
var cardHolder = responseDetails['holder'];

var cardType = responseDetails['type'];

var cardStatus= responseDetails['status'];
var cardDate = responseDetails['date'];

var table = $('#usercardlist');
//
if (cardType['form_factor'] == 'virtual' && cardStatus['text'] == 'active') {

var virtualcardNumber = responseDetails['number'].replace ( /[0-9]{6}$/, '******' );
var MaskedVirtualCardNumber = virtualcardNumber;

var tab='<tr><td align="left" valign="middle" id="holderName'+a+'" value="'+cardHolder['name']+'" >'+cardHolder['name']+"\n"+'</td><td align="left" valign="middle"id="maskedcard'+a+'" value="'+responseDetails['number']+'">'
+MaskedVirtualCardNumber+"\n"+'</td><td align="left" valign="middle" id="cardName'+a+'" value="'+cardType['name']+'">'+cardType['name']+"\n"+'</td><td align="left" valign="middle" >'
+"<span class='statusActiveCard'>Active</span>"+"\n"+'</td><td align="left" valign="middle" id="createdAt'+a+'" value="'+cardDate['issued']+'">'
+cardDate['issued']+"\n"+'</td><td align="left" valign="middle">'
+"<a href='#' class='actionActivetoBlockCard' data-toggle='modal' data-target='#blockCardButton'>Block</a> </td></tr>";

if(cardType['form_factor'] == 'virtual')
{
document.getElementById('addbutton').style.display = 'none';

}
document.getElementById('usercardid').value = responseDetails['id'];
}

else if (cardType['form_factor'] == 'virtual' && cardStatus['text']== 'locked') {

var virtuallockcardNumber = responseDetails['number'].replace ( /[0-9]{6}$/, '******' );
var MaskedVirtualLockCardNumber = virtuallockcardNumber;

var tab='<tr><td align="left" valign="middle" id="holderName'+a+'" value="'+cardHolder['name']+'" >'+cardHolder['name']+"\n"+'</td><td align="left" valign="middle"id="maskedcard'+a+'" value="'+responseDetails['number']+'">'
+MaskedVirtualLockCardNumber+"\n"+'</td><td align="left" valign="middle" id="cardName'+a+'" value="'+cardType['name']+'">'+cardType['name']+"\n"+'</td><td align="left" valign="middle" >'
+"<span class='statuslockedCard'>Locked</span>"+"\n"+'</td><td align="left" valign="middle" id="createdAt'+a+'" value="'+cardDate['issued']+'">'
+cardDate['issued']+"\n"+'</td><td align="left" valign="middle">'
+"<a href='#' class='actionlockedCard'>Blocked</a> </td></tr>";


document.getElementById('usercardid').value = responseDetails['id'];
}

else if (cardType['form_factor'] == 'physical' && cardStatus['is_active']== false) {
var physicalcardNumber = responseDetails['number'].replace ( /[0-9]{6}$/, '******' );
var MaskedPhysicalCardNumber = physicalcardNumber;

var tab='<tr><td align="left" valign="middle" id="holderName'+a+'" value="'+cardHolder['name']+'" >'+cardHolder['name']+"\n"+'</td><td align="left" valign="middle"id="maskedcard'+a+'" value="'+responseDetails['number']+'">'
+MaskedPhysicalCardNumber+"\n"+'</td><td align="left" valign="middle" id="cardName'+a+'" value="'+cardType['name']+'">'+cardType['name']+"\n"+'</td><td align="left" valign="middle">'
+"<span class='statusInactiveCard'>Active</span>"+"\n"+'</td><td align="left" valign="middle" id="createdAt'+a+'" value="'+cardDate['issued']+'">'
+cardDate['issued']+"\n"+'</td><td align="left" valign="middle">'
+"<a href='#' onclick='return select("+'"'+responseDetails['id']+'"'+','+'"'+responseDetails['activation_code']+'"'+")' class='actionBlockCard' >Activate</a> </td></tr>";

document.getElementById('activatecard').value = responseDetails['activation_code'];
document.getElementById('usercardid').value = responseDetails['id'];
}

else if ( cardType['form_factor'] == 'physical' && cardStatus['text'] == 'active' )
{
var phycardNumber = responseDetails['number'].replace ( /[0-9]{6}$/, '******' );
var MaskedphyCardNumber = phycardNumber;

var tab='<tr><td align="left" valign="middle" id="holderName'+a+'" value="'+cardHolder['name']+'" >'+cardHolder['name']+"\n"+'</td><td align="left" valign="middle"id="maskedcard'+a+'" value="'+responseDetails['number']+'">'
+MaskedphyCardNumber+"\n"+'</td><td align="left" valign="middle" id="cardName'+a+'" value="'+cardType['name']+'">'+cardType['name']+"\n"+'</td><td align="left" valign="middle" >'
+"<span class='statusActiveCard'>Active</span>"+"\n"+'</td><td align="left" valign="middle" id="createdAt'+a+'" value="'+cardDate['issued']+'">'
+cardDate['issued']+"\n"+'</td><td align="left" valign="middle">'
+"<a href='#' onclick='return blockcard("+'"'+responseDetails['id']+'"'+")' class='actionActivetoBlockCard' data-toggle='modal' data-target='#blockCardButton'>Block</a> </td></tr>";

document.getElementById('usercardid').value = responseDetails['id'];
}
else if ( cardType['form_factor'] == 'physical' && cardStatus['text']== 'locked' )
{
var phyLockcardNumber = responseDetails['number'].replace ( /[0-9]{6}$/, '******' );
var MaskedphyLockCardNumber = phyLockcardNumber;

var tab='<tr><td align="left" valign="middle" id="holderName'+a+'" value="'+cardHolder['name']+'" >'+cardHolder['name']+"\n"+'</td><td align="left" valign="middle"id="maskedcard'+a+'" value="'+responseDetails['number']+'">'
+MaskedphyLockCardNumber+"\n"+'</td><td align="left" valign="middle" id="cardName'+a+'" value="'+cardType['name']+'">'+cardType['name']+"\n"+'</td><td align="left" valign="middle" >'
+"<span class='statusActiveCard'>Locked</span>"+"\n"+'</td><td align="left" valign="middle" id="createdAt'+a+'" value="'+cardDate['issued']+'">'
+cardDate['issued']+"\n"+'</td><td align="left" valign="middle">'
+"<a href='#' class='actionlockedCard'>Blocked</a> </td></tr>";

document.getElementById('usercardid').value = responseDetails['id'];
}
else{

document.getElementById('usercardid').value = responseDetails['id'];

}



$('#usercardlist').append(tab)

}
// swal.close()
// $('#usercardlist').append(tab)
}

}



);

}

}
else{
swal("Currently No card Added.","Info", {
buttons: "Back",
icon: "info",

});
// getcustomercards.abort();
}
}/*1st else end*/
}

});
}