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

ActiveRecord::Schema.define(version: 2018_09_25_210055) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hospitals", force: :cascade do |t|
    t.string "name"
    t.string "street_address"
    t.float "latitude"
    t.float "longitude"
    t.string "city"
    t.string "state"
    t.integer "zip_code"
    t.float "rating_average"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "phone"
    t.integer "provider_number"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "hospital_id"
    t.integer "user_id"
    t.text "body"
    t.integer "rating"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "city"
    t.string "state"
    t.string "profile_pic"
    t.string "type_of"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
