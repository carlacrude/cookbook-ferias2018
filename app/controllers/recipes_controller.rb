class RecipesController < ApplicationController
  def show
    id = params[:id]
    @recipe = Recipe.find(id)
  end

  def new
    @recipe = Recipe.new
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    
    if @recipe.save
      redirect_to recipe_path(@recipe.id)
    else
      @cuisines = Cuisine.all
      @recipe_types = RecipeType.all
      flash[:error] = 'Você deve informar todos os dados da receita'
      render 'new'
    end
  end

  def edit
    @recipe_types = RecipeType.all
    @cuisines = Cuisine.all
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    
    if @recipe.update(recipe_params) 
      flash[:notice] = 'Suas alterações foram salvas com sucesso!'
      redirect_to recipe_path(@recipe.id)
    else
      @cuisines = Cuisine.all
      @recipe_types = RecipeType.all
      flash[:alert] = 'Você deve informar todos os dados da receita'
      render :edit
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :recipe_type_id, :cuisine_id, :difficulty, :cook_time, :ingredients, :cook_method)
  end
end
