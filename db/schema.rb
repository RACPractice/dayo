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

ActiveRecord::Schema.define(:version => 20130124173700) do

  create_table "accounts", :force => true do |t|
    t.string   "login"
    t.text     "description"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "billing_details_id"
    t.integer  "country_id"
    t.integer  "timezone_id"
  end

  add_index "accounts", ["billing_details_id"], :name => "index_accounts_on_billing_details_id"
  add_index "accounts", ["country_id"], :name => "index_accounts_on_country_id"
  add_index "accounts", ["login"], :name => "index_accounts_on_login", :unique => true
  add_index "accounts", ["timezone_id"], :name => "index_accounts_on_timezone_id"

  create_table "billing_details", :force => true do |t|
    t.string   "credits"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "bounces", :force => true do |t|
    t.string   "bounce_type"
    t.datetime "date"
    t.string   "reason"
    t.integer  "recipient_id"
    t.integer  "list_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "bounces", ["list_id"], :name => "index_bounces_on_list_id"
  add_index "bounces", ["recipient_id"], :name => "index_bounces_on_recipient_id"

  create_table "campaigns", :force => true do |t|
    t.string   "name"
    t.string   "subject"
    t.string   "from_email"
    t.string   "from_name"
    t.string   "reply_to"
    t.string   "html_url"
    t.string   "text_url"
    t.integer  "user_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "origin"
    t.string   "destination"
    t.string   "base_airlines"
    t.string   "comparative_airlines"
    t.integer  "advance_days"
    t.integer  "length_of_stay"
    t.integer  "score"
    t.boolean  "active",               :default => true
  end

  add_index "campaigns", ["name"], :name => "index_campaigns_on_name"
  add_index "campaigns", ["user_id"], :name => "index_campaigns_on_user_id"

  create_table "campaigns_lists", :id => false, :force => true do |t|
    t.integer "campaign_id", :null => false
    t.integer "list_id",     :null => false
  end

  add_index "campaigns_lists", ["campaign_id", "list_id"], :name => "index_campaigns_lists_on_campaign_id_and_list_id", :unique => true

  create_table "campaigns_schedules", :id => false, :force => true do |t|
    t.integer "campaign_id", :null => false
    t.integer "schedule_id", :null => false
  end

  add_index "campaigns_schedules", ["campaign_id", "schedule_id"], :name => "index_campaigns_schedules_on_campaign_id_and_schedule_id", :unique => true

  create_table "complains", :force => true do |t|
    t.datetime "date"
    t.text     "description"
    t.integer  "recipient_id"
    t.integer  "list_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "complains", ["list_id"], :name => "index_complains_on_list_id"
  add_index "complains", ["recipient_id"], :name => "index_complains_on_recipient_id"

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "countries", ["name"], :name => "index_countries_on_name"

  create_table "lists", :force => true do |t|
    t.string   "title"
    t.string   "unsubscribe_link"
    t.string   "unsubscribe_settings"
    t.boolean  "confim_option"
    t.string   "confirmation_success_page"
    t.string   "list_identifier"
    t.integer  "user_id",                   :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "lists", ["title"], :name => "index_lists_on_title"
  add_index "lists", ["unsubscribe_link"], :name => "index_lists_on_unsubscribe_link"
  add_index "lists", ["user_id"], :name => "index_lists_on_user_id"

  create_table "marketers", :force => true do |t|
    t.string   "apikey"
    t.string   "login"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "recipients", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "visited_link",  :default => false, :null => false
    t.boolean  "spam_complain", :default => false, :null => false
    t.boolean  "forwarded",     :default => false, :null => false
    t.boolean  "liked",         :default => false, :null => false
    t.text     "mention"
    t.integer  "list_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "recipients", ["email"], :name => "index_recipients_on_email"
  add_index "recipients", ["list_id"], :name => "index_recipients_on_list_id"
  add_index "recipients", ["name"], :name => "index_recipients_on_name"

  create_table "schedules", :force => true do |t|
    t.datetime "stating_date"
    t.datetime "ending_date"
    t.string   "frequence"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "templates", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.string   "preview_url"
    t.integer  "campaign_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "templates", ["campaign_id"], :name => "index_templates_on_campaign_id"
  add_index "templates", ["name"], :name => "index_templates_on_name"
  add_index "templates", ["user_id"], :name => "index_templates_on_user_id"

  create_table "timezones", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "timezones", ["name"], :name => "index_timezones_on_name"

  create_table "unsubscibes", :force => true do |t|
    t.datetime "date"
    t.integer  "recipient_id"
    t.integer  "list_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "unsubscibes", ["list_id"], :name => "index_unsubscibes_on_list_id"
  add_index "unsubscibes", ["recipient_id"], :name => "index_unsubscibes_on_recipient_id"

  create_table "user_billing_details", :force => true do |t|
    t.boolean  "can_purchase_credits"
    t.integer  "credits"
    t.float    "markup_on_design_spam_test"
    t.boolean  "client_pays"
    t.float    "base_rate_per_recipient"
    t.float    "markup_per_recipient"
    t.float    "markup_on_delivery"
    t.float    "base_delivery_rate"
    t.string   "currency"
    t.float    "base_design_spam_test_rate"
    t.string   "monthly_scheme"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "account_id"
    t.integer  "timezone_id"
    t.integer  "billing_detail_id"
  end

  add_index "users", ["account_id"], :name => "index_users_on_account_id"
  add_index "users", ["billing_detail_id"], :name => "index_users_on_billing_detail_id"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["timezone_id"], :name => "index_users_on_timezone_id"

end
