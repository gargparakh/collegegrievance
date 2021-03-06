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

ActiveRecord::Schema.define(version: 20180412081749) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "password_digest"
    t.string   "designation"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "api_keys", force: :cascade do |t|
    t.string   "secret_key"
    t.integer  "user_id"
    t.string   "user_token"
    t.string   "user_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "complaint_chats", force: :cascade do |t|
    t.string   "chats"
    t.string   "role"
    t.text     "image"
    t.integer  "complaint_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "complaint_updates", force: :cascade do |t|
    t.integer  "complaint_id"
    t.text     "notes"
    t.string   "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "complaints", force: :cascade do |t|
    t.string   "subject"
    t.text     "description"
    t.text     "image"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "status"
    t.string   "resolved"
  end

  create_table "password_reset_links", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "access_token"
    t.string   "secret_key"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "enroll_no"
    t.string   "branch"
    t.string   "semester"
    t.string   "name"
    t.string   "contact"
    t.string   "email"
    t.boolean  "verified"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
