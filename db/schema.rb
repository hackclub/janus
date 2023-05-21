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

ActiveRecord::Schema[7.1].define(version: 2023_05_21_221434) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "user_sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "token"
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "last_accessed_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ip_address"], name: "index_user_sessions_on_ip_address"
    t.index ["last_accessed_at"], name: "index_user_sessions_on_last_accessed_at"
    t.index ["token"], name: "index_user_sessions_on_token"
    t.index ["user_id"], name: "index_user_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "slack_id", null: false
    t.string "email_address", null: false
    t.string "name"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address"
    t.index ["role"], name: "index_users_on_role"
    t.index ["slack_id"], name: "index_users_on_slack_id", unique: true
  end

  add_foreign_key "user_sessions", "users"
end
