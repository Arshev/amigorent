class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :url_name
      t.string :title
      t.string :description
      t.string :h1

      t.timestamps
    end
  end
end
