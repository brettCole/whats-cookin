class CreateIngredientRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredient_recipes do |t|
      t.belongs_to :recipe, index: true
      t.belongs_to :ingredient, index: true

      t.timestamps
    end
  end
end
