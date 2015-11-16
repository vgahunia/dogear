class AddUnfinishedsCountToBooks < ActiveRecord::Migration

  def self.up

    add_column :books, :unfinisheds_count, :integer, :null => false, :default => 0

  end

  def self.down

    remove_column :books, :unfinisheds_count

  end

end
