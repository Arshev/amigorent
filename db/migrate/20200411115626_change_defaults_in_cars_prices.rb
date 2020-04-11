class ChangeDefaultsInCarsPrices < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:cars, :price_1, nil)
    change_column_default(:cars, :price_2, nil)
    change_column_default(:cars, :price_3, nil)
    change_column_default(:cars, :price_4, nil)
    change_column_default(:cars, :price_5, nil)
    change_column_default(:cars, :price_hour, nil)
  end
end
