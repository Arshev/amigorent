class AddFormatedDatesToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :start_date_formated, :datetime
    add_column :bookings, :end_date_formated, :datetime
  end
end
