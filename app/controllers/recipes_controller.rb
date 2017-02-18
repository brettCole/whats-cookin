class RecipesController < ApplicationController

  def index
  end

  def new
    @user = current_user
    @recipe = @user.recipes.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save
  end

  def show
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :directions, :vegan, :description, :ingredients => [:name])
  end

end
