class AddCitiesToTexts < ActiveRecord::Migration[6.0]
  def change
    add_column :texts, :aeroport_h1, :string, default: "empty"
    add_column :texts, :aeroport_title, :string, default: "empty"
    add_column :texts, :aeroport_description, :text, default: "empty"
    add_column :texts, :aeroport_price, :integer, default: 0
    add_column :texts, :aeroport_price_unwork, :integer, default: 0
    add_column :texts, :aeroport_avto, :string, default: "empty"
    add_column :texts, :zelenogradsk_h1, :string, default: "empty"
    add_column :texts, :zelenogradsk_title, :string, default: "empty"
    add_column :texts, :zelenogradsk_description, :text, default: "empty"
    add_column :texts, :zelenogradsk_price, :integer, default: 0
    add_column :texts, :zelenogradsk_price_unwork, :integer, default: 0
    add_column :texts, :zelenogradsk_avto, :string, default: "empty"
    add_column :texts, :svetlogorsk_h1, :string, default: "empty"
    add_column :texts, :svetlogorsk_title, :string, default: "empty"
    add_column :texts, :svetlogorsk_description, :text, default: "empty"
    add_column :texts, :svetlogorsk_price, :integer, default: 0
    add_column :texts, :svetlogorsk_price_unwork, :integer, default: 0
    add_column :texts, :svetlogorsk_avto, :string, default: "empty"
    add_column :texts, :yantarnyi_h1, :string, default: "empty"
    add_column :texts, :yantarnyi_title, :string, default: "empty"
    add_column :texts, :yantarnyi_description, :text, default: "empty"
    add_column :texts, :yantarnyi_price, :integer, default: 0
    add_column :texts, :yantarnyi_price_unwork, :integer, default: 0
    add_column :texts, :yantarnyi_avto, :string, default: "empty"
    add_column :texts, :baltyisk_h1, :string, default: "empty"
    add_column :texts, :baltyisk_title, :string, default: "empty"
    add_column :texts, :baltyisk_description, :text, default: "empty"
    add_column :texts, :baltyisk_price, :integer, default: 0
    add_column :texts, :baltyisk_price_unwork, :integer, default: 0
    add_column :texts, :baltyisk_avto, :string, default: "empty"
    add_column :texts, :pionerskyi_h1, :string, default: "empty"
    add_column :texts, :pionerskyi_title, :string, default: "empty"
    add_column :texts, :pionerskyi_description, :text, default: "empty"
    add_column :texts, :pionerskyi_price, :integer, default: 0
    add_column :texts, :pionerskyi_price_unwork, :integer, default: 0
    add_column :texts, :pionerskyi_avto, :string, default: "empty"
    add_column :texts, :chernyahovsk_h1, :string, default: "empty"
    add_column :texts, :chernyahovsk_title, :string, default: "empty"
    add_column :texts, :chernyahovsk_description, :text, default: "empty"
    add_column :texts, :chernyahovsk_price, :integer, default: 0
    add_column :texts, :chernyahovsk_price_unwork, :integer, default: 0
    add_column :texts, :chernyahovsk_avto, :string, default: "empty"
    add_column :texts, :chernyahovsk_text, :text, default: "empty"
    add_column :texts, :svetlogorsk_text, :text, default: "empty"
    add_column :texts, :zelenogradsk_text, :text, default: "empty"
    add_column :texts, :aeroport_text, :text, default: "empty"
    add_column :texts, :yantarnyi_text, :text, default: "empty"
    add_column :texts, :baltyisk_text, :text, default: "empty"
    add_column :texts, :pionerskyi_text, :text, default: "empty"
  end
end