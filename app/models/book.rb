class Book < ActiveRecord::Base
	has_many :user_books
	has_many :users, through: :user_books

	validates :name, presence: true, length: { minimum: 2 },
		uniqueness: true
end
