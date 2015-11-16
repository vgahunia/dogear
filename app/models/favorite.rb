class Favorite < ActiveRecord::Base
	belongs_to :book
	counter_culture :book
	
	belongs_to :user
end
