class Interest < ActiveRecord::Base
	has_many :user_interests
	has_many :users, through: :user_interests

	validates :name, presence: true, length: { minimum: 2 },
		uniqueness: true
end
