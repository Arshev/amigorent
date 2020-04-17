class AddFieldsToDeliveries < ActiveRecord::Migration[6.0]
  def change
    add_column :deliveries, :price_work_time, :string
    add_column :deliveries, :price_not_work_time, :string
    add_column :deliveries, :h1, :string
    add_column :deliveries, :title, :text
    add_column :deliveries, :description, :text
  end
end
