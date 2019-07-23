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

ActiveRecord::Schema.define(version: 2019_07_23_040441) do

  create_table "members", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.date "birthdate"
    t.string "email"
    t.string "email1"
    t.string "tel"
    t.string "tel1"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "organizer"
  end

  create_table "parties", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "content"
    t.string "president"
    t.bigint "schedule_id"
    t.bigint "golfcourse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "member_id"
    t.string "password_digest"
    t.index ["golfcourse_id"], name: "index_parties_on_golfcourse_id"
    t.index ["member_id"], name: "index_parties_on_member_id"
    t.index ["schedule_id"], name: "index_parties_on_schedule_id"
  end

  create_table "registrations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "party_id"
    t.bigint "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_registrations_on_member_id"
    t.index ["party_id"], name: "index_registrations_on_party_id"
  end

  create_table "requests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "member_id"
    t.bigint "party_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["member_id"], name: "index_requests_on_member_id"
    t.index ["party_id"], name: "index_requests_on_party_id"
  end

  create_table "schedules", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "party_id"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.index ["party_id"], name: "index_schedules_on_party_id"
  end

  add_foreign_key "parties", "members"
  add_foreign_key "registrations", "members"
  add_foreign_key "registrations", "parties"
  add_foreign_key "requests", "members"
  add_foreign_key "requests", "parties"
  add_foreign_key "schedules", "parties"
end
