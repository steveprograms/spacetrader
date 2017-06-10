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

ActiveRecord::Schema.define(version: 20170610183931) do

  create_table "fuel_tanks", force: :cascade do |t|
    t.integer "ship_id"
    t.string "name"
    t.string "make"
    t.integer "capacity"
    t.integer "amount"
    t.integer "base_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ship_id"], name: "index_fuel_tanks_on_ship_id"
  end

  create_table "holds", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "capacity"
    t.integer "amount"
    t.integer "ship_id"
    t.index ["ship_id"], name: "index_holds_on_ship_id"
  end

  create_table "items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "hold_id"
    t.index ["hold_id"], name: "index_items_on_hold_id"
  end

  create_table "planets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "x_coord"
    t.integer "y_coord"
  end

  create_table "price_sheets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "store_id"
    t.integer "narcotics"
    t.integer "scrap_metal"
    t.index ["store_id"], name: "index_price_sheets_on_store_id"
  end

  create_table "shields", force: :cascade do |t|
    t.integer "ship_id"
    t.string "name"
    t.string "brand"
    t.string "make"
    t.integer "capacity"
    t.integer "amount"
    t.integer "base_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ship_id"], name: "index_shields_on_ship_id"
  end

# Could not dump table "ships" because of following StandardError
#   Unknown type '' for column 'model'

  create_table "stores", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "planet_id"
    t.index ["planet_id"], name: "index_stores_on_planet_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "rank"
    t.integer "credits"
    t.integer "planet_id"
  end

end
