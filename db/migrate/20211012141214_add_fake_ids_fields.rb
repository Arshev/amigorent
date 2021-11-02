class AddFakeIdsFields < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :fake, :boolean, default: false
    add_column :cars, :ids_rentprog, :integer, array: true
  end
end
