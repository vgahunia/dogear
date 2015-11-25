class AddOrderToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :order, :integer
  end
end
