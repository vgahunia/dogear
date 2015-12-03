class Favorite < ActiveRecord::Base
	belongs_to :book
	counter_culture :book
	
	belongs_to :user
	acts_as_list scope: :user, add_new_at: :top
end
