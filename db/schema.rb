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

ActiveRecord::Schema.define(version: 2018_12_08_224324) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "auctions", force: :cascade do |t|
    t.string "name"
    t.string "des"
    t.integer "monto"
    t.integer "minimapuja"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "residence_id"
    t.integer "user_id"
    t.text "weekdate"
  end

  create_table "bids", force: :cascade do |t|
    t.integer "user_id"
    t.integer "residence_id"
    t.integer "auction_id"
    t.integer "maxbid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "homes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hotsales", force: :cascade do |t|
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "residence_id"
    t.text "weekdate"
    t.index ["residence_id"], name: "index_hotsales_on_residence_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "residence_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "modo", default: 0
    t.text "weekdate"
  end

  create_table "residences", force: :cascade do |t|
    t.string "name"
    t.string "des"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provincia"
    t.string "localidad"
    t.string "pais"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.string "range"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin"
    t.integer "premium", default: 2
    t.date "age"
    t.string "card"
    t.integer "cvv"
    t.date "exp"
    t.integer "creditos", default: 2
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
