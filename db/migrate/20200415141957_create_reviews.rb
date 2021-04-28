class CreateReviews < ActiveRecord::Migration[6.0]
  create_table :reviews do |t|
    t.text :text
    t.string :name
    t.string :email
    t.boolean :active
    t.float :star, default: 1

    t.timestamps
  end
end
