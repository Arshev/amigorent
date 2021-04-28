class AddImagesToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :images, :json
  end
end
