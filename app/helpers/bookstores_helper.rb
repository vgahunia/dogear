require 'net/http'
require 'json'

module BookstoresHelper

	def fetch_bookstore(param_uri)
		puts "STEP 2 BOOK"
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
		puts "STEP 1 BOOK"
		google_key = "AIzaSyBaJtbomXSbXvFdo2AlDisHhhrjeipE398"
		puts url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{lng}&radius=600&types=book_store&key=#{google_key}"
		fetch_bookstore(url)
	end

	def find_libs(lat, lng)
		puts "STEP 1"
		google_key = "AIzaSyBaJtbomXSbXvFdo2AlDisHhhrjeipE398"
		fetch_library("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{lng}&radius=600&types=library&key=AIzaSyBaJtbomXSbXvFdo2AlDisHhhrjeipE398")
	end
	
end
