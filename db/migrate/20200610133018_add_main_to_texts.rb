class AddMainToTexts < ActiveRecord::Migration[6.0]
  def change
    add_column :texts, :main_text, :text, default: "empty"
    add_column :texts, :main_text_en, :text, default: "empty"
  end
end
