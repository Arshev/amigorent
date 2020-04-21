class AddYoutubeToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :youtube, :string, default: nil
  end
end
