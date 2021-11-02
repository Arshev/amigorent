class AddContactsToTexts < ActiveRecord::Migration[6.1]
  def change
    add_column :texts, :bookings_h1, :string, default: "empty"
    add_column :texts, :contacts_phones, :string, default: "empty"
    add_column :texts, :bookings_h1_en, :string, default: "empty"
    add_column :texts, :contacts_phones_en, :string, default: "empty"
    add_column :texts, :contacts_email, :string, default: "empty"
  end
end
