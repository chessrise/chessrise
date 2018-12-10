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

ActiveRecord::Schema.define(version: 2018_12_10_102947) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "commenter"
    t.bigint "ply_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ply_id"], name: "index_comments_on_ply_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "event"
    t.string "site"
    t.date "date"
    t.integer "round"
    t.string "result"
    t.integer "ply_count_total"
    t.string "eco_code"
    t.text "initial_position"
    t.integer "elo_white"
    t.integer "elo_black"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "white_player_id"
    t.integer "black_player_id"
    t.string "name"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plies", force: :cascade do |t|
    t.bigint "game_id"
    t.integer "ply_count"
    t.string "move"
    t.text "fen"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parent_id"
    t.string "searchable_fen"
    t.index ["game_id"], name: "index_plies_on_game_id"
    t.index ["searchable_fen"], name: "index_plies_on_searchable_fen"
  end

  create_table "tags", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "collection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_tags_on_collection_id"
    t.index ["game_id"], name: "index_tags_on_game_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "collections", "users"
  add_foreign_key "comments", "plies"
  add_foreign_key "games", "players", column: "black_player_id"
  add_foreign_key "games", "players", column: "white_player_id"
  add_foreign_key "plies", "games"
  add_foreign_key "plies", "plies", column: "parent_id"
  add_foreign_key "plies", "plies", column: "parent_id"
  add_foreign_key "tags", "collections"
  add_foreign_key "tags", "games"
end
