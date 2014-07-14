# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140710172147) do

  create_table "coins", force: true do |t|
    t.integer  "value"
    t.integer  "currency_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "coins", ["currency_id"], name: "index_coins_on_currency_id"

  create_table "currencies", force: true do |t|
    t.string   "name"
    t.string   "symbol"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pickups", force: true do |t|
    t.datetime "date"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "longitude"
    t.decimal  "latitude"
    t.integer  "coin_id"
    t.integer  "wallet_id"
  end

  add_index "pickups", ["coin_id"], name: "index_pickups_on_coin_id"
  add_index "pickups", ["wallet_id"], name: "index_pickups_on_wallet_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "wallet_id"
  end

  add_index "users", ["wallet_id"], name: "index_users_on_wallet_id"

  create_table "wallets", force: true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wallets", ["owner_id"], name: "index_wallets_on_owner_id"

end
