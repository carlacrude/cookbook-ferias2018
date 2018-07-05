class Recipe < ApplicationRecord
  belongs_to :cuisine
  belongs_to :recipe_type

  validates :title, :difficulty, :cook_time, :ingredients, :cook_method, presence: true
end
