class Setup < ActiveRecord::Migration
  def change
    drop_table :currencies if ActiveRecord::Base.connection.table_exists? 'currencies'
    create_table :currencies do |t|
      t.string :name
      t.timestamps
    end

    drop_table :coins if ActiveRecord::Base.connection.table_exists? 'coins'
    create_table :coins do |t|
      t.integer :value
      t.string :name
      t.string :short_name
      t.belongs_to :currency
      t.timestamps
    end

    drop_table :wallets if ActiveRecord::Base.connection.table_exists? 'wallets'
    create_table :wallets do |t|
      t.string :name
      t.timestamps
    end

    drop_table :pickups if ActiveRecord::Base.connection.table_exists? 'pickups'
    create_table :pickups do |t|
      t.datetime :picked_at
      t.string :comments
      t.decimal :longitude
      t.decimal :latitude
      t.string :location
      t.belongs_to :coin
      t.belongs_to :wallet
      t.belongs_to :picker
      t.timestamps
    end

    drop_table :users if ActiveRecord::Base.connection.table_exists? 'users'
    create_table :users do |t|
      t.string :username
      t.string :email
      t.integer :role
      t.boolean :active
      t.string :password_digest
      t.belongs_to :wallet
      t.timestamps
    end
  end
end
