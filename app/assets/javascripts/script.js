
$(document).ready(function() {

	$('#header_menu li').mouseover(function() {
		$(this).find("a").css("color", "rgb(127, 23, 31)");
	})
	$('#header_menu li').mouseout(function() {
		$(this).find("a").css("color", "white");
	})

	// LOGO CHANGE IMAGE ON HOVER

	$('#x').mouseover(function() {
		$(this).attr("src") = "logo_hover.png";
	})

})

var ready;
ready = function(){
    // call sortable on our div with the sortable class
    $('.sortable').sortable();
}

$(document).ready(ready);
/**
 * if using turbolinks
 */
$(document).on('page:load', ready);

