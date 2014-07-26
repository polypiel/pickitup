class AddPickerToPickup < ActiveRecord::Migration
  def change
    add_reference :pickups, :picker, table_name: :users
  end
end
