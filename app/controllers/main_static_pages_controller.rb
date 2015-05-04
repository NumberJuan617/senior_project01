class MainStaticPagesController < ApplicationController
  def home
    #home will show the parallax bootstrap effect 
    if logged_in?
      @users = User.all
      @micropost = current_user.microposts.build if logged_in?
      @feed_items = current_user.feed.paginate(page: params[:page], :per_page => 6)
      @user = User.new

    end
  end

  def recipe
    #recipe will be its own controller consisting of ViewRecipes, Edit, Delete,, 
  end

  def resources
  	
  end

  def about

  end

  def contact

  end
  
  
end
