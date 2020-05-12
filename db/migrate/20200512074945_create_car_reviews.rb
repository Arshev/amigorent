class CreateCarReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :car_reviews do |t|
      t.string :fullname
      t.string :phone
      t.string :email
      t.text :text
      t.boolean :active
      t.float :star, default: 5

      t.references :car, foreign_key: true

      t.timestamps
    end
  end
end
