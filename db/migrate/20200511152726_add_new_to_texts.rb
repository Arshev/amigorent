class AddNewToTexts < ActiveRecord::Migration[6.0]
  def change
    add_column :texts, :full_insurance_title, :string, default: "empty"
    add_column :texts, :full_insurance_description, :text, default: "empty"
    add_column :texts, :full_insurance_h1, :string, default: "empty"
    add_column :texts, :full_insurance_text, :text, default: "empty"

    add_column :texts, :car_sharing_h1, :string, default: "empty"
    add_column :texts, :casko_h1, :string, default: "empty"
    add_column :texts, :corporate_h1, :string, default: "empty"
    add_column :texts, :sales_h1, :string, default: "empty"
    add_column :texts, :payment_h1, :string, default: "empty"
    add_column :texts, :outsours_h1, :string, default: "empty"
    add_column :texts, :s_voditelem_h1, :string, default: "empty"

  end
end
