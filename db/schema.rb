# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_30_063625) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string "title"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statistics", force: :cascade do |t|
    t.bigint "album_id"
    t.integer "quantity", default: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_statistics_on_album_id"
  end

  create_table "track_quantities", force: :cascade do |t|
    t.bigint "track_id"
    t.integer "quantity", default: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["track_id"], name: "index_track_quantities_on_track_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "title"
    t.float "price"
    t.integer "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "time", default: 1.0
    t.float "rate", default: 0.0
    t.integer "download_times", default: 0
  end

  add_foreign_key "statistics", "albums"
  add_foreign_key "track_quantities", "tracks"
end
