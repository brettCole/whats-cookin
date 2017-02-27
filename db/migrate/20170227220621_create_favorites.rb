class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.belongs_to :recipe_id, index: true
      t.belongs_to :user_id, index: true

    end
  end
end
