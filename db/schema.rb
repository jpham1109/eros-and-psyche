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

ActiveRecord::Schema.define(version: 2021_03_08_222004) do

  create_table "crushes", force: :cascade do |t|
    t.string "name"
    t.string "dob"
    t.string "compatibility"
    t.boolean "friend"
    t.string "sign"
    t.string "symbol"
    t.string "element"
    t.string "quality"
    t.string "details"
    t.string "positive"
    t.string "negative"
    t.integer "zodiac_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["zodiac_id"], name: "index_crushes_on_zodiac_id"
  end

  create_table "user_crushes", force: :cascade do |t|
    t.integer "crush_level"
    t.integer "user_id", null: false
    t.integer "crush_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["crush_id"], name: "index_user_crushes_on_crush_id"
    t.index ["user_id"], name: "index_user_crushes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "dob"
    t.string "sign"
    t.string "element"
    t.string "quality"
    t.string "traits"
    t.string "famous"
    t.integer "zodiac_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["zodiac_id"], name: "index_users_on_zodiac_id"
  end

  create_table "zodiacs", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "crushes", "zodiacs"
  add_foreign_key "user_crushes", "crushes"
  add_foreign_key "user_crushes", "users"
  add_foreign_key "users", "zodiacs"
end
