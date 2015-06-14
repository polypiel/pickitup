class AddHandedOverToPickups < ActiveRecord::Migration
  def change
    add_column :pickups, :handed_over, :boolean
  end
end
