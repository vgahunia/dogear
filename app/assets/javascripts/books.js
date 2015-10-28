

$(document).ready(function() {
	bookMap = Gmaps.build('Google');
	bookMap.buildMap({ 
		provider: {}, internal: {id: 'map'}}, 
		function(){

			// ---------GEOLOCATION API FUNCTIONS ------------

			var x = document.getElementById("message");
			function getLocation() {
			    if (navigator.geolocation) {
			        navigator.geolocation.getCurrentPosition(findPosition);
			    } else {
			        x.innerHTML = "Geolocation is not supported by this browser.";
			    }
			}

			function findPosition(position) {
			    var latitude = position.coords.latitude; 
			    var longitude = position.coords.longitude;
			    x.innerHTML = latitude + "," + longitude;
			}

			//---------- END GEOLOCATION --------------

			getLocation();
		  markers = bookMap.addMarkers([
		    {
		      "lat": latitude,
		      "lng": longitude,
		      "picture": {
		        "url": "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png"
		      }
		    }
		  ]);
		  bookMap.bounds.extendWith(markers);
		  bookMap.fitMapToBounds();
		});


})
