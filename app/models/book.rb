class Book < ActiveRecord::Base

	has_many :books, through: :favorites
	has_many :favorites
	
	validates_uniqueness_of :gr_id

end
