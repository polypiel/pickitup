class AddYearToPickups < ActiveRecord::Migration
  def change
    add_column :pickups, :year, :int
  end
end
