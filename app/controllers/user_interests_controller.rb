class UserInterestsController < ApplicationController
  
  def new
  	@user = current_user
  	@userInterest = UserInterest.new
  	@interestOptions = Interest.all.map{|u| [ u.name, u.id] }
  end

  def create
  	@userInterest = UserInterest.new(userInterest_params)
  	if @userInterest.save
  		redirect_to manageProfileContent_path
  	else
  		render'new'
  	end

  end



  private

    def userInterest_params
      params.require(:user_interest).permit(:user_id, :interest_id)
    end
end
