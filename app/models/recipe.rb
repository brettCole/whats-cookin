class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipes_ingredients
  has_many :ingredients, through: :recipes_ingredients
end
