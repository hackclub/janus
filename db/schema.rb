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

ActiveRecord::Schema[7.1].define(version: 2023_10_06_130526) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "booking_involvements", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.bigint "guest_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id", "guest_id"], name: "index_booking_involvements_on_booking_id_and_guest_id", unique: true
    t.index ["guest_id"], name: "index_booking_involvements_on_guest_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "creator_id"
    t.bigint "reviewer_id"
    t.integer "status"
    t.datetime "arrival_at"
    t.datetime "departure_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arrival_at"], name: "index_bookings_on_arrival_at"
    t.index ["creator_id"], name: "index_bookings_on_creator_id"
    t.index ["departure_at"], name: "index_bookings_on_departure_at"
    t.index ["reviewer_id"], name: "index_bookings_on_reviewer_id"
    t.index ["status"], name: "index_bookings_on_status"
  end

  create_table "comments", force: :cascade do |t|
    t.string "commentable_type", null: false
    t.bigint "commentable_id", null: false
    t.bigint "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable"
    t.index ["creator_id"], name: "index_comments_on_creator_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "eventable_type"
    t.bigint "eventable_id"
    t.bigint "creator_id"
    t.string "action"
    t.jsonb "details", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "target_id"
    t.index ["action"], name: "index_events_on_action"
    t.index ["creator_id"], name: "index_events_on_creator_id"
    t.index ["details"], name: "index_events_on_details"
    t.index ["eventable_type", "eventable_id"], name: "index_events_on_eventable"
    t.index ["target_id"], name: "index_events_on_target_id"
  end

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
    t.string "slack_id"
    t.string "email_address", null: false
    t.string "name"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address"
    t.index ["role"], name: "index_users_on_role"
    t.index ["slack_id"], name: "index_users_on_slack_id", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "booking_involvements", "bookings"
  add_foreign_key "booking_involvements", "users", column: "guest_id"
  add_foreign_key "bookings", "users", column: "creator_id"
  add_foreign_key "bookings", "users", column: "reviewer_id"
  add_foreign_key "comments", "users", column: "creator_id"
  add_foreign_key "events", "users", column: "target_id"
  add_foreign_key "user_sessions", "users"
end
