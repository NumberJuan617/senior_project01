class InterestsController < ApplicationController
  def new
    if logged_in?
      @interest = Interest.new
    else
      redirect_to root_url
    end
  end

  def create
  	@interest = Interest.new(interest_params)
    if @interest.save
		redirect_to manageProfileContent_path
		flash[:success] = "Interest added"

    else
    	#error validation

		redirect_to addNewInterest_path
		flash[:danger] = "Failed to add Interest because it already exists"

    end
  	
  end

  def destroy
  	
  	if !(params[:id].nil?) #if what we are going to delete is not nil or null
		@interest = Interest.find(params[:id])
		@interest.destroy
		redirect_to manageProfileContent_path
	    flash[:success] = "Interest deleted"
	else
		redirect_to manageProfileContent_path
	    flash[:danger] = "Failed to remove Interest"

  	end
  	

  end



private
    def interest_params
      params.require(:interest).permit(:name)
    end

end
