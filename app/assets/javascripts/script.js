

var ready;
ready = function(){
    
    $('.sortable').sortable();

    $('#header_menu li').mouseover(function() {
			$(this).find("a").css("color", "rgb(127, 23, 31)");
		})
		$('#header_menu li').mouseout(function() {
			$(this).find("a").css("color", "white");
		})

		$('.box').mouseover(function() {
			$(this).find("#hide_target").removeClass('hidden').addClass('search');
		})
		$('.box').mouseout(function() {
			$(this).find("#hide_target").removeClass('search').addClass('hidden');
		})

		$('.box').mouseover(function() {
			$(this).find("#hide_stores").removeClass('hidden').addClass('search');
		})
		$('.box').mouseout(function() {
			$(this).find("#hide_stores").removeClass('search').addClass('hidden');
		})

}

$(document).ready(ready);
/**
 * if using turbolinks
 */
$(document).on('page:load', ready);

