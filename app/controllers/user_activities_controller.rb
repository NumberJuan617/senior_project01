class UserActivitiesController < ApplicationController
	before_action :logged_in_user, only: [:new, :create, :destroy]
    before_action :correct_user,   only: :destroy

	def new
		if logged_in?
		  	@user = current_user
		  	@userActivity = UserActivity.new
		  	@activityOptions = Activity.all.map{|u| [ u.name, u.id] }

			@userActivityOptions = Array.new


			@isThere = false;
			@activityOptions.each do |ao|
			  if !(@user.user_activities.where("activity_id ="+ao[1].to_s).exists?)
			      @activity = Activity.find(ao[1])
			      @temp = Array.new
			      @temp.push(@activity.name, @activity.id)
			      @userActivityOptions.push(@temp)
			      @isThere = true
			  end
			end

			if !(@isThere)
			  flash[:danger] = "There are no new activities to add"
			  redirect_to manageProfileContent_path
			end
		else
			redirect_to root_url 
		end
	 end

 	def create
	  	@userActivity = UserActivity.new(userActivity_params)
	  	if @userActivity.save
	  		redirect_to manageProfileContent_path
	  	else
	  		redirect_to manageProfileContent_path
			flash[:danger] = "Failed to add Activity"
	  	end
  	end

  	def destroy
		if !(params[:id].nil?) #if what we are going to delete is not nil or null
			@userActivity = UserActivity.find(params[:id])
			@userActivity.destroy
			redirect_to manageProfileContent_path
			flash[:success] = "Activity deleted"
		else
			redirect_to manageProfileContent_path
			flash[:danger] = "Failed to remove Interest"

		end
  	end



  	private

    def userActivity_params
      params.require(:user_activity).permit(:user_id, :activity_id)
    end


    def correct_user
		@userActivity = current_user.activities.find_by(id: params[:id])
		redirect_to manageProfileContent_path if @userActivity.nil?
	end
end
