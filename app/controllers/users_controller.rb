class UsersController < ApplicationController
	before_action :logged_in_user, only: [:index, :edit, :update]#only permit the user to edit and update their profile if they are logged in
  	before_action :correct_user,   only: [:edit, :update]#ensures the correct user before editing anyone

  	def index
  		@users = User.all#gathers all of the users in the db model
  	end

	def show
		@user = User.find(params[:id])
		#debugger
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)    # Not the final implementation!
		if @user.save
			# Handle a successful save.
			log_in @user
	      	flash[:success] = "Welcome to the Sample App!"
			redirect_to @user
		else
			render 'new'
		end
	end

	def edit
		@user = current_user
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			flash[:success] = "Current User has been updated"
			redirect_to @user
		else
			render 'edit'
		end
		
	end




	private

    def user_params
      params.require(:user).permit(:fname, :lname, :age, :email, :password,
                                   :password_confirmation)
    end


    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
      	store_location
        flash[:danger] = "You must be logged into My Sweet Spot!"
        redirect_to login_url
      end
    end
    
    #confirms a correct user and avoids a user editing another persons profile
    def correct_user
      @user = current_user
      redirect_to(root_url) unless current_user?(@user)
    end
end
