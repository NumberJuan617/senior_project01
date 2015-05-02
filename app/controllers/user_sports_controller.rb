class UserSportsController < ApplicationController
	before_action :logged_in_user, only: [:new, :create, :destroy]
    before_action :correct_user,   only: :destroy
    
	def new
		if logged_in?
			@user = current_user
			@userSport = UserSport.new
			@sportOptions = Sport.all.map{|u| [ u.name, u.id] }

			@userSportOptions = Array.new


			@isThere = false;
			@sportOptions.each do |so|
				if !(@user.user_sports.where("sport_id ="+so[1].to_s).exists?)
					@sport = Sport.find(so[1])
					@temp = Array.new
					@temp.push(@sport.name, @sport.id)
					@userSportOptions.push(@temp)
					@isThere = true
				end
			end
			

			if !(@isThere)
				flash[:danger] = "There are no new sports to add"
				redirect_to manageProfileContent_path
			end
		else
			redirect_to root_url
		end
	end



	def create
		@userSport= UserSport.new(userSport_params)
		if @userSport.save
			redirect_to manageProfileContent_path
			flash[:success] = "Sport added"

		else
			redirect_to manageProfileContent_path
			flash[:danger] = "Failed to add Sport"

		end
	end

	def destroy
		if !(params[:id].nil?) #if what we are going to delete is not nil or null
			@userSport = UserSport.find(params[:id])
			@userSport.destroy
			redirect_to manageProfileContent_path
		    flash[:success] = "Sport deleted"
		else
			redirect_to manageProfileContent_path
		    flash[:danger] = "Failed to remove Sport"

		end
		
	end


	private

	def userSport_params
		params.require(:user_sport).permit(:user_id, :sport_id)
	end

end
