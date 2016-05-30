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

ActiveRecord::Schema.define(version: 20160529232427) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string   "city_name"
    t.date     "date_founded"
    t.float    "population"
    t.string   "nicknames"
    t.string   "header_pic"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "team_id"
  end

  add_index "cities", ["team_id"], name: "index_cities_on_team_id", using: :btree

  create_table "memories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "age"
    t.date     "date"
    t.string   "hometown"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "team_id"
  end

  add_index "memories", ["team_id"], name: "index_memories_on_team_id", using: :btree
  add_index "memories", ["user_id"], name: "index_memories_on_user_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "team_name"
    t.date     "date_founded"
    t.string   "colors"
    t.integer  "total_championships"
    t.string   "history"
    t.string   "venue"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "city_id"
  end

  add_index "teams", ["city_id"], name: "index_teams_on_city_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "current_city"
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "cities", "teams"
  add_foreign_key "memories", "teams"
  add_foreign_key "memories", "users"
  add_foreign_key "teams", "cities"
end
