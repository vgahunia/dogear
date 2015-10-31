class CreateBookstores < ActiveRecord::Migration
  def change
    create_table :bookstores do |t|
      t.float :latitude
      t.float :longitude
      t.string :description
      t.string :text
      t.string :name
      t.timestamps null: false
    end
  end
end
