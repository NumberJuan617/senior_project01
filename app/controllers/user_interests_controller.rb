class UserInterestsController < ApplicationController
    before_action :logged_in_user, only: [:new, :create, :destroy]
    before_action :correct_user,   only: :destroy
    
    def new
      if logged_in?
        @user = current_user
        @userInterest = UserInterest.new
        @interestOptions = Interest.all.map{|u| [ u.name, u.id] }

        @userInterestOptions = Array.new


        @isThere = false;
        @interestOptions.each do |io|
        if !(@user.user_interests.where("interest_id ="+io[1].to_s).exists?)
          @intrst = Interest.find(io[1])
          @temp = Array.new
          @temp.push(@intrst.name, @intrst.id)
          @userInterestOptions.push(@temp)
          @isThere = true
          end
        end

        if !(@isThere)
          flash[:danger] = "There are no new interests to add"
          redirect_to manageProfileContent_path
        end
      else
        redirect_to root_url
      end
    end

  def create
    @userInterest = UserInterest.new(userInterest_params)
    if @userInterest.save
      redirect_to manageProfileContent_path
      flash[:success] = "Interest added"

    else
      redirect_to manageProfileContent_path
      flash[:danger] = "Failed to add Book"
    end

  end

  def destroy

    if !(params[:id].nil?) #if what we are going to delete is not nil or null
      @userInterest = UserInterest.find(params[:id])
      @userInterest.destroy
      redirect_to manageProfileContent_path
      flash[:success] = "Interest deleted"
    else
      redirect_to manageProfileContent_path
      flash[:danger] = "Failed to remove Interest"
    end
  end



  private

    def userInterest_params
      params.require(:user_interest).permit(:user_id, :interest_id)
    end

    def correct_user
    @userInterest = current_user.interests.find_by(id: params[:id])
    redirect_to manageProfileContent_path if @userInterest.nil?
  end
end
