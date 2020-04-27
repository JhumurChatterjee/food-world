# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_21_153814) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", limit: 250, null: false
    t.bigint "state_id", null: false
    t.bigint "created_by_id"
    t.bigint "updated_by_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_by_id"], name: "index_cities_on_created_by_id"
    t.index ["state_id"], name: "index_cities_on_state_id"
    t.index ["updated_by_id"], name: "index_cities_on_updated_by_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", limit: 250, null: false
    t.bigint "created_by_id"
    t.bigint "updated_by_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_by_id"], name: "index_countries_on_created_by_id"
    t.index ["updated_by_id"], name: "index_countries_on_updated_by_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name", limit: 250, null: false
    t.string "food_type", null: false
    t.string "continental", null: false
    t.string "image"
    t.bigint "restaurant_id", null: false
    t.bigint "created_by_id"
    t.bigint "updated_by_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_by_id"], name: "index_foods_on_created_by_id"
    t.index ["restaurant_id"], name: "index_foods_on_restaurant_id"
    t.index ["updated_by_id"], name: "index_foods_on_updated_by_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name", limit: 250, null: false
    t.string "street_address", limit: 250, null: false
    t.string "phone_number", limit: 250, null: false
    t.string "delivery_type", null: false
    t.string "food_type", null: false
    t.string "delivery_emergency", null: false
    t.string "image"
    t.bigint "city_id", null: false
    t.bigint "state_id", null: false
    t.bigint "country_id", null: false
    t.bigint "created_by_id"
    t.bigint "updated_by_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_restaurants_on_city_id"
    t.index ["country_id"], name: "index_restaurants_on_country_id"
    t.index ["created_by_id"], name: "index_restaurants_on_created_by_id"
    t.index ["state_id"], name: "index_restaurants_on_state_id"
    t.index ["updated_by_id"], name: "index_restaurants_on_updated_by_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name", limit: 250, null: false
    t.bigint "country_id", null: false
    t.bigint "created_by_id"
    t.bigint "updated_by_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_states_on_country_id"
    t.index ["created_by_id"], name: "index_states_on_created_by_id"
    t.index ["updated_by_id"], name: "index_states_on_updated_by_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 250, null: false
    t.string "email", limit: 250, null: false
    t.string "password_digest"
    t.string "phone_number"
    t.string "remember_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
