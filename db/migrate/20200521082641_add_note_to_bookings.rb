class AddNoteToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :note, :text
  end
end
