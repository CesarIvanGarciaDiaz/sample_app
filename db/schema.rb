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

ActiveRecord::Schema.define(version: 20170115151953) do

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "classification"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "financial_statements", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "withdrawal", default: 0
    t.integer  "deposit",    default: 0
    t.integer  "balance",    default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["account_id"], name: "index_financial_statements_on_account_id"
  end

  create_table "history_movements", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end


  create_table "movement_parents", force: :cascade do |t|
    t.integer  "movement_id"
    t.integer  "child_id"
    t.boolean  "parent"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["movement_id"], name: "index_movement_parents_on_movement_id"
  end

  create_table "movements", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "account_id"
    t.string   "concepto_de_pago"
    t.string   "reference"
    t.date     "date"
    t.string   "detail"
    t.integer  "category_id"
    t.float    "withdrawal"
    t.float    "deposit"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["account_id"], name: "index_movements_on_account_id"
    t.index ["category_id"], name: "index_movements_on_category_id"
    t.index ["user_id"], name: "index_movements_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
