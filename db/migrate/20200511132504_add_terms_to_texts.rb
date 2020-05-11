class AddTermsToTexts < ActiveRecord::Migration[6.0]
  def change
    add_column :texts, :term_common, :text, default: "empty"
    add_column :texts, :term_docs, :text, default: "empty"
    add_column :texts, :term_gringo, :text, default: "empty"
    add_column :texts, :term_no_franchise, :text, default: "empty"
    add_column :texts, :term_companies, :text, default: "empty"
    add_column :texts, :term_clients, :text, default: "empty"
    add_column :texts, :term_other, :text, default: "empty"
    add_column :texts, :term_abroad, :text, default: "empty"
    add_column :texts, :term_bottom, :text, default: "empty"
  end
end
