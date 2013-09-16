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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130905145807) do

  create_table "cities", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
    t.string   "slug"
  end

  add_index "cities", ["slug"], :name => "index_cities_on_slug"

  create_table "comments", :force => true do |t|
    t.text     "entry"
    t.string   "tags"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "task_id"
  end

  create_table "confirmations", :force => true do |t|
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "color"
    t.string   "garment"
    t.integer  "printer_id"
    t.string   "city"
    t.integer  "total_invoice"
    t.integer  "piece_price"
    t.string   "name"
    t.string   "email"
  end

  create_table "finishing_services", :force => true do |t|
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.boolean  "printed_labels"
    t.boolean  "woven_labels"
    t.boolean  "folding_bagging"
    t.boolean  "hang_tags"
    t.boolean  "fulfillment"
    t.integer  "printer_id"
  end

  add_index "finishing_services", ["printer_id"], :name => "index_finishing_services_on_printer_id"

  create_table "garment_prices", :force => true do |t|
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "fabric"
    t.string   "cut"
    t.string   "quality"
    t.string   "colors"
    t.string   "inventory"
    t.string   "brand"
    t.string   "style_number"
    t.integer  "price"
    t.integer  "printer_id"
  end

  add_index "garment_prices", ["printer_id"], :name => "index_garment_prices_on_printer_id"

  create_table "garment_selectors", :force => true do |t|
    t.string   "short_sleeve_tshirt"
    t.integer  "printer_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.text     "comment"
    t.string   "garment_price"
  end

  add_index "garment_selectors", ["printer_id"], :name => "index_garment_selectors_on_printer_id"

  create_table "print_prices", :force => true do |t|
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "pallet_type"
    t.string   "ink_type"
    t.integer  "base_color"
    t.integer  "one_color"
    t.integer  "two_color"
    t.integer  "three_color"
    t.integer  "four_color"
    t.integer  "five_color"
    t.integer  "six_color"
    t.integer  "seven_color"
    t.integer  "eight_color"
    t.integer  "printer_id"
    t.integer  "price_tier",  :limit => 255
  end

  add_index "print_prices", ["printer_id"], :name => "index_print_prices_on_printer_id"

  create_table "printer_features", :force => true do |t|
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.boolean  "free_shipping"
    t.boolean  "digital_proof"
    t.boolean  "hotline"
    t.boolean  "art_team"
    t.boolean  "sample"
    t.boolean  "drop_ship"
    t.integer  "printer_id"
  end

  add_index "printer_features", ["printer_id"], :name => "index_printer_features_on_printer_id"

  create_table "printers", :force => true do |t|
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "email"
    t.string   "contact_name"
    t.string   "phone"
    t.string   "address"
    t.integer  "zipcode"
    t.string   "website"
    t.boolean  "pending"
    t.string   "shop_name"
    t.integer  "city_id"
    t.string   "slug"
    t.text     "about"
    t.text     "overview"
    t.text     "services"
    t.text     "customer_service"
    t.text     "terms"
  end

  add_index "printers", ["slug"], :name => "index_printers_on_slug"

  create_table "quotes", :force => true do |t|
    t.integer  "quantity"
    t.string   "number_of_colors"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "sessions", :force => true do |t|
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "session_id"
    t.integer  "quote_id"
    t.integer  "garment_id"
    t.integer  "printer_id"
    t.integer  "garment_price"
  end

  create_table "task_counters", :force => true do |t|
    t.integer  "quantity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tasks", :force => true do |t|
    t.string   "item"
    t.boolean  "completed"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "feature"
    t.string   "tags"
    t.boolean  "deleted"
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
