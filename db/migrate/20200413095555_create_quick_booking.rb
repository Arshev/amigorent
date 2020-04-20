class CreateQuickBooking < ActiveRecord::Migration[6.0]
  def change
    create_table :quick_bookings do |t|
      t.string :start_date
      t.string :end_date
      t.string :phone
      t.string :email
      t.string :name
      t.boolean :is_sedan
      t.boolean :is_hatch
      t.boolean :is_cross
      t.boolean :is_minivan
      t.boolean :is_universal

      t.timestamps
    end
  end
end
