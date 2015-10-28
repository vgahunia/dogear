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
		fetch_data_and_parse("https://www.goodreads.com/search.xml?key=RSjLxvyJFAhMMBuVWzAg&q=#{URI.encode(term)}")
	end

	def pull_title_and_id(parsed)
		puts "STEP 3"
		books = parsed["results"]
	end

	def search_by_author(param_id)
		my_url = "https://itunes.apple.com/lookup?id=#{param_id}"
		uri = URI(my_url)
		fetch_data_and_parse(uri)
	end

end