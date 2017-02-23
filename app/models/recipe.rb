class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredient_recipes
  has_many :ingredients, through: :ingredient_recipes

  def ingredients_attributes=(ingredient_attributes)
    ingredient_attributes.values.each do |attr|
      unless attr['name'] == ""
        ingredient = Ingredient.where(name: attr[:name].downcase).first_or_create
        self.ingredients << ingredient
      end
    end
  end

end
