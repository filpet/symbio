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

ActiveRecord::Schema.define(:version => 20140506213417) do

  create_table "financial_transactions", :force => true do |t|
    t.datetime "datetime"
    t.integer  "user_id"
    t.decimal  "amount",   :precision => 5, :scale => 2
    t.string   "comment"
  end

  create_table "invoice_items", :force => true do |t|
    t.date     "date"
    t.integer  "user_id"
    t.decimal  "price",      :precision => 4, :scale => 2
    t.decimal  "rebate",     :precision => 4, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meal_categories", :force => true do |t|
    t.string   "name"
    t.integer  "sort_order"
    t.decimal  "price",      :precision => 4, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menu_items", :force => true do |t|
    t.date     "date"
    t.string   "name"
    t.string   "meal_category_id"
    t.integer  "sort_order"
    t.decimal  "price",            :precision => 4, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.date     "date"
    t.integer  "user_id"
    t.integer  "menu_item_id"
    t.integer  "meal_category_id"
    t.string   "state",            :default => "new"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "invoice_item_id"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "email",                                                               :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128,                               :default => "",    :null => false
    t.string   "password_salt",                                                       :default => "",    :null => false
    t.string   "name"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "authentication_token"
    t.boolean  "admin",                                                               :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "balance",                               :precision => 5, :scale => 2
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
