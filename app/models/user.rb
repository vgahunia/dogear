class User < ActiveRecord::Base

	has_many :books

	before_save { self.email = email.downcase }
	validates(:first_name, presence: true)
	validates(:last_name, presence: true)

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates(:email, presence: true, uniqueness: { case_sensitive: false })
	validates(:email, length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX })

	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }
	
end
