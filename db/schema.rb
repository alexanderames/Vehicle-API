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

ActiveRecord::Schema.define(version: 20180729205423) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_tokens", force: :cascade do |t|
    t.string "token", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_access_tokens_on_user_id"
  end

  create_table "makes", force: :cascade do |t|
    t.string "name"
    t.bigint "vehicle_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_makes_on_user_id"
    t.index ["vehicle_id"], name: "index_makes_on_vehicle_id"
  end

  create_table "models", force: :cascade do |t|
    t.string "name"
    t.bigint "make_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["make_id"], name: "index_models_on_make_id"
  end

  create_table "options", force: :cascade do |t|
    t.integer "seats"
    t.string "transmission"
    t.string "drivetrain"
    t.string "fuel_type"
    t.string "style"
    t.string "color"
    t.bigint "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_id"], name: "index_options_on_vehicle_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login", null: false
    t.string "name"
    t.string "url"
    t.string "avatar_url"
    t.string "provider"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "vin"
    t.integer "mileage"
    t.string "plate_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_vehicles_on_user_id"
  end

  add_foreign_key "access_tokens", "users"
  add_foreign_key "makes", "users"
  add_foreign_key "makes", "vehicles"
  add_foreign_key "models", "makes"
  add_foreign_key "options", "vehicles"
  add_foreign_key "vehicles", "users"
end
