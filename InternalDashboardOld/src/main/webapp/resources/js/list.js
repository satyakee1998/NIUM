window.onload=function FetchUserList()
{
var element = document.getElementById("users");
	$('users').addClass('active');
    element.classList.add("active");
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
url :'/userDetailsListnew',
timeout : 100000,

success : function(data) {
swal.close()

var obj = JSON.parse(data);

var table = $('#body');

$('#body').empty()

for (var i = 0; i < obj.length; i++)
{

var val =obj[i];

/*var str = val['creationDateTime'].toString();*/

var table = '<tr><td>'+(i+1)+"\n"+'</td><td id="userId'+(i+1)+'" value="'+val['memberId']+'" >'+val['memberId']+"\n"+'</td><td>'
+val['firstName']+"\n"+'</td><td>'+val['lastName']+"\n"+'</td><td>'+val['email']+"\n"+'</td><td>'
+ "<a href = '/mminternalcustomer?member_ID="+val['memberId']+"&user_Email="+val['email']+"&user_fname="+val['firstName']+"' class='bo'> Details</a> <div class='clearfix'></div></td></tr>" ;
$('#body').append(table)
}
}
});

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