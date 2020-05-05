class RemoveFieldsInCars < ActiveRecord::Migration[6.0]
  def change
    remove_column :cars, :power, :string, default: "empty"
    remove_column :cars, :consumption, :string, default: "empty"
    remove_column :cars, :number_seats, :string, default: "empty"
    remove_column :cars, :clearance, :string, default: "empty"
    remove_column :cars, :length, :string, default: "empty"
    remove_column :cars, :width, :string, default: "empty"
    remove_column :cars, :height, :string, default: "empty"
    remove_column :cars, :tank_capacity, :string, default: "empty"
    remove_column :cars, :trunk_volume, :string, default: "empty"
    remove_column :cars, :mass, :string, default: "empty"
    remove_column :cars, :number_gears, :string, default: "empty"
    remove_column :cars, :max_speed, :string, default: "empty"
    remove_column :cars, :racing, :string, default: "empty"

    remove_column :cars, :adjustment_seats, :boolean, default: false
    remove_column :cars, :power_seats, :boolean, default: false
    remove_column :cars, :climat, :string, default: "empty"
    remove_column :cars, :mirror, :boolean, default: false
    remove_column :cars, :power_window_front, :boolean, default: false
    remove_column :cars, :power_window_back, :boolean, default: false
    remove_column :cars, :steering_wheel_height, :boolean, default: false
    remove_column :cars, :steering_wheel_adjustment, :boolean, default: false
    remove_column :cars, :hot_seats, :boolean, default: false
    remove_column :cars, :central_locking, :boolean, default: false
    remove_column :cars, :radio, :boolean, default: false
    remove_column :cars, :usb, :boolean, default: false
    remove_column :cars, :aux, :boolean, default: false
    remove_column :cars, :cd, :boolean, default: false
    remove_column :cars, :video, :boolean, default: false
  end
end
