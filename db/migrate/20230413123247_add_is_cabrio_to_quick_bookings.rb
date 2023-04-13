class AddIsCabrioToQuickBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :quick_bookings, :is_cabrio, :boolean
    add_column :texts, :cars_cabrio_title, :string, default: "empty"
    add_column :texts, :cars_cabrio_description, :string, default: "empty"
    add_column :texts, :cars_cabrio_h1, :string, default: "empty"
    add_column :texts, :cars_cabrio_text, :text, default: "empty"
    add_column :texts, :cars_cabrio_title_en, :string, default: "empty"
    add_column :texts, :cars_cabrio_description_en, :string, default: "empty"
    add_column :texts, :cars_cabrio_h1_en, :string, default: "empty"
    add_column :texts, :cars_cabrio_text_en, :text, default: "empty"
  end
end
