class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :car
      t.boolean :baby_chair, default: false
      t.boolean :navigator, default: false
      t.boolean :accept, default: false
      t.string :start_date
      t.string :end_date
      t.string :location_start
      t.string :location_end
      t.string :firstname
      t.string :lastname
      t.string :middlename
      t.string :phone
      t.string :days
      t.string :price
      t.string :email
      t.integer :total
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
