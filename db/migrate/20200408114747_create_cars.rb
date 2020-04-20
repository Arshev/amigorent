class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :car_name
      t.integer :year
      t.string :color
      t.string :transmission
      t.boolean :is_air, default: false
      t.string :engine_capacity
      t.boolean :is_electropackage, default: false
      t.string :car_class
      t.string :car_type
      t.integer :price_1, default: 0
      t.integer :price_2, default: 0
      t.integer :price_3, default: 0
      t.integer :price_4, default: 0
      t.integer :price_5, default: 0
      t.integer :old_price_1
      t.integer :old_price_2
      t.integer :old_price_3
      t.integer :old_price_4
      t.integer :old_price_5
      t.integer :price_hour, default: 0
      t.string :price_main
      t.string :fuel
      t.integer :number_doors
      t.boolean :active, default: false
      t.boolean :show_on_main, default: false
      t.integer :sort, default: 0
      t.integer :deposit
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
