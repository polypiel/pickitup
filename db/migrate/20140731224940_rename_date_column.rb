class RenameDateColumn < ActiveRecord::Migration
  def change
    rename_column :pickups, :date, :picked_at
  end
end
