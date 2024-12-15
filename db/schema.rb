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

ActiveRecord::Schema[8.1].define(version: 2024_12_11_215323) do
  create_table "events", force: :cascade do |t|
    t.integer "request_id"
    t.string "subject_type", null: false
    t.integer "subject_id", null: false
    t.integer "creator_id"
    t.string "action", null: false
    t.string "details", default: "{}", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action"], name: "index_events_on_action"
    t.index ["creator_id"], name: "index_events_on_creator_id"
    t.index ["request_id"], name: "index_events_on_request_id"
    t.index ["subject_type", "subject_id", "action"], name: "index_events_on_subject_type_and_subject_id_and_action"
  end

  create_table "requests", force: :cascade do |t|
    t.string "path", null: false
    t.string "method", null: false
    t.string "uuid"
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ip_address"], name: "index_requests_on_ip_address"
    t.index ["uuid"], name: "index_requests_on_uuid"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_sessions_on_token", unique: true
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email_address", null: false
    t.string "slack_id", null: false
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address"
    t.index ["role"], name: "index_users_on_role"
    t.index ["slack_id"], name: "index_users_on_slack_id", unique: true
  end

  add_foreign_key "events", "requests"
  add_foreign_key "events", "users", column: "creator_id"
  add_foreign_key "sessions", "users"
end
