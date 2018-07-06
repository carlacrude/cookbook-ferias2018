require 'rails_helper'

feature 'User edit recipe' do
  scenario 'successfully' do 
    
    cuisine = Cuisine.create(name: 'Africana')
    recipe_type = RecipeType.create(name: 'Entrada')

    recipe = Recipe.create(title: 'Ensopado de galinha africanesa', 
                        recipe_type: recipe_type, 
                        cuisine: cuisine, 
                        difficulty: 'diífil', 
                        cook_time: 120, 
                        ingredients: 'Galinha, açúcar mascavo, legumes', 
                        cook_method: 'Cozinhe tudo e seja feliz!')
    
    visit root_path
    click_on recipe.title
    click_on 'Editar'

    fill_in 'Tempo de Preparo', with: '60'
    fill_in 'Dificuldade', with: 'fácil'
    fill_in 'Ingredientes', with: 'Amor'
    fill_in 'Título', with: 'Africaninha'
    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Suas alterações foram salvas com sucesso!')
    expect(page).to have_css('h1', text: 'Africaninha')
    expect(page).to have_css('h3', text: 'Detalhes')
    expect(page).to have_css('p', text: recipe.recipe_type.name)
    expect(page).to have_css('p', text: recipe.cuisine.name)
    expect(page).to have_css('p', text: 'fácil')
    expect(page).to have_css('p', text: "60 minutos")
    expect(page).to have_css('h3', text: 'Ingredientes')
    expect(page).to have_css('p', text: 'Amor')
    expect(page).to have_css('h3', text: 'Como Preparar')
    expect(page).to have_css('p', text: recipe.cook_method)
  end
  
  
  scenario 'and must fill in title' do
    cuisine = Cuisine.create(name: 'Francesa')
    recipe_type = RecipeType.create(name: 'Prato principal')
    recipe = Recipe.create(title: 'Pipoquê', )
  end

end
