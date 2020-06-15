class AddEnToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :text_en, :text, default: 'empty'
    add_column :articles, :title_en, :string, default: 'empty'
    add_column :articles, :description_en, :text, default: 'empty'
  end
end
