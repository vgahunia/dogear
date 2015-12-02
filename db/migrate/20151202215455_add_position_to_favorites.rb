class AddPositionToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :position, :integer
  end
end
