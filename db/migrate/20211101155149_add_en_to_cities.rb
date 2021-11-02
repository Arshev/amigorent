class AddEnToCities < ActiveRecord::Migration[6.1]
  def change
    add_column :cities, :name_en, :string, default: "empty"
    add_column :cities, :title_en, :string, default: "empty"
    add_column :cities, :description_en, :string, default: "empty"
    add_column :cities, :h1_en, :string, default: "empty"
    add_column :cities, :text_en, :text, default: "empty"
    add_column :cities, :address_en, :string, default: "empty"
  end
end
