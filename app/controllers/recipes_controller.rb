class RecipesController < ApplicationController
  def show
    id = params[:id]
    @recipe = Recipe.find(id)
  end

  def new
    @recipe = Recipe.new
    @cuisines = Cuisine.all
  end

  def create
    @r = Recipe.new(recipe_params) 
    @r.save()
    redirect_to recipe_path(@r.id)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :recipe_type, :cuisine_id, :difficulty, :cook_time, :ingredients, :cook_method)
  end
end
