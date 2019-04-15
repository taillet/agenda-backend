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

ActiveRecord::Schema.define(version: 2019_04_05_130435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categoryevents", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categoryevents_on_category_id"
    t.index ["event_id"], name: "index_categoryevents_on_event_id"
  end

  create_table "categorynotes", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "note_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categorynotes_on_category_id"
    t.index ["note_id"], name: "index_categorynotes_on_note_id"
  end

  create_table "categorytodos", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "to_do_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categorytodos_on_category_id"
    t.index ["to_do_item_id"], name: "index_categorytodos_on_to_do_item_id"
  end

  create_table "days", force: :cascade do |t|
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "start"
    t.integer "end"
    t.boolean "checked", default: false
    t.string "priority"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end"], name: "index_events_on_end"
    t.index ["start"], name: "index_events_on_start"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.bigint "day_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id"], name: "index_notes_on_day_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "to_do_items", force: :cascade do |t|
    t.string "description"
    t.string "priority"
    t.boolean "checked", default: false
    t.bigint "user_id"
    t.bigint "day_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id"], name: "index_to_do_items_on_day_id"
    t.index ["user_id"], name: "index_to_do_items_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "categoryevents", "categories"
  add_foreign_key "categoryevents", "events"
  add_foreign_key "categorynotes", "categories"
  add_foreign_key "categorynotes", "notes"
  add_foreign_key "categorytodos", "categories"
  add_foreign_key "categorytodos", "to_do_items"
  add_foreign_key "events", "users"
  add_foreign_key "notes", "days"
  add_foreign_key "notes", "users"
  add_foreign_key "to_do_items", "days"
  add_foreign_key "to_do_items", "users"
end
