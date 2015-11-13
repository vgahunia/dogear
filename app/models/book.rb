class Book < ActiveRecord::Base

	has_many :readers, through: :favorites, source: :user
	has_many :favorites

	has_many :haters, through: :unfinisheds, source: :user
	has_many :unfinisheds
	
	validates_uniqueness_of :gr_id

end
