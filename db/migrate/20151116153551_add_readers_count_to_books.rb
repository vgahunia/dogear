class AddReadersCountToBooks < ActiveRecord::Migration

  def self.up

    add_column :books, :favorites_count, :integer, :null => false, :default => 0

  end

  def self.down

    remove_column :books, :favorites_count

  end

end
