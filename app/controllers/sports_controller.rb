class SportsController < ApplicationController
  def new
  	@sport = Sport.new
  end

  def create
  	@sport = Sport.new(sport_params)
    if @sport.save
      redirect_to manageProfileContent_path
      flash[:success] = "Sport added"

    else
      render manageProfileContent_path
      flash[:error] = "Failed to add Sport"

    end
  	
  end

  def destroy
    
    if !(params[:id].nil?) #if what we are going to delete is not nil or null
    @sport = Sport.find(params[:id])
    @sport.destroy
    redirect_to manageProfileContent_path
    flash[:success] = "Sport deleted"
    
  else
    flash[:error] = "Failed to remove sport"

  end
    

  end



private
    def sport_params
      params.require(:sport).permit(:name)
    end
end
