class MoviesController < ApplicationController
  def new
  	@movie = Movie.new
  end

  def create
  	@movie = Movie.new(movie_params)
    if @movie.save
      redirect_to manageProfileContent_path
      flash[:success] = "Movie added"

    else
      render manageProfileContent_path
      flash[:error] = "Failed to add Movie"
    end
  end

  def destroy
  	if !(params[:id].nil?) #if what we are going to delete is not nil or null
  		@movie = Movie.find(params[:id])
  		@movie.destroy
  		redirect_to manageProfileContent_path
  		flash[:success] = "Movie deleted"
  	else
  		flash[:error] = "Failed to remove movie"
  	end	
  end


  private

  def movie_params
	  params.require(:movie).permit(:name)
  end

end
