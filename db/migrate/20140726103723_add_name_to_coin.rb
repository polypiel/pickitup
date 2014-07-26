class AddNameToCoin < ActiveRecord::Migration
  def change
    add_column :coins, :name, :string
    add_column :coins, :short_name, :string
  end
end
