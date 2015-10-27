class APIS::Goodreads

	def fetch_data_and_parse(param_uri)
		puts "STEP 2"
		uri = URI(param_uri)
		response = Net::HTTP.get(uri)
		parsed = JSON.parse(response)
		pull_title_and_id(parsed)
	end

	def search_by_title(term)
		puts "STEP 1"
		fetch_data_and_parse("https://itunes.apple.com/search?term=#{URI.encode(term)}")
	end

	def pull_title_and_id(parsed)
		puts "STEP 3"
		songs = parsed["results"]
	end

	def search_by_id(param_id)
		my_url = "https://itunes.apple.com/lookup?id=#{param_id}"
		uri = URI(my_url)
		fetch_data_and_parse(uri)
	end

end