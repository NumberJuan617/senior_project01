class UserEditsController < ApplicationController
  def home
  	#method where the user will be able to see the content on their profile and get directed to the right location
  	#show all of the users current recipes, sports, interests, activities, and sofourth 
  	@user = current_user
    #gather all of the current users profile content
    @userInterestsBoard = @user.user_interests
    @userActivitiesBoard = @user.user_activities
    @userSportsBoard = @user.user_sports
    @userMoviesBoard = @user.user_movies
    @userBooksBoard = @user.user_books
    @userTvshowsBoard = @user.user_tvshows

    @tvshows = Tvshow.all

    #user information to add within the page

  end

  def add
  	#method where the user will be able to add interests, sports, activities, and sofourth 


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
