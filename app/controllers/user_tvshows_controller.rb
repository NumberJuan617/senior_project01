class UserTvshowsController < ApplicationController
  def new
  	@user = current_user
  	@userTvshow = UserTvshow.new
  	@tvshowOptions = Tvshow.all.map{|u| [ u.name, u.id] }
  	@userTvshowOptions = Array.new


  	@isThere = false;

  	@tvshowOptions.each do |tv|#for every movie in the db
  		if !(@user.user_tvshows.where("tvshow_id ="+tv[1].to_s).exists?)#check if the user does not have the movie
  			#if true
  			@tvshow = Tvshow.find(tv[1])#gather the movie the user does not have
  			@temp = Array.new#make a new array
  			@temp.push(@tvshow.name, @tvshow.id)#use the new array to hold the movie object for us
  			@userTvshowOptions.push(@temp)#add the movie to a list of movies that the user does not have
  			@isThere = true#means there are movies to add
		  end
    end


  	if !(@isThere)
    	flash[:danger] = "There are no new tv shows to add"
    	redirect_to addNewTvshow_path
  	end	
  end

  def create
  	@userTvshow = UserTvshow.new(userTvshow_params)
    if @userTvshow.save
      redirect_to manageProfileContent_path
    else
      render'new'
    end
  end

  def destroy
  	 if !(params[:id].nil?) #if what we are going to delete is not nil or null
      @userTvshow = UserTvshow.find(params[:id])
      @userTvshow.destroy
      redirect_to addTvshow_path
      flash[:success] = "TV Show deleted"
    else
      redirect_to manageProfileContent_path
      flash[:error] = "Failed to remove TV show"
    end
  end

  private

	def userTvshow_params
		params.require(:user_tvshow).permit(:user_id, :tvshow_id)
	end

end