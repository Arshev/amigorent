class AddBookingLimitToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :booking_limit, :integer, default: 2
  end
end
