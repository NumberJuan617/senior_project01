class Sport < ActiveRecord::Base
	has_many :user_sports
	has_many :users, through: :user_sports

	validates :name, presence: true, length: { minimum: 2 },
		uniqueness: true
end
