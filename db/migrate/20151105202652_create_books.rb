class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :year
      t.string :author
      t.string :image_url

      t.timestamps null: false
    end
  end
end
