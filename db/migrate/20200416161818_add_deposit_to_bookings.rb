class AddDepositToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :deposit, :string
  end
end
