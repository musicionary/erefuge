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

ActiveRecord::Schema.define(version: 20160929183931) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_accounts_on_user_id", using: :btree
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.string   "title"
    t.integer  "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_chat_rooms_on_account_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "date"
    t.string   "description"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "account_id"
    t.integer  "chat_room_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["account_id"], name: "index_messages_on_account_id", using: :btree
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "user_name"
    t.integer  "account_id"
    t.boolean  "admin",                  default: false
    t.index ["account_id"], name: "index_users_on_account_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["user_name"], name: "index_users_on_user_name", unique: true, using: :btree
  end

  add_foreign_key "chat_rooms", "accounts"
  add_foreign_key "messages", "accounts"
  add_foreign_key "messages", "chat_rooms"
end
