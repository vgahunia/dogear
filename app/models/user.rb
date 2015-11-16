class User < ActiveRecord::Base

	has_many :favorite_books, -> { distinct }, through: :favorites, source: :book
	has_many :favorites

	has_many :hated_books, -> { distinct }, through: :unfinisheds, source: :book
	has_many :unfinisheds

	# validates_uniqueness_of :favorite
	# validates_uniqueness_of :unfinished

	before_save { self.email = email.downcase }
	validates(:first_name, presence: true)
	validates(:last_name, presence: true)

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates(:email, presence: true, uniqueness: { case_sensitive: false })
	validates(:email, length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX })

	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
	

	def check_lists
		
	end
end
