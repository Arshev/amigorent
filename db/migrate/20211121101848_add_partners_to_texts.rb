class AddPartnersToTexts < ActiveRecord::Migration[6.1]
  def change
    add_column :texts, :partners_text, :text, default: "empty"
    add_column :texts, :partners_title, :string, default: "empty"
    add_column :texts, :partners_description, :string, default: "empty"
    add_column :texts, :partners_h1, :string, default: "empty"
    add_column :texts, :partners_text_en, :text, default: "empty"
    add_column :texts, :partners_title_en, :string, default: "empty"
    add_column :texts, :partners_description_en, :string, default: "empty"
    add_column :texts, :partners_h1_en, :string, default: "empty"
  end
end
