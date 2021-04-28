class AddFieldsToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :power, :string, default: "empty"
    add_column :cars, :consumption, :string, default: "empty"
    add_column :cars, :number_seats, :string, default: "empty"
    add_column :cars, :clearance, :string, default: "empty"
    add_column :cars, :length, :string, default: "empty"
    add_column :cars, :width, :string, default: "empty"
    add_column :cars, :height, :string, default: "empty"
    add_column :cars, :tank_capacity, :string, default: "empty"
    add_column :cars, :trunk_volume, :string, default: "empty"
    add_column :cars, :mass, :string, default: "empty"
    add_column :cars, :number_gears, :string, default: "empty"
    add_column :cars, :max_speed, :string, default: "empty"
    add_column :cars, :racing, :string, default: "empty"

    add_column :cars, :adjustment_seats, :boolean, default: false
    add_column :cars, :power_seats, :boolean, default: false
    add_column :cars, :climat, :string, default: "empty"
    add_column :cars, :mirror, :boolean, default: false
    add_column :cars, :power_window_front, :boolean, default: false
    add_column :cars, :power_window_back, :boolean, default: false
    add_column :cars, :steering_wheel_height, :boolean, default: false
    add_column :cars, :steering_wheel_adjustment, :boolean, default: false
    add_column :cars, :hot_seats, :boolean, default: false
    add_column :cars, :central_locking, :boolean, default: false
    add_column :cars, :radio, :boolean, default: false
    add_column :cars, :usb, :boolean, default: false
    add_column :cars, :aux, :boolean, default: false
    add_column :cars, :cd, :boolean, default: false
    add_column :cars, :video, :boolean, default: false
  end
end
