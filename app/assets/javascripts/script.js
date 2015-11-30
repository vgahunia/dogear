

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
		// $(".vel-button").mousedown(function() {
		// 	$(this).velocity("shadowOut");
		// })

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

/*!
 * hoverIntent v1.8.0 // 2014.06.29 // jQuery v1.9.1+
 * http://cherne.net/brian/resources/jquery.hoverIntent.html
 *
 * You may use hoverIntent under the terms of the MIT license. Basically that
 * means you are free to use hoverIntent as long as this header is left intact.
 * Copyright 2007, 2014 Brian Cherne
 */
(function($){$.fn.hoverIntent=function(handlerIn,handlerOut,selector){var cfg={interval:100,sensitivity:6,timeout:0};if(typeof handlerIn==="object"){cfg=$.extend(cfg,handlerIn)}else{if($.isFunction(handlerOut)){cfg=$.extend(cfg,{over:handlerIn,out:handlerOut,selector:selector})}else{cfg=$.extend(cfg,{over:handlerIn,out:handlerIn,selector:handlerOut})}}var cX,cY,pX,pY;var track=function(ev){cX=ev.pageX;cY=ev.pageY};var compare=function(ev,ob){ob.hoverIntent_t=clearTimeout(ob.hoverIntent_t);if(Math.sqrt((pX-cX)*(pX-cX)+(pY-cY)*(pY-cY))<cfg.sensitivity){$(ob).off("mousemove.hoverIntent",track);ob.hoverIntent_s=true;return cfg.over.apply(ob,[ev])}else{pX=cX;pY=cY;ob.hoverIntent_t=setTimeout(function(){compare(ev,ob)},cfg.interval)}};var delay=function(ev,ob){ob.hoverIntent_t=clearTimeout(ob.hoverIntent_t);ob.hoverIntent_s=false;return cfg.out.apply(ob,[ev])};var handleHover=function(e){var ev=$.extend({},e);var ob=this;if(ob.hoverIntent_t){ob.hoverIntent_t=clearTimeout(ob.hoverIntent_t)}if(e.type==="mouseenter"){pX=ev.pageX;pY=ev.pageY;$(ob).on("mousemove.hoverIntent",track);if(!ob.hoverIntent_s){ob.hoverIntent_t=setTimeout(function(){compare(ev,ob)},cfg.interval)}}else{$(ob).off("mousemove.hoverIntent",track);if(ob.hoverIntent_s){ob.hoverIntent_t=setTimeout(function(){delay(ev,ob)},cfg.timeout)}}};return this.on({"mouseenter.hoverIntent":handleHover,"mouseleave.hoverIntent":handleHover},cfg.selector)}})(jQuery);

