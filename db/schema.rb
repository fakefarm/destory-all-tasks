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

ActiveRecord::Schema.define(version: 20131130183907) do

  create_table "comments", force: :cascade do |t|
    t.text     "entry"
    t.string   "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "task_id"
    t.integer  "user_id"
  end

  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "time_zone"
    t.string   "punt_default"
  end

  create_table "task_counters", force: :cascade do |t|
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "item"
    t.boolean  "completed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "feature"
    t.string   "tags"
    t.boolean  "deleted"
    t.integer  "position"
    t.datetime "due_date"
    t.integer  "user_id"
  end

  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "task_counter_id"
    t.string   "auth_token"
    t.integer  "profile_id"
    t.string   "role"
  end

end
