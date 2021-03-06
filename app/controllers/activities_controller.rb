class ActivitiesController < ApplicationController
  def new
    if logged_in?
    	@activity = Activity.new
    else
      redirect_to root_url
    end
  end

  def create
  	@activity = Activity.new(activity_params)
    if @activity.save
      redirect_to manageProfileContent_path
      flash[:success] = "Activity added"

      #tell the user we updated their profile
    else
      redirect_to addNewActivity_path
      flash[:error] = "Failed to add Activity because it already exists or the entry was empty!"

    end
  	
  end

  def destroy
    
    if !(params[:id].nil?) #if what we are going to delete is not nil or null
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to manageProfileContent_path
    flash[:success] = "Activity deleted"

  else
     flash[:error] = "Failed to remove activity"

  end
    

  end



private
    def activity_params
      params.require(:activity).permit(:name)
    end
end
