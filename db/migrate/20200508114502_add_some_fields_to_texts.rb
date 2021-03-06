class AddSomeFieldsToTexts < ActiveRecord::Migration[6.0]
  def change
    add_column :texts, :s_voditelem_text, :text, default: "empty"
    add_column :texts, :s_voditelem_title, :string, default: "empty"
    add_column :texts, :s_voditelem_description, :text, default: "empty"
    add_column :texts, :car_sharing_text, :text, default: "empty"
    add_column :texts, :car_sharing_title, :string, default: "empty"
    add_column :texts, :car_sharing_description, :text, default: "empty"
    add_column :texts, :casko_text, :text, default: "empty"
    add_column :texts, :casko_title, :string, default: "empty"
    add_column :texts, :casko_description, :text, default: "empty"
    add_column :texts, :corporate_text, :text, default: "empty"
    add_column :texts, :corporate_title, :string, default: "empty"
    add_column :texts, :corporate_description, :text, default: "empty"
    add_column :texts, :sales_text, :text, default: "empty"
    add_column :texts, :sales_title, :string, default: "empty"
    add_column :texts, :sales_description, :text, default: "empty"
    add_column :texts, :payment_text, :text, default: "empty"
    add_column :texts, :payment_title, :string, default: "empty"
    add_column :texts, :payment_description, :text, default: "empty"
    add_column :texts, :outsours_text, :text, default: "empty"
    add_column :texts, :outsours_title, :string, default: "empty"
    add_column :texts, :outsours_description, :text, default: "empty"
  end
end
