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

ActiveRecord::Schema.define(:version => 20130123203417) do

  create_table "campaigns", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "isClosed"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "origin"
    t.string   "destination"
    t.string   "base_airline"
    t.string   "comparative_airline"
    t.integer  "advance_days"
    t.integer  "length_of_stay"
    t.integer  "score"
  end

  create_table "campaigns_consumers", :id => false, :force => true do |t|
    t.integer "campaign_id"
    t.integer "consumer_id"
  end

  create_table "campaigns_templates", :id => false, :force => true do |t|
    t.integer "campaign_id"
    t.integer "template_id"
  end

  create_table "consumers", :force => true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "email"
    t.string   "location"
    t.string   "token"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "marketers", :force => true do |t|
    t.string   "apikey"
    t.string   "login"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "marketers_campaigns", :id => false, :force => true do |t|
    t.integer "marketer_id"
    t.integer "campaign_id"
  end

  create_table "templates", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.string   "firstName"
    t.string   "lastName"
    t.string   "optInKey"
    t.string   "optOutKey"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
