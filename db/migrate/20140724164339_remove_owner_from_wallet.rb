class RemoveOwnerFromWallet < ActiveRecord::Migration
  def change
    remove_column :wallets, :owner_id
  end
end
