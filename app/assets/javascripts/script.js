

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

		$.Velocity
		.RegisterEffect("shadowIn", {
			defaultDuration: 600,
			calls: [
				[ { backgroundColor: "rgb(100, 100, 100)" }, 0.4 ],
				[ { opacity: .7, scale: 1.4, rotateZ: "-30deg" }, 0.6 ]
			]
		})

		.RegisterEffect("shadowBack", {
			defaultDuration: 400,
			calls: [
				[ { rotateZ: "0deg", opacity: 1, scale: 1 }, 1.0]
			]
		})

		.RegisterEffect("shadowOut", {
			defaultDuration: 500,
			calls: [
				[ { rotateZ: "0deg" }, 0.4 ],
				[ { opacity: 0, scale: 0 }, 0.6 ]
			]
		});

		$(".vel-button").mouseover(function() {
			$(this).velocity("shadowIn");
		})
		$(".vel-button").mouseout(function() {
			$(this).velocity("shadowBack");
		})
		$(".vel-button").mousedown(function() {
			$(this).velocity("shadowOut");
		})
		

}

$(document).ready(ready);
/**
 * if using turbolinks
 */
$(document).on('page:load', ready);

