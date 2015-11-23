class AddAuthorToUser < ActiveRecord::Migration
  def change
    add_column :users, :fav_author, :string
  end
end
