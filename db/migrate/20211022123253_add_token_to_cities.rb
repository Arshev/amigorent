class AddTokenToCities < ActiveRecord::Migration[6.1]
  def change
    add_column :cities, :rentprog_token, :string
  end
end
