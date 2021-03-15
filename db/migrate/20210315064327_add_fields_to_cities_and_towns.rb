class AddFieldsToCitiesAndTowns < ActiveRecord::Migration[6.0]
  def change
    add_column :cities, :phone, :string, default: "empty"
    add_column :cities, :email, :string, default: "empty"
    add_column :cities, :address, :string, default: "empty"
    add_column :cities, :work_time, :string, default: "empty"
    add_column :cities, :text, :text, default: "empty"
    add_column :cities, :yandex, :float, default: 1.0
    add_column :cities, :google, :float, default: 1.0

    add_column :towns, :phone, :string, default: "empty"
    add_column :towns, :email, :string, default: "empty"
    add_column :towns, :address, :string, default: "empty"
    add_column :towns, :work_time, :string, default: "empty"
    add_column :towns, :text, :text, default: "empty"
    add_column :towns, :yandex, :float, default: 1.0
    add_column :towns, :google, :float, default: 1.0
  end
end
