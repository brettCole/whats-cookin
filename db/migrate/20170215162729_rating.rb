class Rating < ActiveRecord::Migration[5.0]
  def change
    create_table :rating do |t|
      t.integer :user_id
      t.integer :recipe_id
      t.integer :rating
      t.text :review
    end
  end
end
