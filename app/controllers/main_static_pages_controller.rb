class MainStaticPagesController < ApplicationController
  def home
    #home will show the parallax bootstrap effect 
    @users = User.all
        
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
