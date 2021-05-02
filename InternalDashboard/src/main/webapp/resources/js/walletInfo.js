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