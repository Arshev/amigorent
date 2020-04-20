class AddFieldsToTexts < ActiveRecord::Migration[6.0]
  def change
    remove_column :texts, :home_title, :text
    remove_column :texts, :home_description, :text

    add_column :texts, :main_title, :string, default: "empty"
    add_column :texts, :car_title, :string, default: "empty"
    add_column :texts, :services_title, :string, default: "empty"
    add_column :texts, :deliveries_title, :string, default: "empty"
    add_column :texts, :delivery_title, :string, default: "empty"
    add_column :texts, :articles_title, :string, default: "empty"

    add_column :texts, :main_description, :text, default: "empty"
    add_column :texts, :car_description, :text, default: "empty"
    add_column :texts, :services_description, :text, default: "empty"
    add_column :texts, :deliveries_description, :text, default: "empty"
    add_column :texts, :delivery_description, :text, default: "empty"
    add_column :texts, :articles_description, :text, default: "empty"
  end
end
