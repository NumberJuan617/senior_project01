class UserMoviesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]
  
  def new
    if logged_in? 
    	@user = current_user
    	@userMovie = UserMovie.new
    	@movieOptions = Movie.all.map{|u| [ u.name, u.id] }
    	@userMovieOptions = Array.new


    	@isThere = false;

      @movieOptions.each do |mo|#for every movie in the db
      	if !(@user.user_movies.where("movie_id ="+mo[1].to_s).exists?)#check if the user does not have the movie
      		#if true
      		@movie = Movie.find(mo[1])#gather the movie the user does not have
      		@temp = Array.new#make a new array
      		@temp.push(@movie.name, @movie.id)#use the new array to hold the movie object for us
      		@userMovieOptions.push(@temp)#add the movie to a list of movies that the user does not have
      		@isThere = true#means there are movies to add
          end
      end

    	if !(@isThere)
      	flash[:danger] = "There are no new movies to add"
      	redirect_to addNewMovie_path
    	end
    else
      redirect_to root_url
    end
  end

  def create
  	@userMovie = UserMovie.new(userMovie_params)
    if @userMovie.save
      redirect_to manageProfileContent_path
      flash[:success] = "Movie added"

    else
      redirect_to manageProfileContent_path
      flash[:danger] = "Failed to add Movie"
    end

  	
  end

  def destroy

    if !(params[:id].nil?) #if what we are going to delete is not nil or null
      @userMovie = UserMovie.find(params[:id])
      @userMovie.destroy
      redirect_to manageProfileContent_path
      flash[:success] = "Movie deleted"
    else
      redirect_to manageProfileContent_path
      flash[:danger] = "Failed to remove Movie"
    end
  end



  private

    def userMovie_params
      params.require(:user_movie).permit(:user_id, :movie_id)
    end

end
