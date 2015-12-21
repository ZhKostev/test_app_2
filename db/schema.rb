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

ActiveRecord::Schema.define(version: 20151221070756) do

  create_table "campaign_history_comments", force: :cascade do |t|
    t.integer  "campaign_id",     limit: 4
    t.integer  "api_campaign_id", limit: 4
    t.string   "comment",         limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "campaign_history_comments", ["api_campaign_id"], name: "api_campaign_id_index", using: :btree
  add_index "campaign_history_comments", ["campaign_id"], name: "campaign_id_index", using: :btree

  create_table "campaigns", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.date     "start_date"
    t.date     "end_date"
    t.float    "media_budget", limit: 24
    t.float    "media_spent",  limit: 24
    t.integer  "impressions",  limit: 4
    t.integer  "clicks",       limit: 4
    t.integer  "ctr",          limit: 4
    t.integer  "conversions",  limit: 4
    t.float    "ecpm",         limit: 24
    t.float    "ecpc",         limit: 24
    t.float    "ecpa",         limit: 24
    t.integer  "campaign_id",  limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "campaigns", ["campaign_id"], name: "campaign_id_index", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",           limit: 255, default: "", null: false
    t.string   "encrypted_password", limit: 255, default: "", null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
