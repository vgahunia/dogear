class RemoveOrderFromFavorites < ActiveRecord::Migration
  def change
    remove_column :favorites, :order, :integer
  end
end
