class AddAddressToBookstore < ActiveRecord::Migration
  def change
    add_column :bookstores, :address, :string
  end
end
