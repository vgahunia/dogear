class Genre < ActiveRecord::Base

	has_and_belongs_to_many :users, :join_table => :genres_users, dependent: :destroy

end
