	// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.

//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require jquery-ui
//= require velocity
//= require underscore
//= require gmaps/google
//= require_tree .


$(document).on('page:change', function(event) {
	// alert("CHANGED");

	$('.favorite').click(function() {
		$(this).parent().text("Added!");
	})

	$('.unfinished').click(function() {
		$(this).parent().text("Added!");
	})


	$('#stores').click(function(){
		// alert("NAVIGATION");

		if(navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(function(position) {
				var initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
				send_data(position)
			}, function() {
      // handleNoGeolocation(browserSupportFlag);
    });
		}



		function send_data(position) {
			var lat = position.coords.latitude;
			var lng = position.coords.longitude;
			var array = [lat, lng];
			$.ajax({
				url : "/submit_map",
				type : "post",
				data : { data_value1: lat, data_value2: lng}
			});
      // alert(lat + " and " + lng);

    }

  });
});