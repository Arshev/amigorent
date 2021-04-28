class AddCityToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :city, :string, default: "Калининград"
  end
end
