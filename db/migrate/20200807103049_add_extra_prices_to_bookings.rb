class AddExtraPricesToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :equipment, :integer, default: 0
    add_column :bookings, :delivery, :integer, default: 0
  end
end
