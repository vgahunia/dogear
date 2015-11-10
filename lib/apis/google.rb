class APIS::Google

	def fetch_data_and_parse(param_uri)
		puts "STEP 2"
		uri = URI(param_uri)
		response = Net::HTTP.get(uri)
		parsed = JSON.parse(response)
	end

	def find_stores(lat, lng)
		puts "STEP 1"
		google_key = "AIzaSyASxafxwznhB7vSt8kPMYb88QMCzvRxpuU"
		fetch_data_and_parse("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-#{lat},#{lng}&radius=15&types=bookstore&key=#{google_key}")
	end

end