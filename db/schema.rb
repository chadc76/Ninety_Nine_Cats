# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_14_043433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cat_rental_requests", force: :cascade do |t|
    t.integer "cat_id", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.string "status", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["cat_id"], name: "index_cat_rental_requests_on_cat_id"
    t.index ["user_id"], name: "index_cat_rental_requests_on_user_id"
  end

  create_table "cats", force: :cascade do |t|
    t.string "name", null: false
    t.date "birth_date", null: false
    t.string "color", null: false
    t.string "sex", limit: 1, null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_cats_on_user_id"
  end

  create_table "session_tokens", force: :cascade do |t|
    t.integer "user_sessions_table_id", null: false
    t.string "token", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "env"
    t.string "location"
    t.index ["token"], name: "index_session_tokens_on_token", unique: true
    t.index ["user_sessions_table_id"], name: "index_session_tokens_on_user_sessions_table_id"
  end

  create_table "user_sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_sessions_on_user_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_sessions_id"
    t.index ["password_digest"], name: "index_users_on_password_digest", unique: true
    t.index ["user_sessions_id"], name: "index_users_on_user_sessions_id", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
