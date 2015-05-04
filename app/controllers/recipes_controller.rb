class RecipesController < ApplicationController
	before_action :find_recipe, only: [:show, :edit, :update, :destroy]

	def index
		@recipe = Recipe.all.order("created_at DESC")
		
	end

	def show
		@user = User.find(@recipe.user.id)

	end

	def new
		if logged_in?
			@recipe = current_user.recipes.build
		else
			redirect_to login_path,  notice: "Please log in to add recipes or create a new profile"
		end

	end

	def create
		@recipe = current_user.recipes.build(recipe_params)

		if @recipe.save
			redirect_to @recipe, notice: "Successfully created new recipe"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @recipe.update(recipe_params)
			redirect_to @recipe
		else
			render 'edit'
		end
	end

	def destroy
		@recipe.destroy
		redirect_to allRecipes_path, notice: "Successfully deleted recipe"
	end

	private

	def recipe_params
		params.require(:recipe).permit(:title, :description, :picture, ingredients_attributes: [:id, :name, :_destroy], directions_attributes: [:id, :name, :_destroy])
	end

	def find_recipe
		@recipe = Recipe.find(params[:id])
	end
end
