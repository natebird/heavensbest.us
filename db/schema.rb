# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090121033419) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "subscription_discount_id", :limit => 11
    t.string   "street"
    t.string   "street2"
    t.string   "city"
    t.string   "postal_code"
    t.integer  "user_id"
    t.integer  "region_id"
    t.integer  "country_id",                             :default => 1
    t.string   "company"
    t.string   "email"
    t.string   "locations"
    t.string   "keywords"
    t.string   "permalink"
    t.string   "accountlink"
    t.integer  "accept"
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "open_id_authentication_associations", :force => true do |t|
    t.integer "issued"
    t.integer "lifetime"
    t.string  "handle"
    t.string  "assoc_type"
    t.binary  "server_url"
    t.binary  "secret"
  end

  create_table "open_id_authentication_nonces", :force => true do |t|
    t.integer "timestamp",  :null => false
    t.string  "server_url"
    t.string  "salt",       :null => false
  end

  create_table "operators", :force => true do |t|
    t.string   "name"
    t.string   "photo"
    t.string   "title"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "category"
    t.string   "name"
    t.string   "permalink"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "passwords", :force => true do |t|
    t.integer  "user_id"
    t.string   "reset_code"
    t.datetime "expiration_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phones", :force => true do |t|
    t.string   "number"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.string   "name"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.integer  "country_id",   :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "services", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "active"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink"
    t.integer  "photo_id"
    t.string   "servicelink"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "specials", :force => true do |t|
    t.string   "title"
    t.string   "phone"
    t.text     "body"
    t.integer  "account_id"
    t.date     "start"
    t.date     "end"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscription_discounts", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.decimal  "amount",     :precision => 6, :scale => 2, :default => 0.0
    t.boolean  "percent"
    t.date     "start_on"
    t.date     "end_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscription_payments", :force => true do |t|
    t.integer  "account_id",      :limit => 11
    t.integer  "subscription_id", :limit => 11
    t.decimal  "amount",                        :precision => 10, :scale => 2, :default => 0.0
    t.string   "transaction_id"
    t.boolean  "setup"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscription_plans", :force => true do |t|
    t.string   "name"
    t.decimal  "amount",                       :precision => 10, :scale => 2
    t.integer  "special_limit",  :limit => 11
    t.integer  "renewal_period", :limit => 11,                                :default => 12
    t.decimal  "setup_amount",                 :precision => 10, :scale => 2
    t.integer  "trial_period",   :limit => 11,                                :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", :force => true do |t|
    t.decimal  "amount",                             :precision => 10, :scale => 2
    t.datetime "next_renewal_at"
    t.string   "card_number"
    t.string   "card_expiration"
    t.string   "state",                                                             :default => "trial"
    t.integer  "subscription_plan_id", :limit => 11
    t.integer  "account_id",           :limit => 11
    t.integer  "specials_limit",       :limit => 11
    t.integer  "renewal_period",       :limit => 11,                                :default => 1
    t.string   "billing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "testimonials", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.text     "quote"
    t.boolean  "active"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", :force => true do |t|
    t.integer  "account_id"
    t.string   "status"
    t.string   "priority"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",       :default => "NULL"
  end

  create_table "tips", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "identity_url"
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "phone",                     :limit => 20
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token",            :limit => 40
    t.string   "activation_code",           :limit => 40
    t.string   "state",                                    :default => "passive", :null => false
    t.datetime "remember_token_expires_at"
    t.datetime "activated_at"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
