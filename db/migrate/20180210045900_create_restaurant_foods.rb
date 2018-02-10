class CreateRestaurantFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurant_foods do |t|
      t.integer :food_type_id
      t.integer :restaurant_id

      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
