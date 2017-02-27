class Rating < ActiveRecord::Migration[5.0]
  def change
    create_table :rating do |t|
      t.integer :recipe_id
      t.integer :rating
      t.integer :user_id
      t.text :review

      t.timestamps
    end
  end
end
