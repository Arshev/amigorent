class AddNewFieldsToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :fuel_type, :string, default: "empty"
    add_column :cars, :drive_unit, :string, default: "empty"
    add_column :cars, :tth_note, :text, default: "empty"
    remove_column :cars, :adjustment_seats, :boolean, default: false
  end
end
