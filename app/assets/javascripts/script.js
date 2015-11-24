
$(document).ready(function() {
	$('#header_menu li').mouseover(function() {
		$(this).find("a").css("color", "rgb(127, 23, 31)");
	})
	$('#header_menu li').mouseout(function() {
		$(this).find("a").css("color", "white");
	})
})

