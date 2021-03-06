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

ActiveRecord::Schema.define(version: 20170618131944) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "daily_cashes", force: :cascade do |t|
    t.string   "reason"
    t.string   "with_draw_date"
    t.integer  "money"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "from"
    t.string   "to"
  end

  create_table "detail_outputs", force: :cascade do |t|
    t.text     "content"
    t.integer  "money"
    t.integer  "daily_cash_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["daily_cash_id"], name: "index_detail_outputs_on_daily_cash_id", using: :btree
  end

  create_table "input_moneys", force: :cascade do |t|
    t.string   "user_name"
    t.integer  "money"
    t.string   "input_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "reason"
  end

  create_table "output_moneys", force: :cascade do |t|
    t.string   "user_name"
    t.integer  "money"
    t.date     "output_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "detail_outputs", "daily_cashes"
end
