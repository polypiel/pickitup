class AddLocationToPickup < ActiveRecord::Migration
  def change
    add_column :pickups, :location, :string
  end
end
