class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	validates :fname,:lname,  presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
	validates :age, presence: true, length: { maximum:3}
	has_secure_password	
	validates :password, length: { minimum: 6 }
end