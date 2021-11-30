class AddFranchiseToTexts < ActiveRecord::Migration[6.1]
  def change
    add_column :texts, :franchise_text, :text, default: "empty"
    add_column :texts, :franchise_title, :string, default: "empty"
    add_column :texts, :franchise_description, :string, default: "empty"
    add_column :texts, :franchise_h1, :string, default: "empty"
    add_column :texts, :franchise_text_en, :text, default: "empty"
    add_column :texts, :franchise_title_en, :string, default: "empty"
    add_column :texts, :franchise_description_en, :string, default: "empty"
    add_column :texts, :franchise_h1_en, :string, default: "empty"
  end
end
