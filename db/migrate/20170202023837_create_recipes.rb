class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :directions
      t.integer :user_id
      t.integer :ingredient_id
      t.boolean :vegan
      t.boolean :gluten_free

      t.timestamps
    end
  end
end
