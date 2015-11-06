class AddColumnToBooks < ActiveRecord::Migration
  def change
    add_column :books, :gr_id, :integer
  end
end
