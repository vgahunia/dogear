require 'net/http'
require 'json'

module BookstoresHelper

	def fetch_bookstore(param_uri)
		puts "STEP 2"
		uri = URI(param_uri)
		response = Net::HTTP.get(uri)
		parsed = JSON.parse(response)
		stores = parsed["results"]
	end

	def fetch_library(param_uri)
		puts "STEP 2"
		uri = URI(param_uri)
		response = Net::HTTP.get(uri)
		parsed = JSON.parse(response)
		libs = parsed["results"]
	end

	def find_stores(lat, lng)
		puts "STEP 1"
		google_key = "AIzaSyASxafxwznhB7vSt8kPMYb88QMCzvRxpuU"
		fetch_bookstore("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=39.952306899999996,-75.1695926&radius=400&types=book_store&key=#{google_key}")
	end

	def find_libs(lat, lng)
		puts "STEP 1"
		google_key = "AIzaSyASxafxwznhB7vSt8kPMYb88QMCzvRxpuU"
		fetch_library("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=39.9522408,-75.1695926&radius=400&types=library&key=#{google_key}")
	end
	
end
