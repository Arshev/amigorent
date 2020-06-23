class AddRejectionToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :rejection, :boolean, default: false
  end
end
