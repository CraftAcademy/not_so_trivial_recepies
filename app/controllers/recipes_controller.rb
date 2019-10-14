class RecipesController < ApplicationController
  def index
    @recipes = FoodService.get_recipes(params[:search])
  end

  def show
    @recipe = FoodService.get_ingredients(params[:id])
  end

  private
  def recipe_params
    params.require(:recipe).permit(:search)
  end
end 
