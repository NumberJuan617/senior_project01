class TvshowsController < ApplicationController
	def new
		if logged_in?
			@tvshow = Tvshow.new
		else
			redirect_to root_url
		end
	end

	def create
		@tvshow = Tvshow.new(tvshow_params)
		if @tvshow.save
			redirect_to manageProfileContent_path
			flash[:success] = "Television Show added. Please add it to your profile"

		else
			#error validation
			redirect_to addNewTvshow_path
			flash[:danger] = "Failed to add a new Television Show because it already exists or the entry was empty! "
		end
	end

	def destroy
		if !(params[:id].nil?) #if what we are going to delete is not nil or null
			@tvshow = Tvshow.find(params[:id])
			@tvshow.destroy
			redirect_to manageProfileContent_path
			flash[:success] = "Television Show deleted"
		else
			flash[:danger] = "Failed to remove Television Show"
		end	
	end


	private

	def tvshow_params
		params.require(:tvshow).permit(:name)
	end
end
