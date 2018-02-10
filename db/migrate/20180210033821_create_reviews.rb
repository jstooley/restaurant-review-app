class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :restaurant_id
      t.integer :user_id

      t.string :title
      t.text :content
      t.integer :rating

      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
