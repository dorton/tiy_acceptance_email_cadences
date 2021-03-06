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

ActiveRecord::Schema.define(version: 20170616190252) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: :cascade do |t|
    t.datetime "date"
    t.string   "title"
    t.string   "location"
    t.integer  "cohort_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "description"
    t.boolean  "meetup",      default: false, null: false
    t.string   "host_group"
    t.string   "event_url"
    t.index ["cohort_id"], name: "index_announcements_on_cohort_id", using: :btree
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "code_challenges", force: :cascade do |t|
    t.string   "newline_url"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "weeks_out"
  end

  create_table "cohorts", force: :cascade do |t|
    t.date     "start_date"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "email_body"
    t.index ["user_id"], name: "index_cohorts_on_user_id", using: :btree
  end

  create_table "sent_emails", force: :cascade do |t|
    t.string   "body"
    t.date     "sent_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "cohort_id"
    t.index ["cohort_id"], name: "index_sent_emails_on_cohort_id", using: :btree
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.boolean  "down_payment",         default: false
    t.boolean  "financially_cleared",  default: false
    t.boolean  "enrollment_agreement", default: false
    t.boolean  "transcript",           default: false
    t.boolean  "yes_we_code",          default: false
    t.integer  "cohort_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.boolean  "do_not_send",          default: false
    t.index ["cohort_id"], name: "index_students_on_cohort_id", using: :btree
  end

  create_table "user_cohorts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "cohort_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cohort_id"], name: "index_user_cohorts_on_cohort_id", using: :btree
    t.index ["user_id"], name: "index_user_cohorts_on_user_id", using: :btree
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
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "city_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "announcements", "cohorts"
  add_foreign_key "cohorts", "users"
  add_foreign_key "sent_emails", "cohorts"
  add_foreign_key "students", "cohorts"
  add_foreign_key "user_cohorts", "cohorts"
  add_foreign_key "user_cohorts", "users"
end
