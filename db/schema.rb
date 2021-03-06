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

ActiveRecord::Schema.define(version: 20151120122007) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advboards", force: :cascade do |t|
    t.string   "board",      default: "000000000"
    t.integer  "winner_id"
    t.boolean  "drawn",      default: false
    t.string   "moves"
    t.integer  "position"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "advgames", force: :cascade do |t|
    t.integer  "p1_id"
    t.integer  "p2_id"
    t.integer  "winner_id"
    t.boolean  "game_won",         default: false
    t.boolean  "game_drawn",       default: false
    t.integer  "current_player",   default: 1
    t.integer  "atttmainboard_id"
    t.integer  "advboard0_id"
    t.integer  "advboard1_id"
    t.integer  "advboard2_id"
    t.integer  "advboard3_id"
    t.integer  "advboard4_id"
    t.integer  "advboard5_id"
    t.integer  "advboard6_id"
    t.integer  "advboard7_id"
    t.integer  "advboard8_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "activeboard",      default: 10
    t.string   "availableboards",  default: "012345678"
  end

  create_table "attt_boards", force: :cascade do |t|
    t.string   "board",      default: "000000000"
    t.integer  "winner_id"
    t.boolean  "drawn",      default: false
    t.string   "moves"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "atttgames", force: :cascade do |t|
    t.integer  "p1_id"
    t.integer  "p2_id"
    t.integer  "winner_id"
    t.boolean  "game_won"
    t.boolean  "game_drawn"
    t.integer  "current_player"
    t.integer  "atttmainboard_id"
    t.integer  "atttboard0_id"
    t.integer  "atttboard1_id"
    t.integer  "atttboard2_id"
    t.integer  "atttboard3_id"
    t.integer  "atttboard4_id"
    t.integer  "atttboard5_id"
    t.integer  "atttboard6_id"
    t.integer  "atttboard7_id"
    t.integer  "atttboard8_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "c4boards", force: :cascade do |t|
    t.string   "r1",              default: "0000000"
    t.string   "r2",              default: "0000000"
    t.string   "r3",              default: "0000000"
    t.string   "r4",              default: "0000000"
    t.string   "r5",              default: "0000000"
    t.string   "r6",              default: "0000000"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "c4game_id"
    t.string   "available_moves", default: "0123456"
  end

  create_table "c4games", force: :cascade do |t|
    t.integer  "c4board_id"
    t.integer  "p1_id"
    t.integer  "p2_id"
    t.integer  "winner_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "turn",       default: 1
  end

  create_table "games", force: :cascade do |t|
    t.string   "moves"
    t.string   "board"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "p1_id"
    t.integer  "p2_id"
    t.integer  "move"
    t.integer  "winner"
  end

  create_table "games_users", id: false, force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "user_id", null: false
  end

  create_table "minesweepers", force: :cascade do |t|
    t.string   "board"
    t.string   "flagged"
    t.string   "bombs"
    t.integer  "user_id"
    t.boolean  "completed"
    t.boolean  "won"
    t.string   "numbers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mmgames", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "topboard"
    t.integer  "guesses_remaining"
    t.string   "board0",            default: "0000"
    t.string   "board1",            default: "0000"
    t.string   "board2",            default: "0000"
    t.string   "board3",            default: "0000"
    t.string   "board4",            default: "0000"
    t.string   "board5",            default: "0000"
    t.string   "board6",            default: "0000"
    t.string   "board7",            default: "0000"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "complete",          default: false
    t.boolean  "won",               default: false
    t.integer  "guess1"
    t.integer  "guess2"
    t.integer  "guess3"
    t.integer  "guess4"
  end

  create_table "rps", force: :cascade do |t|
    t.integer  "p1_id"
    t.integer  "p2_id"
    t.integer  "winner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "p1_move"
    t.integer  "p2_move"
  end

  create_table "rps_users", id: false, force: :cascade do |t|
    t.integer "rp_id",   null: false
    t.integer "user_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",                                      null: false
    t.string   "encrypted_password",     default: "",                                      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                                       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
    t.integer  "points",                 default: 0
    t.string   "role",                   default: "user"
    t.boolean  "human",                  default: true
    t.integer  "wins",                   default: 0
    t.integer  "draws",                  default: 0
    t.string   "computer_type",          default: "random"
    t.string   "user_image",             default: "http://lorempixel.com/400/400/people/"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
