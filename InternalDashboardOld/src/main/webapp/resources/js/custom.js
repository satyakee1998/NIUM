// Update AddressInfo//
$(".addressInfoCon .closeEditBtn").hide();
$(".deliveryAddressForm").hide();
$(".editAddBtn").click(function(e){
e.preventDefault();
$(".addressInfoCon .closeEditBtn").show();
$(".editAddBtn").hide();
$(".deliveryAddressDiv").hide();
$(".deliveryAddressForm").show();
});
$(".closeEditBtn").click(function(e){
e.preventDefault();
$(".addressInfoCon .closeEditBtn").hide();
$(".editAddBtn").show();
$(".deliveryAddressDiv").show();
$(".deliveryAddressForm").hide();
});

//Background Image///
jQuery('.customDropDown').append('<div class="button"></div>');
jQuery('.customDropDown').append('<ul class="select-list"></ul>');
jQuery('.customDropDown select option').each(function() {
var bg = jQuery(this).css('background-image');
jQuery('.select-list').append('<li class="clsAnchor"><span value="' + jQuery(this).val() + '" class="' + jQuery(this).attr('class') + '" style=background-image:' + bg + '>' + jQuery(this).text() + '</span></li>');
});
jQuery('.customDropDown .button').html('<span style=background-image:' + jQuery('.customDropDown select').find(':selected').css('background-image') + '>' + jQuery('.customDropDown select').find(':selected').text() + '</span>' + '<a href="javascript:void(0);" class="select-list-link">Arrow</a>');
jQuery('.customDropDown ul li').each(function() {
if (jQuery(this).find('span').text() == jQuery('.customDropDown select').find(':selected').text()) {
jQuery(this).addClass('active');
}
});

jQuery('.customDropDown .select-list span').on('click', function() {
var dd_text = jQuery(this).text();
var dd_img = jQuery(this).css('background-image');
var dd_val = jQuery(this).attr('value');

jQuery('.customDropDown .button').html('<span style=background-image:' + dd_img + '>' + dd_text + '</span>' + '<a href="javascript:void(0);" class="select-list-link">Arrow</a>');
jQuery('.customDropDown .select-list span').parent().removeClass('active');
jQuery(this).parent().addClass('active');

$('.customDropDown select[name=options]').val( dd_val );

$('.customDropDown .select-list li').slideUp();

});
jQuery('.customDropDown .button').on('click','a.select-list-link', function()
{
jQuery('.customDropDown ul li').slideToggle();
});

