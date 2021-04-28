class CreateTowns < ActiveRecord::Migration[6.0]
  def change
    create_table :towns do |t|
      t.string :name
      t.string :url_name
      t.string :title
      t.string :description
      t.string :h1
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
