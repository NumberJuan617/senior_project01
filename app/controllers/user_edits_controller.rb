class UserEditsController < ApplicationController
  def home
  	#method where the user will be able to see the content on their profile and get directed to the right location
  	#show all of the users current recipes, sports, interests, activities, and sofourth 
  	@user = current_user
    @userInterests = @user.interests


    #user information to add within the page
    @activity = Activity.new
    @sport = Sport.new



  	@sports = Sport.all
  	@interests = Interest.all
  	@activities = Activity.all
  end

  def add
  	#method where the user will be able to add interests, sports, activities, and sofourth 

  	#data may end up within def new depending on how this controller is utilized 
  	@user = current_user
  	@sports = Sport.all

  end

  def new

  end

  def create
  end

  def edit
  end

  def update
  end
end
