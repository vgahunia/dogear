

$(document).ready(function() {

	// ---------GEOLOCATION API FUNCTIONS ------------

	var x = document.getElementById("message");
	function getLocation() {
	    if (navigator.geolocation) {
	        navigator.geolocation.getCurrentPosition(showPosition, showError);
	    } else {
	        x.innerHTML = "Geolocation is not supported by this browser.";
	    }
	}

	function showPosition(position) {
    var latlon = position.coords.latitude + "," + position.coords.longitude;

    var img_url = "http://maps.googleapis.com/maps/api/staticmap?center="
    +latlon+"&zoom=14&size=400x300&sensor=false";
    document.getElementById("map").innerHTML = "<img src='"+img_url+"'>";
   }

  function showError(error) {
    switch(error.code) {
        case error.PERMISSION_DENIED:
            x.innerHTML = "User denied the request for Geolocation."
            break;
        case error.POSITION_UNAVAILABLE:
            x.innerHTML = "Location information is unavailable."
            break;
        case error.TIMEOUT:
            x.innerHTML = "The request to get user location timed out."
            break;
        case error.UNKNOWN_ERROR:
            x.innerHTML = "An unknown error occurred."
            break;
    }
  }
  getLocation();
})
	
	// mapBuild();

	// 		//---------- END GEOLOCATION --------------

	// function mapBuild() {
	// 	bookMap = Gmaps.build('Google');
	// 	bookMap.buildMap({ 
	// 		provider: {}, internal: {id: 'map'}}, 
	// 		function(){
	// 		  markers = bookMap.addMarkers([
	// 		    {
	// 		      "lat": 39.9521369,
	// 		      "lng": -75.1698016,
	// 		      "picture": {
	// 		        "url": "../assets/iamges/marker.ico",
	// 		        "width":  36,
 //        			"height": 36
	// 		      }
	// 		    }
	// 		  ]);
	// 		  bookMap.getMap().setZoom(12);
	// 		  bookMap.bounds.extendWith(markers);
	// 		  bookMap.fitMapToBounds();
	// 		});
	// }


