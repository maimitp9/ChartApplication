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

ActiveRecord::Schema.define(version: 20160720040312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "competition_results", force: :cascade do |t|
    t.integer  "sporter_id"
    t.integer  "competition_id"
    t.integer  "place"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "competition_results", ["competition_id"], name: "index_competition_results_on_competition_id", using: :btree
  add_index "competition_results", ["sporter_id"], name: "index_competition_results_on_sporter_id", using: :btree

  create_table "competitions", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profit_losses", force: :cascade do |t|
    t.integer "ki"
    t.integer "tenpo"
    t.integer "pl_month"
    t.decimal "rieki"
  end

  create_table "sales", force: :cascade do |t|
    t.integer "ki"
    t.integer "tenpo"
    t.integer "sale_month"
    t.decimal "uriage"
  end

  create_table "sporters", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sporters", ["country_id"], name: "index_sporters_on_country_id", using: :btree

  create_table "visits", force: :cascade do |t|
    t.string   "country"
    t.datetime "visited_at"
    t.decimal  "load_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "competition_results", "competitions"
  add_foreign_key "competition_results", "sporters"
  add_foreign_key "sporters", "countries"
end
