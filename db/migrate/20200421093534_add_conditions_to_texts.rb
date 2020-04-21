class AddConditionsToTexts < ActiveRecord::Migration[6.0]
  def change
    add_column :texts, :conditions, :text, default: "empty"
    add_column :texts, :success, :text, default: "empty"
  end
end
