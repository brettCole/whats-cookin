class RecipesController < ApplicationController
  before_action :logged_in?

  def index
  end

  def new
    @recipe = Recipe.new
    #@recipe.ingredients.build
    #@ingredients = @recipe.ingredients.build
  end

  def create
    @recipe = current_user.recipes.create(recipe_params)
    #@ingredients = @recipe.ingredients.build
    @recipe.save
    binding.pry
    redirect_to recipe_path(@recipe)
  end

  def show
    @recipe = Recipe.find_by(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :directions, :vegan, :description, :ingredients_attributes => [:name])
  end

end
