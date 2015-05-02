class Tvshow < ActiveRecord::Base
	has_many :user_tvshows
	has_many :users, through: :user_tvshows

	validates :name, presence: true, length: { minimum: 2 },
		uniqueness: true
end
