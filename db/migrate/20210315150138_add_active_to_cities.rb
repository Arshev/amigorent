class AddActiveToCities < ActiveRecord::Migration[6.0]
  def change
    add_column :cities, :active, :boolean, default: false
    add_column :towns, :active, :boolean, default: false

  end
end
