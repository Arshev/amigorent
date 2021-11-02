class AddSomeTextToTexts < ActiveRecord::Migration[6.1]
  def change
    add_column :texts, :top_cars_title, :string, default: "empty"
    add_column :texts, :top_cars_title_en, :string, default: "empty"
    add_column :texts, :top_cars, :text, default: "empty"
    add_column :texts, :top_cars_en, :text, default: "empty"
  end
end
