class CreatePickups < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :symbol

      t.timestamps
    end

    create_table :coins do |t|
      t.integer :value
      t.belongs_to :currency

      t.timestamps
    end

    create_table :wallets do |t|
      t.string :name
      t.belongs_to :owner

      t.timestamps
    end

    create_table :pickups do |t|
      t.datetime :date
      t.string :comments
      t.decimal :longitude
      t.decimal :latitude
      t.belongs_to :coin
      t.belongs_to :wallet
      t.timestamps
    end

    create_table :users do |t|
      t.string :name
      t.belongs_to :wallet

      t.timestamps
    end
  end
end
