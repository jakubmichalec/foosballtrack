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

ActiveRecord::Schema.define(version: 20150915235150) do

  create_table "matches", force: :cascade do |t|
    t.date     "match_date"
    t.integer  "home_player_id"
    t.integer  "away_player_id"
    t.integer  "home_score"
    t.integer  "away_score"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "matches", ["away_player_id"], name: "index_matches_on_away_player_id"
  add_index "matches", ["home_player_id"], name: "index_matches_on_home_player_id"

  create_table "players", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "avatar"
    t.string   "nickname"
    t.float    "rating",     default: 0.0
  end

  add_index "players", ["nickname"], name: "index_players_on_nickname", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
