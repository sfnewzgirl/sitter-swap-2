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

ActiveRecord::Schema.define(version: 20161031025027) do

  create_table "families", force: :cascade do |t|
    t.string   "family_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["family_name"], name: "index_families_on_family_name"
  end

  create_table "family_people", force: :cascade do |t|
    t.integer  "role"
    t.integer  "family_id"
    t.integer  "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_id"], name: "index_family_people_on_family_id"
    t.index ["person_id"], name: "index_family_people_on_person_id"
  end

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "city"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email", "password_digest"], name: "index_people_on_email_and_password_digest"
    t.index ["email"], name: "index_people_on_email"
  end

end
