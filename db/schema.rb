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

ActiveRecord::Schema.define(version: 20140804153509) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "api_keys", force: true do |t|
    t.string   "key"
    t.integer  "user_id"
    t.datetime "valid_until"
    t.boolean  "is_active",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "api_keys", ["key"], name: "index_api_keys_on_key", unique: true, using: :btree
  add_index "api_keys", ["user_id"], name: "index_api_keys_on_user_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_active",   default: true
    t.text     "seo"
    t.text     "description"
    t.string   "slug"
  end

  add_index "categories", ["name"], name: "category_name", unique: true, using: :btree
  add_index "categories", ["slug"], name: "category_slug", unique: true, using: :btree
  add_index "categories", ["slug"], name: "index_categories_on_slug", using: :btree

  create_table "categories_trips", force: true do |t|
    t.integer "trip_id"
    t.integer "category_id"
  end

  create_table "contacts", force: true do |t|
    t.string   "email"
    t.string   "remote_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cookie_info"
    t.string   "browser_language"
    t.string   "full_url"
    t.string   "direction_link"
    t.string   "trip_city"
  end

  create_table "dashboards", force: true do |t|
    t.string   "name"
    t.string   "info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedbacks", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_active",  default: false
    t.string   "comment"
    t.string   "pro"
    t.string   "contra"
  end

  create_table "hotels", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "trip_id"
    t.string   "address"
    t.integer  "city_id"
    t.integer  "rating"
    t.string   "phone_number"
    t.string   "email"
    t.string   "web_page"
    t.boolean  "is_active"
    t.string   "slug"
  end

  add_index "hotels", ["name"], name: "hotel_name", unique: true, using: :btree
  add_index "hotels", ["slug"], name: "hotel_slug", unique: true, using: :btree
  add_index "hotels", ["slug"], name: "index_hotels_on_slug", using: :btree
  add_index "hotels", ["trip_id"], name: "hotel_trip_id", unique: true, using: :btree

  create_table "mailboxes", force: true do |t|
    t.string   "name"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.string   "name"
    t.string   "content"
    t.string   "from"
    t.integer  "mailbox_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
  end

  create_table "paintings", force: true do |t|
    t.string   "name"
    t.integer  "trip_id"
    t.boolean  "is_feature"
    t.boolean  "is_active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.integer  "region_id"
  end

  add_index "paintings", ["name"], name: "index_paintings_on_name", using: :btree
  add_index "paintings", ["trip_id"], name: "index_paintings_on_trip_id", using: :btree

  create_table "regions", force: true do |t|
    t.string   "name"
    t.string   "long_name"
    t.string   "image"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "abrv"
  end

  add_index "regions", ["slug"], name: "index_regions_on_slug", using: :btree

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "trip_id"
    t.string   "address"
    t.string   "email"
    t.string   "phone_number"
    t.boolean  "is_active"
    t.string   "web_page"
    t.string   "slug"
  end

  add_index "restaurants", ["name"], name: "restaurant_name", unique: true, using: :btree
  add_index "restaurants", ["slug"], name: "index_restaurants_on_slug", using: :btree
  add_index "restaurants", ["slug"], name: "restaurant_slug", unique: true, using: :btree
  add_index "restaurants", ["trip_id"], name: "restaurant_trip_id", using: :btree

  create_table "searches", force: true do |t|
    t.string   "keyword"
    t.integer  "person_number"
    t.integer  "category_id"
    t.decimal  "min_price"
    t.decimal  "max_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
    t.string   "zip_code"
    t.text     "description"
    t.boolean  "is_active"
    t.string   "slug"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "is_feature",      default: false
    t.boolean  "popular"
    t.string   "address"
    t.string   "ger_name"
    t.string   "ger_city"
    t.text     "ger_description"
    t.string   "ger_address"
    t.string   "option_1"
    t.string   "option_2"
    t.string   "opening_hours"
    t.string   "editor_rating"
    t.integer  "region_id"
  end

  add_index "trips", ["latitude"], name: "trip_lat", using: :btree
  add_index "trips", ["longitude"], name: "trip_lgn", using: :btree
  add_index "trips", ["name"], name: "trip_name", unique: true, using: :btree
  add_index "trips", ["slug"], name: "index_trips_on_slug", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",        default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
