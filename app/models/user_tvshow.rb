class UserTvshow < ActiveRecord::Base
	belongs_to :user
	belongs_to :tvshow
end
