class AddArticlesTitleToTexts < ActiveRecord::Migration[6.0]
  def change
    add_column :texts, :articles_h1, :string, default: "empty"
  end
end
