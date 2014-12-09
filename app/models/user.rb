class User < ActiveRecord::Base
	before_save { self.email = email.downcase }#call back function that ensures the email format is lowercase or downcase 
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :fname,:lname,  presence: true, length: { maximum: 50 }
	validates :email, presence: true, length: { maximum: 255 },  
				format: { with: VALID_EMAIL_REGEX }, 
				uniqueness: { case_sensitive: false }
	validates :age, presence: true, length: { maximum:4 }

end
