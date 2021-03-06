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

ActiveRecord::Schema.define(version: 20161220220024) do

  create_table "coins", force: :cascade do |t|
    t.integer  "value"
    t.string   "name"
    t.string   "short_name"
    t.integer  "currency_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "currencies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pickups", force: :cascade do |t|
    t.datetime "picked_at"
    t.string   "comments"
    t.decimal  "longitude"
    t.decimal  "latitude"
    t.string   "location"
    t.integer  "coin_id"
    t.integer  "wallet_id"
    t.integer  "picker_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "handed_over"
    t.integer  "year"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.integer  "role"
    t.boolean  "active"
    t.string   "password_digest"
    t.integer  "wallet_id"
    t.binary   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "remember_digest"
  end

  create_table "wallets", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "defaultCurrency_id"
  end

  add_index "wallets", ["defaultCurrency_id"], name: "index_wallets_on_defaultCurrency_id"

end
