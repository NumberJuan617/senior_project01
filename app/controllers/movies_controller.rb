class MoviesController < ApplicationController
  def new
    if logged_in? 
      @movie = Movie.new
    else
      redirect_to root_url
    end
  end

  def create
  	@movie = Movie.new(movie_params)
    if @movie.save
      redirect_to manageProfileContent_path
      flash[:success] = "Movie added"

    else
      redirect_to addNewMovie_path
      flash[:danger] = "Failed to add new Movie because it already exists or the entry was empty! "
    end
  end

  def destroy
  	if !(params[:id].nil?) #if what we are going to delete is not nil or null
  		@movie = Movie.find(params[:id])
  		@movie.destroy
  		redirect_to manageProfileContent_path
  		flash[:success] = "Movie deleted"
  	else
  		flash[:danger] = "Failed to remove movie"
  	end	
  end


  private

  def movie_params
	  params.require(:movie).permit(:name)
  end

end
