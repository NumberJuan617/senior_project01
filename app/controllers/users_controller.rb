class UsersController < ApplicationController
	 before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]
#only permit the user to edit and update their profile if they are logged in
  	before_action :correct_user,   only: [:edit, :update]#ensures the correct user before editing anyone
  	before_action :admin_user,     only: :destroy
  	include UsersHelper
  	
  	def index
  		@users = User.paginate(page: params[:page], :per_page => 10)
  	end

	def show
		@user = User.find(params[:id])
	    @userMicroposts = @user.microposts.paginate(page: params[:page] , :per_page => 10)
		#user profile content below
      	@micropost = current_user.microposts.build if logged_in?

		@userActivities = @user.user_activities.all
		@userInterests = @user.user_interests.all
		@userSports = @user.user_sports.all
		@userMovies = @user.user_movies.all
		@userBooks = @user.user_books.all
		@userTvshows = @user.user_tvshows.all

		#debugger
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)    # Not the final implementation!
		if @user.save
			@user.send_activation_email
			flash[:info] = "Please check your email to activate your account."
			redirect_to root_url
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

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User deleted"
		redirect_to users_url
	end

	def following
		@title = "Following"
		@user  = User.find(params[:id])
		@users = @user.following.paginate(page: params[:page])
		render 'show_follow'
	end

	def followers
		@title = "Followers"
		@user  = User.find(params[:id])
		@users = @user.followers.paginate(page: params[:page])
		render 'show_follow'
	end

	private

	

    def user_params
      params.require(:user).permit(:fname, :lname, :age, :email, :bio, :street, :gender, :state, :phone,  :city, :zip, :country, :password,
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

 	# Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end



end
