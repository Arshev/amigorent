class AddHoursToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :additional_hours, :integer, default: 0
  end
end
