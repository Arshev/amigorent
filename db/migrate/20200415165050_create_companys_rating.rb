class CreateCompanysRating < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.float :yandex, default: 5.0
      t.float :google, default: 5.0
    end
  end
end
