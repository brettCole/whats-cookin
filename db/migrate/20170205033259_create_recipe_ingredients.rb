class CreateRecipeIngredients < ActiveRecord::Migration[5.0]
  def change
    # create_table :recipe_ingredients do |t|
    #   t.integer :recipe_id
    #   t.integer :ingredient_id
    create_join_table :recipes, :ingredients do |t|
      t.index :recipe_id
      t.index :ingredient_id

      t.timestamps
    end
  end
end
