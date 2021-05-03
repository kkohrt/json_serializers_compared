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

ActiveRecord::Schema.define(version: 2021_04_28_180711) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer "addressable_id"
    t.string "addressable_type"
    t.string "street1"
    t.string "street2"
    t.string "city"
    t.string "state_or_region"
    t.string "postal_code"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "person_id"
    t.text "comment"
    t.boolean "reviewed"
    t.integer "commentable_id"
    t.string "commentable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name_displayed"
    t.string "name_internal"
    t.string "ukey"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "people", force: :cascade do |t|
    t.bigint "organization_id"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.date "birth_date"
    t.string "favorite_color"
    t.string "string"
    t.float "annual_income"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_people_on_organization_id"
  end

  create_table "phones", force: :cascade do |t|
    t.integer "phonable_id"
    t.string "phonable_type"
    t.string "classification", default: "cell_phone"
    t.string "nickname"
    t.boolean "can_text", default: false
    t.boolean "can_call", default: true
    t.datetime "disabled_at"
    t.boolean "shared", default: false
    t.integer "priority", default: 0
    t.string "number"
    t.string "extension"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["phonable_type", "phonable_id"], name: "index_phones_on_phonable_type_and_phonable_id"
  end

end
