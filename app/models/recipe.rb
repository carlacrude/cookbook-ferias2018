class Recipe < ApplicationRecord
  belongs_to :cuisine
  validates :title, presence: true
  validates :recipe_type, presence: true
  validates :difficulty, presence: true
  validates :cook_time, presence: true
  validates :ingredients, presence: true
  validates :cook_method, presence: true
end
