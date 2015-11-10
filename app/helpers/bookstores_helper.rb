require 'net/http'
require 'json'

module BookstoresHelper

	def fetch_data_and_parse(param_uri)
		puts "STEP 2"
		uri = URI(param_uri)
		puts uri
		puts "***********************************"
		puts uri
		response = Net::HTTP.get(uri)
		parsed = JSON.parse(response)
	end

	def find_stores(lat, lng)
		puts "STEP 1"
		google_key = "AIzaSyASxafxwznhB7vSt8kPMYb88QMCzvRxpuU"
		fetch_data_and_parse("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670,151.1957&radius=15&types=food&name=cruise&key=#{google_key}")
	end
	
end
