

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
				[ { opacity: .9, scale: .8, rotateZ: "-5deg" }, 1.0 ]
			]
		})

		.RegisterEffect("shadow_1_In", {
			defaultDuration: 600,
			calls: [
				[ { opacity: .9, scale: .9, rotateZ: "-5deg" }, 1.0 ]
			]
		})

		.RegisterEffect("shadowBack", {
			defaultDuration: 400,
			calls: [
				[ { rotateZ: "0deg", opacity: 1, scale: 1 } ]
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

		$(".vel-button1").mouseover(function() {
			$(this).velocity("shadow_1_In");
		})
		$(".vel-button1").mouseout(function() {
			$(this).velocity("shadowBack");
		})
		

}

$(document).ready(ready);
/**
 * if using turbolinks
 */
$(document).on('page:load', ready);

