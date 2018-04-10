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

ActiveRecord::Schema.define(version: 20170401215247) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "phone"
    t.string   "designation"
  end

  create_table "api_keys", force: :cascade do |t|
    t.string   "secret_key"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "user_token"
    t.string   "user_type"
  end

  create_table "complaint_feedbacks", force: :cascade do |t|
    t.integer  "complaint_id"
    t.text     "feedback"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "complaint_statuses", force: :cascade do |t|
    t.string   "admin_user_id"
    t.string   "status"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "department"
    t.string   "sub_category"
    t.integer  "complaint_id"
  end

  create_table "complaint_updates", force: :cascade do |t|
    t.integer  "complaint_id"
    t.string   "assigned_to"
    t.text     "notes"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["assigned_to"], name: "index_complaint_updates_on_assigned_to", using: :btree
    t.index ["complaint_id"], name: "index_complaint_updates_on_complaint_id", using: :btree
  end

  create_table "complaints", force: :cascade do |t|
    t.string   "subject"
    t.text     "description"
    t.text     "image"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "password_reset_links", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "access_token"
    t.string   "secret_key"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "verified"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "password_digest"
    t.string   "contact"
    t.string   "enroll_no"
  end

end
