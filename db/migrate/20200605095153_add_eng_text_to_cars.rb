class AddEngTextToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :description_en, :text, default: "empty"
  end
end
