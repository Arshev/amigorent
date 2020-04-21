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

ActiveRecord::Schema.define(version: 2020_04_21_093534) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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

  create_table "articles", force: :cascade do |t|
    t.text "text"
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.string "car"
    t.boolean "baby_chair", default: false
    t.boolean "navigator", default: false
    t.boolean "accept", default: false
    t.string "start_date"
    t.string "end_date"
    t.string "location_start"
    t.string "location_end"
    t.string "firstname"
    t.string "lastname"
    t.string "middlename"
    t.string "phone"
    t.string "days"
    t.string "price"
    t.string "email"
    t.integer "total"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "deposit"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "cars", force: :cascade do |t|
    t.string "car_name"
    t.integer "year"
    t.string "color"
    t.string "transmission"
    t.boolean "is_air", default: false
    t.string "engine_capacity"
    t.boolean "is_electropackage", default: false
    t.string "car_class"
    t.string "car_type"
    t.integer "price_1"
    t.integer "price_2"
    t.integer "price_3"
    t.integer "price_4"
    t.integer "price_5"
    t.integer "old_price_1"
    t.integer "old_price_2"
    t.integer "old_price_3"
    t.integer "old_price_4"
    t.integer "old_price_5"
    t.integer "price_hour"
    t.string "price_main"
    t.string "fuel"
    t.integer "number_doors"
    t.boolean "active", default: false
    t.boolean "show_on_main", default: false
    t.integer "sort", default: 0
    t.integer "deposit"
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_cars_on_user_id"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "data_fingerprint"
    t.string "type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "deliveries", force: :cascade do |t|
    t.string "city"
    t.text "text"
    t.string "price_work_time"
    t.string "price_not_work_time"
    t.string "h1"
    t.text "title"
    t.text "description"
  end

  create_table "quick_bookings", force: :cascade do |t|
    t.string "start_date"
    t.string "end_date"
    t.string "phone"
    t.string "email"
    t.string "name"
    t.boolean "is_sedan"
    t.boolean "is_hatch"
    t.boolean "is_cross"
    t.boolean "is_minivan"
    t.boolean "is_universal"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.float "yandex", default: 5.0
    t.float "google", default: 5.0
  end

  create_table "reviews", force: :cascade do |t|
    t.text "text"
    t.string "name"
    t.string "email"
    t.boolean "active"
    t.float "star", default: 1.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "texts", force: :cascade do |t|
    t.text "main_up_text", default: "Дорогой друг, добро пожаловать в автопрокат <b>Амиго!</b>"
    t.text "main_h1_text", default: "empty"
    t.text "main_quick_booking_text", default: "empty"
    t.text "main_substances_text", default: "empty"
    t.text "main_car_list_text", default: "empty"
    t.text "main_services_text", default: "empty"
    t.text "main_mission_text", default: "empty"
    t.text "main_edge_text", default: "empty"
    t.text "footer_text", default: "empty"
    t.text "prices_text", default: "empty"
    t.text "prices_bottom_text", default: "empty"
    t.text "contacts_text", default: "empty"
    t.text "bookings_bottom_text", default: "empty"
    t.text "reviews_text", default: "empty"
    t.text "terms_text", default: "empty"
    t.text "faqs_text", default: "empty"
    t.text "about_text", default: "empty"
    t.text "cars_title", default: "empty"
    t.text "cars_description", default: "empty"
    t.text "prices_title", default: "empty"
    t.text "prices_description", default: "empty"
    t.text "contacts_title", default: "empty"
    t.text "contacts_description", default: "empty"
    t.text "bookings_title", default: "empty"
    t.text "bookings_description", default: "empty"
    t.text "reviews_title", default: "empty"
    t.text "reviews_description", default: "empty"
    t.text "terms_title", default: "empty"
    t.text "terms_description", default: "empty"
    t.text "faqs_title", default: "empty"
    t.text "faqs_description", default: "empty"
    t.text "abouts_title", default: "empty"
    t.text "abouts_description", default: "empty"
    t.text "dop_table_worktime", default: "empty"
    t.text "dop_table_endtime", default: "empty"
    t.text "dop_table_city_price_worktime", default: "empty"
    t.text "dop_table_city_price_endtime", default: "empty"
    t.text "dop_table_aero_price_worktime", default: "empty"
    t.text "dop_table_aero_price_endtime", default: "empty"
    t.text "dop_table_svetlogorsk_price_worktime", default: "empty"
    t.text "dop_table_svetlogorsk_price_endtime", default: "empty"
    t.text "dop_table_zelenogradsk_price_worktime", default: "empty"
    t.text "dop_table_zelenogradsk_price_endtime", default: "empty"
    t.text "dop_table_kosa_price_worktime", default: "empty"
    t.text "dop_table_kosa_price_endtime", default: "empty"
    t.text "dop_table_kreslo_dayprice", default: "empty"
    t.text "dop_table_kreslo_allprice", default: "empty"
    t.text "dop_table_navigator_dayprice", default: "empty"
    t.text "dop_table_downtext", default: "empty"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "main_title", default: "empty"
    t.string "car_title", default: "empty"
    t.string "services_title", default: "empty"
    t.string "deliveries_title", default: "empty"
    t.string "delivery_title", default: "empty"
    t.string "articles_title", default: "empty"
    t.text "main_description", default: "empty"
    t.text "car_description", default: "empty"
    t.text "services_description", default: "empty"
    t.text "deliveries_description", default: "empty"
    t.text "delivery_description", default: "empty"
    t.text "articles_description", default: "empty"
    t.text "conditions", default: "empty"
    t.text "success", default: "empty"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "lastname"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.boolean "is_admin", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "users"
  add_foreign_key "cars", "users"
end
