
class CreatePickups < ActiveRecord::Migration
  def change
    drop_table :currencies
    create_table :currencies do |t|
      t.string :name
      t.string :symbol
      t.timestamps
    end

    drop_table :coins
    create_table :coins do |t|
      t.integer :value
      t.belongs_to :currency
      t.timestamps
    end

    drop_table :wallets
    create_table :wallets do |t|
      t.string :name
      t.timestamps
    end

    drop_table :pickups
    create_table :pickups do |t|
      t.datetime :date
      t.string :comments
      t.decimal :longitude
      t.decimal :latitude
      t.belongs_to :coin
      t.belongs_to :wallet
      t.belongs_to :picker
      t.timestamps
    end

    drop_table :users
    create_table :users do |t|
      t.string :username
      t.string :email
      t.integer :role
      t.belongs_to :wallet
      t.timestamps
    end
  end
end
