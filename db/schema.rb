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

ActiveRecord::Schema.define(:version => 20120705215549) do

  create_table "holes", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "match_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "hole_number"
  end

  add_index "holes", ["slug"], :name => "index_holes_on_slug"

  create_table "match_players", :force => true do |t|
    t.integer  "player_id"
    t.integer  "match_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "matches", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  add_index "matches", ["slug"], :name => "index_matches_on_slug"

  create_table "players", :force => true do |t|
    t.string   "username",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
